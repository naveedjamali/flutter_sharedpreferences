import 'package:flutter/material.dart';
import 'package:flutter_sharedpreferences/HomeScreen.dart';
import 'package:flutter_sharedpreferences/WelcomeScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FlatButton(
          child: Text(
            "Proceed",
            style: TextStyle(color: Colors.white),
          ),
          color: Colors.lightBlue,
          onPressed: () async {
            //check whether this is the first use or not.
            bool visitingFlag = await getVisitingFlag();

            if(visitingFlag == true)
            {
              //User has already visited this app. so this not the firt time.
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=> HomeScreen()));
            }
            else{
              //user has not opened this app, so redirect user to welcome screen.
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=> WelcomeScreen()));
              //set that user has visited app now.
              setVisitingFlage();
            }
          },
        ),
      ),
      
    );
  }
}

setVisitingFlage() async{
  SharedPreferences preferences = await SharedPreferences.getInstance();
  preferences.setBool("alreadyVisited", true);
}

getVisitingFlag() async{
  SharedPreferences preferences = await SharedPreferences.getInstance();
  /** if there is no data saved with the provieded key, the sharedpreference will return null.
   *  in this case, we can check whether null can be asigned to the variable or not. We can use null aware operator ??
   * to assign another value to our variable.
  */
  bool alreadyVisited  = preferences.getBool("alreadyVisited") ?? false;
  return alreadyVisited;
}