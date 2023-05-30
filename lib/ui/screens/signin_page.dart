import 'package:flutter/material.dart';
import 'package:recipe_app/backend/auth_methods.dart';
import 'package:recipe_app/constants.dart';
import 'package:recipe_app/ui/root_page.dart';
import 'package:recipe_app/ui/screens/forgot_password.dart';
import 'package:recipe_app/ui/screens/profile_page.dart';
import 'package:recipe_app/ui/screens/signup_page.dart';
import 'package:page_transition/page_transition.dart';
import 'package:recipe_app/ui/screens/widgets/custom_textfield.dart';

class SignIn extends StatefulWidget {
  // const keyword is deleted from const constructor(SignIn)
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  String email = "";

  String password = "";

  final AuthMethods _authMethods = AuthMethods();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: size.width / 2,
              height: size.height,
              child: Image.asset('assets/images/signin.png'),
            ),
            SizedBox(
              width: size.width / 16,
            ),
            Column(
              children: [
                SizedBox(
                  width: size.width / 4,
                  height: size.height / 8,
                ),
                const Text(
                  'Sign In',
                  style: TextStyle(
                    fontSize: 35.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                SizedBox(
                  width: size.width / 4,
                  height: size.height / 8,
                  child: CustomTextfield(
                    func: (val) {
                      email = val;
                    },
                    obscureText: false,
                    hintText: 'Email',
                    icon: Icons.alternate_email,
                  ),
                ),
                SizedBox(
                  width: size.width / 4,
                  height: size.height / 8,
                  child: CustomTextfield(
                    func: (val) {
                      password = val;
                    },
                    obscureText: true,
                    hintText: 'Şifre',
                    icon: Icons.lock,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                GestureDetector(
                  onTap: () async {
                    bool result =
                        await _authMethods.signInWithEmail(email, password);

                    if (result) {
                      setState(() {
                        ProfileUserData.email = email;
                        _authMethods.setFullNameAccordingToEmail(email);
                      });
                      Navigator.pushReplacement(
                        context,
                        PageTransition(
                            child: const RootPage(),
                            type: PageTransitionType.bottomToTop),
                      );
                    }
                  },
                  child: Container(
                    width: size.width * 0.1,
                    decoration: BoxDecoration(
                      color: Constants.primaryColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 20,
                    ),
                    child: const Center(
                      child: Text(
                        'Sign In',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
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
                      TextSpan(
                        children: [
                          TextSpan(
                            text: 'Forgot your password?',
                            style: TextStyle(
                              color: Constants.blackColor,
                            ),
                          ),
                          TextSpan(
                            text: ' Reset password',
                            style: TextStyle(
                              color: Constants.primaryColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: size.width / 4,
                  height: size.height / 8,
                  child: const Row(
                    children: [
                      Expanded(child: Divider()),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Text('OR'),
                      ),
                      Expanded(child: Divider()),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  width: size.width / 4,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Constants.primaryColor,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 15,
                  ),
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
                        child: Center(
                          child: Text(
                            'Sign In with Google',
                            style: TextStyle(
                              color: Constants.blackColor,
                              fontSize: 18.0,
                            ),
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
                          text: "Are you new to recipe? ",
                          style: TextStyle(
                            color: Constants.blackColor,
                          ),
                        ),
                        TextSpan(
                          text: 'Sign Up',
                          style: TextStyle(
                            color: Constants.primaryColor,
                          ),
                        ),
                      ]),
                    ),
                  ),
                ), /**/
              ],
            ),
          ],
        ),
      ),
    );
  }
}
