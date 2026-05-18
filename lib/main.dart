import 'package:calorie_tracker/Screens/rootScreen.dart';
import 'package:calorie_tracker/firebase_options.dart';
import 'package:calorie_tracker/onboarding_screens/onboarding_screen_1.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:calorie_tracker/models/food_data.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await loadFoodData();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return const Rootscreen();
          }
          print(snapshot.hasData);
          return OnboardingScreen1();
        },
      ),
    );
  }
}
