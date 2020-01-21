import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Welcome to app, You are visiting first time", style: TextStyle(fontSize: 20, color: Colors.green),),
      ),
    );
  }
}
