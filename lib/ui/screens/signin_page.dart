import 'package:flutter/material.dart';
import 'package:recipe_app/backend/auth_methods.dart';
import 'package:recipe_app/constants.dart';
import 'package:recipe_app/ui/root_page.dart';
import 'package:recipe_app/ui/screens/forgot_password.dart';
import 'package:recipe_app/ui/screens/signup_page.dart';
import 'package:page_transition/page_transition.dart';
import 'package:recipe_app/ui/screens/widgets/custom_textfield.dart';

class SignIn extends StatelessWidget {
  // const keyword is deleted from const constructor(SignIn)
  SignIn({Key? key}) : super(key: key);

  String email = "";
  String password = "";

  final AuthMethods _authMethods = AuthMethods();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: SingleChildScrollView(
          child: Row(
            //mainAxisAlignment: MainAxisAlignment.center,
            //crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset('assets/images/signin.png'),
              SizedBox(
                width: size.width * 0.2,
                height: size.height * 0.5,
                child: const Text(
                  'Giriş Yap',
                  style: TextStyle(
                    fontSize: 35.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              CustomTextfield(
                func: (val) {
                  email = val;
                },
                obscureText: false,
                hintText: 'Email',
                icon: Icons.alternate_email,
              ),
              CustomTextfield(
                func: (val) {
                  password = val;
                },
                obscureText: true,
                hintText: 'Şifre',
                icon: Icons.lock,
              ),
              const SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: () async {},
                child: Container(
                  width: size.width * 0.1,
                  decoration: BoxDecoration(
                    color: Constants.primaryColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                  child: Center(
                    child: ElevatedButton(
                      onPressed: () async {
                        bool result =
                            await _authMethods.signInWithEmail(email, password);
                        if (result) {
                          Navigator.pushReplacement(
                            context,
                            PageTransition(
                                child: const RootPage(),
                                type: PageTransitionType.bottomToTop),
                          );
                        }
                      },
                      child: const Text(
                        'Giriş Yap',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    PageTransition(
                        child: const ForgotPassword(),
                        type: PageTransitionType.bottomToTop),
                  );
                },
                child: Center(
                  child: Text.rich(
                    TextSpan(children: [
                      TextSpan(
                        text: 'Şifreni unuttuysan',
                        style: TextStyle(
                          color: Constants.blackColor,
                        ),
                      ),
                      TextSpan(
                        text: ' Buradan Sıfırla',
                        style: TextStyle(
                          color: Constants.primaryColor,
                        ),
                      ),
                    ]),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              /*
              Row(
                children: const [
                  Expanded(child: Divider()),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Text('Veya'),
                  ),
                  Expanded(child: Divider()),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                width: size.width,
                decoration: BoxDecoration(
                    border: Border.all(color: Constants.primaryColor),
                    borderRadius: BorderRadius.circular(10)),
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      height: 30,
                      child: Image.asset('assets/images/google.png'),
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        /**/ bool result =
                            await _authMethods.signInWithGoogle();
                        if (result) {
                          Navigator.pushReplacement(
                            context,
                            PageTransition(
                                child: const RootPage(),
                                type: PageTransitionType.bottomToTop),
                          );
                        }
                      },
                      child: Text(
                        'Google ile Giriş Yap',
                        style: TextStyle(
                          color: Constants.blackColor,
                          fontSize: 18.0,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(
                      context,
                      PageTransition(
                          child: SignUp(),
                          type: PageTransitionType.bottomToTop));
                },
                child: Center(
                  child: Text.rich(
                    TextSpan(children: [
                      TextSpan(
                        text: "Herbarist'te yeni misin? ",
                        style: TextStyle(
                          color: Constants.blackColor,
                        ),
                      ),
                      TextSpan(
                        text: 'Üye Ol',
                        style: TextStyle(
                          color: Constants.primaryColor,
                        ),
                      ),
                    ]),
                  ),
                ),
              ), */ /**/
            ],
          ),
        ),
      ),
    );
  }
}
