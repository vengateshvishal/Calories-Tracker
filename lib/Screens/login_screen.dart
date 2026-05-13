import 'package:calorie_tracker/Screens/forgot_screen.dart';
import 'package:calorie_tracker/Screens/goal_selection_screen.dart';
import 'package:calorie_tracker/services/auth_services.dart';
import 'package:calorie_tracker/Screens/welcome_screen_1.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool _obscureText = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => WelcomeScreen1()),
            );
          },
          child: Padding(
            padding: const EdgeInsets.only(left: 24.0, top: 15.0),
            child: FaIcon(
              FontAwesomeIcons.angleLeft,
              fontWeight: FontWeight.w100,
            ),
          ),
        ),
        centerTitle: true,
        title: Text('Login', style: TextStyle(fontSize: 22.0)),
      ),
      body: Stack(
        children: [
          Center(
            child: Container(
              padding: EdgeInsets.all(24.0),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Email TextField
                    Container(
                      width: 312.0,
                      height: 54.0,
                      margin: const EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 2,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white, // Background color of the "card"
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 10,
                            offset: const Offset(
                              0,
                              4,
                            ), // Changes position of shadow
                          ),
                        ],
                      ),
                      child: TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Enter Email';
                          } else if (!value.contains('@')) {
                            return 'Enter valid Email';
                          }
                          return null;
                        },
                        controller: emailController,
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.email_outlined,
                            color: Color(0xff6e7179),
                          ),
                          labelText: "Email",
                          labelStyle: TextStyle(color: Color(0xff6e7179)),
                          floatingLabelStyle: TextStyle(
                            color: Color(0xff35cc8c),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide: BorderSide.none,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide: BorderSide(
                              color: Color(0xff35cc8c),
                              width: 2.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20.0),

                    // Password TextField
                    Container(
                      width: 312.0,
                      height: 54.0,
                      margin: const EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 2,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white, // Background color of the "card"
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 10,
                            offset: const Offset(
                              0,
                              4,
                            ), // Changes position of shadow
                          ),
                        ],
                      ),
                      child: TextFormField(
                        obscureText: _obscureText,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Enter Password';
                          }
                          if (value.length < 6) {
                            return 'Password must be at least 6 characters long';
                          }
                          return null;
                        },
                        controller: passwordController,
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.lock,
                            color: Color(0xff6e7179),
                          ),
                          suffixIcon: IconButton(
                            icon: Icon(
                              _obscureText
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: Color(0xff6e7179),
                            ),
                            onPressed: () {
                              // 4. Update the state to rebuild the UI
                              setState(() {
                                _obscureText = !_obscureText;
                              });
                            },
                          ),
                          labelText: "Password",
                          labelStyle: TextStyle(color: Color(0xff6e7179)),
                          floatingLabelStyle: TextStyle(
                            color: Color(0xff35cc8c),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide: BorderSide.none,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide: BorderSide(
                              color: Color(0xff35cc8c),
                              width: 2.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
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
                  onTap: () async {
                    if (_formKey.currentState!.validate()) {
                      await AuthServices().logInWithEmail(
                        emailController.text,
                        passwordController.text,
                        context,
                      );
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => GoalSelectionScreen(),
                        ),
                      );
                    }
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
                        'Login',
                        style: TextStyle(
                          fontSize: 20.0,
                          color: Color(0xffffffff),
                        ),
                      ),
                    ),
                  ),
                ),
                TextButton(
                  style: TextButton.styleFrom(padding: EdgeInsets.zero),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ForgotScreen()),
                    );
                  },
                  child: Text(
                    'Forgot password?',
                    style: TextStyle(fontSize: 17.0, color: Color(0xff35cc8c)),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
