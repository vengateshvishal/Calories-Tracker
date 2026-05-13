import 'package:calorie_tracker/Screens/welcome_screen_1.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class OnboardingScreen3 extends StatelessWidget {
  const OnboardingScreen3({super.key});

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
                    'assets/images/Progress.png',
                    width: 200,
                    height: 200,
                  ),
                  SizedBox(height: 20.0),
                  Text(
                    'Goal Setting',
                    style: TextStyle(
                      fontSize: 24.0,
                      color: Color(0xff0d1220),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    'Set realistic goals and watch your progress unfold',
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
                      SizedBox(width: 8),
                      Container(
                        width: 10,
                        height: 10,
                        decoration: BoxDecoration(
                          color: Color(0xff35cc8c),
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
                Navigator.pop(context);
              },
              child: Text(
                'Back',
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
            MaterialPageRoute(builder: (context) => WelcomeScreen1()),
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
