import 'package:flutter/material.dart';
import 'package:cook_bee/screens/welcome_screen.dart';
import 'package:cook_bee/screens/login_screen.dart';
import 'package:cook_bee/screens/registration_screen.dart';
import 'package:cook_bee/screens/grocerylist_screen.dart';

void main() => runApp(FlashChat());

class FlashChat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        // theme: ThemeData.dark().copyWith(
        // textTheme: TextTheme(
        //   body1: TextStyle(color: Colors.black54),
        // ),
        // ),
        // home: WelcomeScreen(),
        initialRoute: WelcomeScreen.id,
        routes: {
          WelcomeScreen.id: (context) => WelcomeScreen(),
          LoginScreen.id: (context) => LoginScreen(),
          RegistrationScreen.id: (context) => RegistrationScreen(),
          GrocerylistScreen.id: (context) => GrocerylistScreen(),
        });
  }
}
