import 'package:calorie_tracker/Screens/rootScreen.dart';
import 'package:calorie_tracker/database/post_database.dart';
import 'package:calorie_tracker/services/functions.dart';
import 'package:calorie_tracker/services/preferences.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RecomandedPfcScreen extends StatefulWidget {
  const RecomandedPfcScreen({super.key});

  @override
  State<RecomandedPfcScreen> createState() => _RecomandedPfcScreenState();
}

class _RecomandedPfcScreenState extends State<RecomandedPfcScreen> {
  int? calories;
  int? protein;
  int? fats;
  int? carbs;

  @override
  void initState() {
    super.initState();
    _loadPFC();
    // macros();
  }

  void _loadPFC() async {
    String id = await FirebaseAuth.instance.currentUser!.uid;
    Map<String, int> result = await Functions().recommendPFC();
    setState(() {
      calories = result['calories'];
      protein = result['protein'];
      fats = result['fats'];
      carbs = result['carbs'];
    });
    Map<String, dynamic> userPFC = {
      "calories": result["calories"],
      "protein": result["protein"],
      "fats": result["fats"],
      "carbs": result["carbs"],
    };
    await DatabaseMethod().addUserCalories(userPFC, id);
    SharedPreferencesHelper().setCalories(result["calories"].toString());
    SharedPreferencesHelper().setProtein(result["protein"].toString());
    SharedPreferencesHelper().setFats(result["fats"].toString());
    SharedPreferencesHelper().setCarbs(result["carbs"].toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 40.0),
              child: Column(
                children: [
                  Center(
                    child: Text(
                      "Recommended PFC",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF1D2125),
                      ),
                    ),
                  ),
                  Text(
                    "You can always change PFC in the\n profile",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                      height: 1.4,
                    ),
                  ),
                  SizedBox(height: 20.0),
                  Wrap(
                    alignment: WrapAlignment.spaceEvenly,
                    children: [
                      Container(
                        margin: EdgeInsets.all(5.0),
                        height: 40,
                        width: 110,
                        decoration: BoxDecoration(
                          color: Color(0xff35cc8c),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: Text(
                              "Proteins: ${protein}g",
                              style: TextStyle(
                                fontSize: 14.0,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(5.0),
                        height: 40,
                        width: 110,
                        decoration: BoxDecoration(
                          color: Color(0xff35cc8c),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: Text(
                              "Fats:  ${fats}g",
                              style: TextStyle(
                                fontSize: 14.0,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(5.0),
                        height: 40,
                        width: 110,
                        decoration: BoxDecoration(
                          color: Color(0xff35cc8c),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: Text(
                              "Carbs: ${carbs}g",
                              style: TextStyle(
                                fontSize: 14.0,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(5.0),
                        height: 40,
                        width: 110,
                        decoration: BoxDecoration(
                          color: Color(0xff35cc8c),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: Text(
                              "Calories: $calories",
                              style: TextStyle(
                                fontSize: 14.0,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 40.0,
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const Rootscreen()),
                      );
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 30.0),
                      width: double.infinity,
                      height: 52.0,
                      decoration: BoxDecoration(
                        color: Color(0xff35cc8c),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Center(
                        child: Text(
                          'Track',
                          style: TextStyle(
                            fontSize: 20.0,
                            color: Color(0xffffffff),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
