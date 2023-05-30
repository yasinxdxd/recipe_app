import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:recipe_app/ui/screens/profile_page.dart';

class AuthMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Stream<User?> get authChanges => _auth.authStateChanges();

  Future<bool> signInWithGoogle() async {
    bool result = false;

    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      UserCredential userCredential =
          await _auth.signInWithCredential(credential);

      User? user = userCredential.user;

      if (user != null) {
        if (userCredential.additionalUserInfo!.isNewUser) {
          await _firestore.collection('users').doc(user.uid).set({
            'username': user.displayName,
            'uid': user.uid,
            'progilePhoto': user.photoURL,
          });
        }
        result = true;
      }
    } on FirebaseAuthException catch (e) {
      result = false;
      print(e.message);
    }
    return result;
  }

  Future<bool> signUpWithEmail(
      String email, String password, String fullName) async {
    bool result = false;

    try {
      final credential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      result = true;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }

    if (result) {
      try {
        Map<String, dynamic> userData = Map();
        userData["email"] = email;
        userData["name"] = fullName;
        _firestore.collection("Users").add(userData);
      } catch (e) {}
    }

    return result;
  }

  Future<bool> signInWithEmail(String email, String password) async {
    bool result = false;

    try {
      final credential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      result = true;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }

    return result;
  }

  void setFullNameAccordingToEmail(String email) async {
    //try {
    ProfileUserData.fullName =
        await _firestore.collection("Users").get().then((querySnapshot) {
      for (var i = 0; i < querySnapshot.docs.length; i++) {
        String docEmail = querySnapshot.docs[i]["email"].toString();
        if (email.compareTo(docEmail) == 0) {
          ProfileUserData.fullName = querySnapshot.docs[i]["name"].toString();
          return ProfileUserData.fullName;
        }
      }
      return "";
    });
    //} catch (e) {}

    //return name;
  }
}
