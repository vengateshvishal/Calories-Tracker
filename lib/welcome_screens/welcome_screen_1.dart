import 'package:calorie_tracker/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class WelcomeScreen1 extends StatelessWidget {
  const WelcomeScreen1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/Logo.png',
                    width: 150.0,
                    height: 150.0,
                  ),
                  SizedBox(height: 15.0),
                  Text(
                    'Welcome',
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff0d1220),
                    ),
                  ),
                  Text(
                    'Start or sign in to your account',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w400,
                      color: Color(0xff6e7179),
                    ),
                  ),
                ],
              ),
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
                    showModalBottomSheet(
                      backgroundColor: Colors.white,
                      context: context,
                      builder: (BuildContext context) {
                        return Container(
                          height: 204.0,
                          padding: EdgeInsets.all(20.0),
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                GestureDetector(
                                  onTap: () async{
                                    final UserCredential = await FirebaseService().login();
                                    if(UserCredential != null){
                                      print('HOME PAGE');
                                    }
                                  },
                                  child: Container(
                                    width: 312.0,
                                    height: 54.0,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      border: Border.all(
                                        color: Color(0xffd9d9d9),
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        SvgPicture.asset(
                                          'assets/svg/Icon=Google.svg',
                                          height: 24,
                                          width: 24,
                                        ),
                                        SizedBox(width: 5.0),
                                        Text(
                                          'Sign in with Google',
                                          style: TextStyle(
                                            fontSize: 17.0,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(height: 20.0,),
                                GestureDetector(
                                  onTap: () {
                                    
                                  },
                                  child: Container(
                                    width: 312.0,
                                    height: 54.0,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      border: Border.all(
                                        color: Color(0xffd9d9d9),
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Icon(Icons.mail_outline),
                                        SizedBox(width: 5.0),
                                        Text(
                                          'Sign in with Email',
                                          style: TextStyle(
                                            fontSize: 17.0,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                  child: Container(
                    width: 312.0,
                    height: 52.0,
                    decoration: BoxDecoration(
                      color: Color(0xff35cc8c),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Center(
                      child: Text(
                        'Start',
                        style: TextStyle(
                          fontSize: 20.0,
                          color: Color(0xffffffff),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  // mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Already have an account?',
                      style: TextStyle(
                        fontSize: 17.0,
                        color: Color(0xff0d1220),
                      ),
                    ),
                    TextButton(
                      style: TextButton.styleFrom(padding: EdgeInsets.zero),
                      onPressed: () {},
                      child: Text(
                        'Sign In',
                        style: TextStyle(
                          fontSize: 17.0,
                          color: Color(0xff35cc8c),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
