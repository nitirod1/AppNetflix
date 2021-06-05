import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/select_package/components/background.dart';
import 'package:flutter_auth/Screens/plan_setting/plan_screen.dart';
import 'package:flutter_auth/models/User.dart';

class Information_Plan extends StatelessWidget {
  final String text;
  final Color color_;
  Information_Plan({
    @required this.text,
    @required this.color_,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 100,
      color: color_,
      child: Text(
        text,
        style: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );
  }
}

class Select_package extends StatefulWidget {
  @override
  _Select_packageState createState() => _Select_packageState();
}

class _Select_packageState extends State<Select_package> {
  Color color_text = Colors.red;
  int value = 1;
  Color color_click_text = Colors.redAccent;
  Color bg_box = Colors.white;
  final isSelected = <bool>[false, false, false, false];
  String email;
  String password;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(20),
              child: OutlinedButton(
                child: Text(
                  "Mobile\n\n Good video quality in SD(480p). Watch on any phone or tablet. Computer and TV not included. \nTHB99/month",
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {},
                //onPressed: null, //Uncomment this statement to check disabled state.
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.resolveWith<Color>((states) {
                    if (states.contains(MaterialState.disabled)) {
                      return Colors.grey[100];
                    }
                    return bg_box;
                  }),
                  overlayColor:
                      MaterialStateProperty.resolveWith<Color>((states) {
                    if (states.contains(MaterialState.pressed)) {
                      return Colors.red;
                    }
                    return Colors.transparent;
                  }),
                  side: MaterialStateProperty.resolveWith((states) {
                    Color _borderColor;

                    if (states.contains(MaterialState.disabled)) {
                      _borderColor = Colors.greenAccent;
                    } else if (states.contains(MaterialState.pressed)) {
                      _borderColor = color_click_text;
                    } else {
                      _borderColor = color_text;
                    }

                    return BorderSide(color: _borderColor, width: 3);
                  }),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(20),
              child: OutlinedButton(
                child: Text(
                  "Mobile\n\n Good video quality in SD(480p). Watch on any phone or tablet. Computer and TV not included. \nTHB99/month",
                  style: TextStyle(color: color_text),
                ),
                onPressed: () {},
                //onPressed: null, //Uncomment this statement to check disabled state.
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.resolveWith<Color>((states) {
                    if (states.contains(MaterialState.disabled)) {
                      return Colors.grey[100];
                    }
                    return bg_box;
                  }),
                  overlayColor:
                      MaterialStateProperty.resolveWith<Color>((states) {
                    if (states.contains(MaterialState.pressed)) {
                      return Colors.red;
                    }
                    return Colors.transparent;
                  }),
                  side: MaterialStateProperty.resolveWith((states) {
                    Color _borderColor;

                    if (states.contains(MaterialState.disabled)) {
                      _borderColor = Colors.greenAccent;
                    } else if (states.contains(MaterialState.pressed)) {
                      _borderColor = color_click_text;
                    } else {
                      _borderColor = color_text;
                    }

                    return BorderSide(color: _borderColor, width: 3);
                  }),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(20),
              child: OutlinedButton(
                child: Text(
                  "Mobile\n\n Good video quality in SD(480p). Watch on any phone or tablet. Computer and TV not included. \nTHB99/month",
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {},
                //onPressed: null, //Uncomment this statement to check disabled state.
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.resolveWith<Color>((states) {
                    if (states.contains(MaterialState.disabled)) {
                      return Colors.grey[100];
                    }
                    return Colors.blue;
                  }),
                  overlayColor:
                      MaterialStateProperty.resolveWith<Color>((states) {
                    if (states.contains(MaterialState.pressed)) {
                      return Colors.red;
                    }
                    return Colors.transparent;
                  }),
                  side: MaterialStateProperty.resolveWith((states) {
                    Color _borderColor;

                    if (states.contains(MaterialState.disabled)) {
                      _borderColor = Colors.greenAccent;
                    } else if (states.contains(MaterialState.pressed)) {
                      _borderColor = Colors.yellow;
                    } else {
                      _borderColor = Colors.pinkAccent;
                    }

                    return BorderSide(color: _borderColor, width: 3);
                  }),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(20),
              child: OutlinedButton(
                child: Text(
                  "Mobile\n\n Good video quality in SD(480p). Watch on any phone or tablet. Computer and TV not included. \nTHB99/month",
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {},
                //onPressed: null, //Uncomment this statement to check disabled state.
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.resolveWith<Color>((states) {
                    if (states.contains(MaterialState.disabled)) {
                      return Colors.grey[100];
                    }
                    return Colors.blue;
                  }),
                  overlayColor:
                      MaterialStateProperty.resolveWith<Color>((states) {
                    if (states.contains(MaterialState.pressed)) {
                      return Colors.red;
                    }
                    return Colors.transparent;
                  }),
                  side: MaterialStateProperty.resolveWith((states) {
                    Color _borderColor;

                    if (states.contains(MaterialState.disabled)) {
                      _borderColor = Colors.greenAccent;
                    } else if (states.contains(MaterialState.pressed)) {
                      _borderColor = Colors.yellow;
                    } else {
                      _borderColor = Colors.pinkAccent;
                    }

                    return BorderSide(color: _borderColor, width: 3);
                  }),
                ),
              ),
            ),
            Container(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.all(1.0),
                  primary: Colors.red,
                  textStyle: const TextStyle(fontSize: 16),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return Plan_screen(value: value);
                      },
                    ),
                  );
                },
                child: const Text('Continue'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
