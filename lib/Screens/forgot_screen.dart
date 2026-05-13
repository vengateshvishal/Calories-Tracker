import 'package:calorie_tracker/services/auth_services.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ForgotScreen extends StatefulWidget {
  const ForgotScreen({super.key});

  @override
  State<ForgotScreen> createState() => _ForgotScreenState();
}

class _ForgotScreenState extends State<ForgotScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
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
        title: Text('Forgot Password', style: TextStyle(fontSize: 22.0)),
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
                    Container(
                      width: 312.0,
                      child: Text(
                        "We will send a password reset code to your email account.",
                        style: TextStyle(
                          fontSize: 16.0,
                          color: Color(0xff6e7179),
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),

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
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 70.0,
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
                      AuthServices().sendPasswordReset(
                        emailController.text,
                        context,
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
                        'Send code',
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
    );
  }
}
