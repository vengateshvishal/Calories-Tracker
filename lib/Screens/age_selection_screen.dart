import 'package:calorie_tracker/Screens/recomanded_pfc_screen.dart';
import 'package:calorie_tracker/database/post_database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AgeSelectionScreen extends StatefulWidget {
  const AgeSelectionScreen({super.key});

  @override
  State<AgeSelectionScreen> createState() => _AgeSelectionScreenState();
}

class _AgeSelectionScreenState extends State<AgeSelectionScreen> {
  final TextEditingController _ageController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

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
                "What’s your age?",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1D2125),
                ),
              ),
              const SizedBox(height: 12),
              // Subtitle
              const Text(
                "Required number of calories varies\nwith age",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, color: Colors.grey, height: 1.4),
              ),

              const Spacer(),

              // Input Section
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  SizedBox(
                    width: 100,
                    child: Form(
                      key: _formKey,
                      child: TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Enter Age ';
                          }
                          return null;
                        },
                        controller: _ageController,
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        cursorColor: const Color(0xFF42D29D),
                        style: const TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.w500,
                        ),
                        decoration: const InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xFF42D29D),
                              width: 2,
                            ),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xFF42D29D),
                              width: 2,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  const Padding(
                    padding: EdgeInsets.only(bottom: 8.0),
                    child: Text(
                      "Years",
                      style: TextStyle(
                        fontSize: 18,
                        color: Color(0xFF42D29D),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),

              const Spacer(flex: 2),

              // Bottom Navigation Row
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Back Button
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text(
                        "Back",
                        style: TextStyle(fontSize: 18, color: Colors.grey),
                      ),
                    ),

                    // Forward FAB
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          if (_formKey.currentState!.validate()) {
            String Id = FirebaseAuth.instance.currentUser!.uid;
            // print(actives[selectedIndex]);
            print(Id);
            Map<String, dynamic> userActive = {"Age": _ageController.text};
            final result = await DatabaseMethod().addUserAge(userActive, Id);
            if (result == "Sucess") {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => RecomandedPfcScreen()),
              );
            }
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
