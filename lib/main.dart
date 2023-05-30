import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
//import 'package:recipe_app/ui/root_page.dart';
//import 'package:recipe_app/ui/screens/signin_page.dart';
import 'ui/onboarding_screen.dart';
import 'firebase_options.dart';

void main() async {
  //WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.web,
  );
  //initilization of Firebase app

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Recipe',
      home: OnboardingScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
