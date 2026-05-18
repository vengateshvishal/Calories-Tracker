import 'package:calorie_tracker/Screens/age_selection_screen.dart';
import 'package:calorie_tracker/database/post_database.dart';
import 'package:calorie_tracker/services/preferences.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class WeightSelectionScreen extends StatefulWidget {
  const WeightSelectionScreen({super.key});

  @override
  State<WeightSelectionScreen> createState() => _WeightSelectionScreenState();
}

class _WeightSelectionScreenState extends State<WeightSelectionScreen> {
  final _formKey = GlobalKey<FormState>();
  bool isKg = true;
  final TextEditingController _weightController = TextEditingController();

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
              const Text(
                "What's your weight?",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 12),
              const Text(
                "The more you weigh, the more\ncalories your body burns",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
              const Spacer(),

              // Input Area
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
                            return 'Enter Weight';
                          }
                        },

                        controller: _weightController,
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        cursorColor: const Color(0xFF42D29D),
                        style: const TextStyle(
                          fontSize: 20,
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
                  const SizedBox(width: 10),

                  // Unit Dropdown
                  PopupMenuButton<bool>(
                    onSelected: (bool value) => setState(() => isKg = value),
                    offset: const Offset(0, 40),
                    color: Colors.white, // White background
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            isKg ? "kg" : "lb",
                            style: const TextStyle(
                              color: Color(0xFF42D29D),
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const Icon(
                            Icons.arrow_drop_down,
                            color: Colors.black,
                          ),
                        ],
                      ),
                    ),
                    itemBuilder: (context) => [
                      _buildPopupItem(value: true, label: "Kilograms (kg)"),
                      _buildPopupItem(value: false, label: "Pounds (lb)"),
                    ],
                  ),
                ],
              ),

              const Spacer(flex: 2),

              // Navigation
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text(
                        "Back",
                        style: TextStyle(color: Colors.grey, fontSize: 18),
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
          if (_formKey.currentState!.validate()) {
            double finalResult = 0;
            if (isKg) {
              setState(() {
                finalResult += int.parse(_weightController.text);
              });
            } else {
              setState(() {
                finalResult +=
                    ((int.parse(_weightController.text)) * 0.45359237);
              });
            }

            final String weightString = "$finalResult";
            String Id = FirebaseAuth.instance.currentUser!.uid;
            print(Id);
            Map<String, dynamic> userWeight = {"Weight": weightString};
            final result = await DatabaseMethod().addUserWeight(userWeight, Id);
            if (result == "Sucess") {
              SharedPreferencesHelper().setWeight(weightString);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AgeSelectionScreen()),
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

  PopupMenuItem<bool> _buildPopupItem({
    required bool value,
    required String label,
  }) {
    return PopupMenuItem<bool>(
      value: value,
      child: Text(
        label,
        style: const TextStyle(
          color: Colors.black, // Black text
          fontSize: 16,
        ),
      ),
    );
  }
}
