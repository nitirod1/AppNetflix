import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_auth/json/profile.dart';
import 'package:flutter_auth/pages/edit_profile_page.dart';
import 'package:flutter_auth/pages/profile_user.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'mylist_page.dart';

final List<Icon> icon = <Icon>[
  Icon(Icons.check),
  Icon(Icons.settings_applications),
  Icon(Icons.usb_rounded),
  Icon(Icons.logout)
];
final List<String> menu = <String>[
  'My List',
  'App Settings',
  'Account',
  'Sign Out'
];

class TestPage extends StatefulWidget {
  @override
  _TestPageState createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      resizeToAvoidBottomInset: false,
      appBar: getAppbar(),
      //bottomNavigationBar: getFooter(),
      body: getBody(),
    );
  }

  Widget getAppbar() {
    return AppBar(
      backgroundColor: Colors.black,
      elevation: 0,
      title: Text(
        "Profile",
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget getBody() {
    return SafeArea(
        child: Container(
            height: double.infinity,
            color: Colors.green,
            child: Column(
              children: [
                Container(
                  child: Text("test"),
                ),
                Container(
                  child: ListView.builder(
                    itemCount: 4,
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: icon[index],
                        title: Text(menu[index]),
                        dense: true,
                      );
                    },
                  ),
                ),
              ],
            )));
  }
}
