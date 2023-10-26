import 'package:cook_bee/screens/login_screen.dart';
import 'package:cook_bee/screens/registration_screen.dart';
import 'package:cook_bee/screens/grocerylist_screen.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  static const String id = 'welcome_screen';
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Stack(
          // stack widget that set it child one over the another.
          children: <Widget>[
            // first child
            Container(
              // alignment: Alignment.center,
              child: const Image(
                image: AssetImage('images/first.gif'),
                fit: BoxFit.cover,
                height: double.infinity,
                width: double.infinity,
                alignment: Alignment.center,
              ),
            ),
            Container(
              //second child
              alignment: Alignment.center,
              // width: 112,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text(
                    'Food Your Way',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w900,
                        fontSize: 34.0),
                  ),
                  const SizedBox(height: 45.0),
                  // Spacer(),
                  // Padding(
                  //   padding: EdgeInsets.symmetric(vertical: 20.0),
                  //   child: Material(
                  //     elevation: 5.0,
                  //     color: Colors.lightBlueAccent,
                  //     borderRadius: BorderRadius.circular(30.0),
                  //     child: MaterialButton(
                  //       onPressed: () {
                  //         Navigator.pushNamed(context, LoginScreen.id);
                  //       },
                  //       minWidth: 300.0,
                  //       height: 55.0,
                  //       child: Text(
                  //         'Log In',
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20.0),
                    child: Material(
                      color: Colors.blueAccent,
                      borderRadius: BorderRadius.circular(30.0),
                      elevation: 5.0,
                      child: MaterialButton(
                        onPressed: () {
                          // Navigator.pushNamed(context, RegistrationScreen.id);
                          Navigator.pushNamed(context, GrocerylistScreen.id);
                        },
                        minWidth: 300.0,
                        height: 55.0,
                        child: const Text(
                          // 'Register',
                          'Create',
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
