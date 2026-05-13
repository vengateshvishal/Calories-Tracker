import 'package:calorie_tracker/Screens/weight_selection_screen.dart';
import 'package:calorie_tracker/database/post_database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HeightSelectionScreen extends StatefulWidget {
  const HeightSelectionScreen({super.key});

  @override
  State<HeightSelectionScreen> createState() => _HeightSelectionScreenState();
}

class _HeightSelectionScreenState extends State<HeightSelectionScreen> {
  bool isMetric = true;

  // Measurement Values
  int selectedMeters = 1;
  int selectedCm = 70;
  int selectedFeet = 5;
  int selectedInches = 7;

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
                "How tall are you?",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 12),
              const Text(
                "The taller you are, the more calories\nyour body needs",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
              const Spacer(),

              // Layout Row for Pickers
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Left Wheel (m/ft)
                  _buildWheel(
                    key: ValueKey(isMetric ? 'm' : 'ft'),
                    min: isMetric ? 1 : 3,
                    max: isMetric ? 2 : 8,
                    currentValue: isMetric ? selectedMeters : selectedFeet,
                    onChanged: (val) => setState(() {
                      isMetric ? selectedMeters = val : selectedFeet = val;
                    }),
                  ),
                  _buildUnitStaticLabel(isMetric ? "m" : "Feet"),

                  const SizedBox(width: 15),

                  // Right Wheel (cm/in)
                  _buildWheel(
                    key: ValueKey(isMetric ? 'cm' : 'in'),
                    min: 0,
                    max: isMetric ? 99 : 11,
                    currentValue: isMetric ? selectedCm : selectedInches,
                    onChanged: (val) => setState(() {
                      isMetric ? selectedCm = val : selectedInches = val;
                    }),
                  ),

                  // PopupMenuButton with White Background and Black Text
                  PopupMenuButton<bool>(
                    onSelected: (bool value) =>
                        setState(() => isMetric = value),
                    padding: EdgeInsets.zero,
                    offset: const Offset(0, 40),
                    color: Colors.white, // Background of the dropdown menu
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          isMetric ? "cm" : "Inches",
                          style: const TextStyle(
                            color: Color(0xFF42D29D),
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const Icon(
                          Icons.arrow_drop_down,
                          color: Colors.black,
                          size: 24,
                        ),
                      ],
                    ),
                    itemBuilder: (context) => [
                      _buildPopupItem(value: true, label: "Metric (cm)"),
                      _buildPopupItem(value: false, label: "Imperial (in)"),
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
          final h1 = isMetric ? selectedMeters : selectedFeet;
          final h2 = isMetric ? selectedCm : selectedInches;
          final unit1 = isMetric ? "M" : "Feet";
          final unit2 = isMetric ? "Cm" : "Inches";

          // 2. Format the string and Map
          final String heightString = "$h1 $unit1 : $h2 $unit2";
          String Id = FirebaseAuth.instance.currentUser!.uid;
          print(Id);
          Map<String, dynamic> userHeight = {"Height": heightString};
          final result = await DatabaseMethod().addUserHeight(userHeight, Id);

          if (result == "Sucess") {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => WeightSelectionScreen()),
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

  // Helper with Black Text
  PopupMenuItem<bool> _buildPopupItem({
    required bool value,
    required String label,
  }) {
    return PopupMenuItem<bool>(
      value: value,
      child: Text(
        label,
        style: const TextStyle(
          color: Colors.black, // Text color inside the dropdown
          fontSize: 16,
        ),
      ),
    );
  }

  Widget _buildWheel({
    required Key key,
    required int min,
    required int max,
    required int currentValue,
    required ValueChanged<int> onChanged,
  }) {
    return SizedBox(
      key: key,
      width: 40,
      height: 120,
      child: CupertinoPicker(
        itemExtent: 40,
        scrollController: FixedExtentScrollController(
          initialItem: currentValue - min,
        ),
        selectionOverlay: null,
        onSelectedItemChanged: (index) => onChanged(index + min),
        children: List.generate(
          (max - min) + 1,
          (i) => Center(
            child: Text(
              "${i + min}",
              style: const TextStyle(fontSize: 22, color: Color(0xFF1D2125)),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildUnitStaticLabel(String label) {
    return Padding(
      padding: const EdgeInsets.only(left: 4.0),
      child: Text(
        label,
        style: const TextStyle(
          color: Color(0xFF42D29D),
          fontSize: 18,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
