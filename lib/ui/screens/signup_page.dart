import 'package:flutter/material.dart';
import 'package:recipe_app/constants.dart';
import 'package:recipe_app/ui/screens/widgets/custom_textfield.dart';
import 'package:recipe_app/ui/screens/signin_page.dart';
import 'package:page_transition/page_transition.dart';
import 'package:recipe_app/backend/auth_methods.dart';

class SignUp extends StatelessWidget {
  SignUp({Key? key}) : super(key: key);

  String email = "";
  String fullName = "";
  String password = "";

  final AuthMethods _authMethods = AuthMethods();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
        child: SingleChildScrollView(
          child: Row(
            children: [
              SizedBox(
                width: size.width / 4,
              ),
              SizedBox(
                width: size.width / 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset('assets/images/logo.png'),
                    const Text(
                      'Sign Up',
                      style: TextStyle(
                        fontSize: 35.0,
                        fontWeight: FontWeight.w700,
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
                      hintText: 'Enter Email',
                      icon: Icons.alternate_email,
                    ),
                    CustomTextfield(
                      func: (val) {
                        fullName = val;
                      },
                      obscureText: false,
                      hintText: 'Enter Full name',
                      icon: Icons.person,
                    ),
                    CustomTextfield(
                      func: (val) {
                        password = val;
                      },
                      obscureText: true,
                      hintText: 'Enter Password',
                      icon: Icons.lock,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    GestureDetector(
                      onTap: () async {
                        print(email);
                        print(fullName);
                        print(password);
                        bool result = await _authMethods.signUpWithEmail(
                            email, password, fullName);
                        print(result);
                        if (result) {
                          Navigator.pushReplacement(
                            context,
                            PageTransition(
                                child: const SignIn(),
                                type: PageTransitionType.bottomToTop),
                          );
                        }
                      },
                      child: Container(
                        width: size.width,
                        decoration: BoxDecoration(
                          color: Constants.primaryColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 20),
                        child: const Center(
                          child: Text(
                            'Sign Up.',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Row(
                      children: [
                        Expanded(child: Divider()),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Text('OR'),
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
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 30,
                            child: Image.asset('assets/images/google.png'),
                          ),
                          const SizedBox(
                            width: 30,
                          ),
                          Text(
                            'Sign Up with Google',
                            style: TextStyle(
                              color: Constants.blackColor,
                              fontSize: 18.0,
                            ),
                          ),
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
                                child: const SignIn(),
                                type: PageTransitionType.bottomToTop));
                      },
                      child: Center(
                        child: Text.rich(
                          TextSpan(children: [
                            TextSpan(
                              text: 'Have an Account? ',
                              style: TextStyle(
                                color: Constants.blackColor,
                              ),
                            ),
                            TextSpan(
                              text: 'Login',
                              style: TextStyle(
                                color: Constants.primaryColor,
                              ),
                            ),
                          ]),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
