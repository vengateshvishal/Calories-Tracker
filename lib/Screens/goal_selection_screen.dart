import 'package:calorie_tracker/Screens/gender_selection_screen.dart';
import 'package:calorie_tracker/database/post_database.dart';
import 'package:calorie_tracker/services/preferences.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class GoalSelectionScreen extends StatefulWidget {
  const GoalSelectionScreen({super.key});

  @override
  State<GoalSelectionScreen> createState() => _GoalSelectionScreenState();
}

class _GoalSelectionScreenState extends State<GoalSelectionScreen> {
  // Track the selected index
  int selectedIndex = 1; // Defaulting to 'Gain weight' as per the image

  final List<String> goals = ["Lose weight", "Keep weight", "Gain weight"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            children: [
              const SizedBox(height: 40),
              // Header Title
              const Text(
                "What’s you goal?",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1D2125),
                ),
              ),
              const SizedBox(height: 12),
              // Subtitle
              const Text(
                "We will calculate daily calories\naccording to your goal",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, color: Colors.grey, height: 1.4),
              ),

              const Spacer(),

              // Goal Options
              Column(
                children: goals.asMap().entries.map((entry) {
                  int idx = entry.key;
                  String val = entry.value;

                  return GestureDetector(
                    onTap: () => setState(() => selectedIndex = idx),
                    child: Container(
                      width: double.infinity,
                      margin: const EdgeInsets.symmetric(vertical: 8),
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: selectedIndex == idx
                              ? const Color(0xFF42D29D)
                              : Colors.transparent,
                          width: 1.5,
                        ),
                      ),
                      child: Text(
                        val,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF1D2125),
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
              Spacer(flex: 2),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          String Id = FirebaseAuth.instance.currentUser!.uid;
          print(goals[selectedIndex]);
          print(Id);
          Map<String, dynamic> userGoal = {"Goal": goals[selectedIndex]};
          final result = await DatabaseMethod().addUserGoal(userGoal, Id);

          if (result == "Sucess") {
            SharedPreferencesHelper().setGoal(goals[selectedIndex]);
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => GenderSelectionScreen()),
            );
          }
        },
        backgroundColor: Color(0xff35cc8c),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50.0),
        ),
        child: FaIcon(FontAwesomeIcons.angleRight, color: Colors.white),
      ),
    );
  }
}
