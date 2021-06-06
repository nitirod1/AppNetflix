import 'package:flutter/material.dart';
import 'package:flutter_auth/Movie.dart';
import 'package:flutter_auth/constants.dart';
import 'package:flutter_auth/pages/viewer/select_viewer.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Screens/Welcome/welcome_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      /*theme: ThemeData(
        primaryColor: kPrimaryLightColor,
        scaffoldBackgroundColor: kPrimaryColor,
      ),*/
      home: FutureBuilder(
        future: loadTokenUser(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.data) {
            return SelectViewerPage(); // TODO: return viewer
          }
          return WelcomeScreen();
        },
      ),
    );
  }

  Future<bool> loadTokenUser() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('tokenUser');
    return token != null;
  }
}
