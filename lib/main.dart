import 'package:calorie_tracker/onboarding_screens/onboarding_screen_1.dart';
import 'package:calorie_tracker/welcome_screens/welcome_screen_1.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'firebase_options.dart';

void main() async {
  // Add this line FIRST
  WidgetsFlutterBinding.ensureInitialized();
  
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // GoogleSignIn(
  //   serverClientId: '203851882905-8e3t1akrltcs1p393ptrnvdscpst8s3p.apps.googleusercontent.com',
  // ).signIn();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: OnboardingScreen1(),
    );
  }
}
