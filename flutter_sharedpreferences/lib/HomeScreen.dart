import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("This is the Home page of your app", style: TextStyle(fontSize: 20, color: Colors.red),),
      ),
    );
  }
}
