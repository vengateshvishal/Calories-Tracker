import 'package:calorie_tracker/onboarding_screens/onboarding_screen_2.dart';
import 'package:calorie_tracker/Screens/welcome_screen_1.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class OnboardingScreen1 extends StatelessWidget {
  const OnboardingScreen1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Container(
            padding: EdgeInsets.only(right: 48.0, left: 48.0),
            color: Colors.white,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/Welcome.png',
                    width: 200,
                    height: 200,
                  ),
                  SizedBox(height: 20.0),
                  Text(
                    'Welcome!',
                    style: TextStyle(
                      fontSize: 24.0,
                      color: Color(0xff0d1220),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    'Congratulations on taking the first step toward a healthier you!',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20.0, color: Color(0xff6e7179)),
                  ),
                  SizedBox(height: 20.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 10,
                        height: 10,
                        decoration: BoxDecoration(
                          color: Color(0xff35cc8c),
                          shape: BoxShape.circle,
                        ),
                      ),
                      SizedBox(width: 8),
                      Container(
                        width: 10,
                        height: 10,
                        decoration: BoxDecoration(
                          color: Color(0xffdddddd),
                          shape: BoxShape.circle,
                        ),
                      ),
                      SizedBox(width: 8),
                      Container(
                        width: 10,
                        height: 10,
                        decoration: BoxDecoration(
                          color: Color(0xffdddddd),
                          shape: BoxShape.circle,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 40,
            left: 20,
            child: TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => WelcomeScreen1()),
                );
              },
              child: Text(
                'Skip',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Color(0xff6e7179),
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => OnboardingScreen2()),
          );
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
