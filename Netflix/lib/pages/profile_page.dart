import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      resizeToAvoidBottomInset: false,
      appBar: getAppbar(),
      //bottomNavigationBar: getFooter(),
      //body: getBody(),
    );
  }
Widget getAppbar(){
return AppBar(
  backgroundColor: Colors.black,
  elevation: 0,
  title: Text(
    "Profile",
    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
  ),
  
);
}

}