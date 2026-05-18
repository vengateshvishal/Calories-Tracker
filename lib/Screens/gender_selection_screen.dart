import 'package:calorie_tracker/Screens/active_selection_screen.dart';
import 'package:calorie_tracker/database/post_database.dart';
import 'package:calorie_tracker/services/preferences.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class GenderSelectionScreen extends StatefulWidget {
  const GenderSelectionScreen({super.key});

  @override
  State<GenderSelectionScreen> createState() => _GenderSelectionScreenState();
}

class _GenderSelectionScreenState extends State<GenderSelectionScreen> {
  // 0 for Male, 1 for Female. Initialized to 0 (Male) as per the image focus.
  int selectedIndex = 0;

  final List<String> genders = ["Male", "Female"];

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
              // Main Title
              const Text(
                "What’s your gender?",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1D2125),
                ),
              ),
              const SizedBox(height: 12),
              // Contextual Subtitle
              const Text(
                "Male bodies need more calories",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),

              const Spacer(),

              // Gender Options
              Column(
                children: genders.asMap().entries.map((entry) {
                  int idx = entry.key;
                  String label = entry.value;

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
                        label,
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

              const Spacer(flex: 2),

              // Bottom Navigation Row
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Back Text Button
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text(
                        "Back",
                        style: TextStyle(fontSize: 18, color: Colors.grey),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          String Id = FirebaseAuth.instance.currentUser!.uid;
          print(genders[selectedIndex]);
          print(Id);
          Map<String, dynamic> userGender = {"Gender": genders[selectedIndex]};
          final result = await DatabaseMethod().addUserGender(userGender, Id);

          if (result == "Sucess") {
            SharedPreferencesHelper().setGender(genders[selectedIndex]);
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ActiveSelectionScreen()),
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
