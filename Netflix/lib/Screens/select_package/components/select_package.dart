import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/select_package/components/background.dart';
import 'package:flutter_auth/Screens/plan_setting/plan_screen.dart';
import 'package:flutter_auth/models/User.dart';
import 'package:flutter_auth/pages/profile_page.dart';

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
  int value = 1;
  Color color_click_box = Colors.black;
  Color color_box = Colors.grey;
  final color_text = <Color>[
    Colors.black54,
    Colors.black54,
    Colors.black54,
    Colors.black54
  ];

  Color bg_box = Colors.white;
  final isSelected = <bool>[false, false, false, false];
  int plan_id = 0;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Visibility(
                visible: isSelected[0],
                child: Icon(
                  Icons.arrow_downward,
                  color: Colors.red,
                )),
            Container(
              margin: EdgeInsets.only(top: 5, left: 20, right: 20, bottom: 20),
              child: OutlinedButton(
                onPressed: () {
                  setState(() {
                    plan_id = 1;
                    color_text[0] = Colors.black;
                    color_text[0] = Colors.black;
                    color_text[1] = Colors.black54;
                    color_text[2] = Colors.black54;
                    color_text[3] = Colors.black54;
                    isSelected[0] = true;
                    isSelected[1] = false;
                    isSelected[2] = false;
                    isSelected[3] = false;
                  });
                },
                //onPressed: null, //Uncomment this statement to check disabled state.
                child: Text(
                  "\nMobile\n\n Good video quality in SD(480p). Watch on any phone or tablet. Computer and TV not included. \nTHB99/month\n",
                  style: TextStyle(
                    color: color_text[0],
                  ),
                ),
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
                      _borderColor = Colors.white;
                    } else if (states.contains(MaterialState.pressed)) {
                      _borderColor = color_click_box;
                    } else {
                      _borderColor = color_box;
                    }
                    return BorderSide(color: _borderColor, width: 3);
                  }),
                ),
              ),
            ),
            Visibility(
                visible: isSelected[1],
                child: Icon(
                  Icons.arrow_downward,
                  color: Colors.red,
                )),
            Container(
              margin: EdgeInsets.only(top: 5, left: 20, right: 20, bottom: 20),
              child: OutlinedButton(
                child: Text(
                  "Mobile\n\n Good video quality in SD(480p). Watch on any phone or tablet. Computer and TV not included. \nTHB99/month",
                  style: TextStyle(color: color_text[1]),
                ),
                onPressed: () {
                  setState(() {
                    plan_id = 2;
                    color_text[0] = Colors.black54;
                    color_text[1] = Colors.black;
                    color_text[2] = Colors.black54;
                    color_text[3] = Colors.black54;
                    isSelected[0] = false;
                    isSelected[1] = true;
                    isSelected[2] = false;
                    isSelected[3] = false;
                  });
                },

                //onPressed: null, //Uncomment this statement to check disabled state.
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.resolveWith<Color>((states) {
                    if (states.contains(MaterialState.disabled)) {
                      return Colors.white;
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
                      _borderColor = color_click_box;
                    } else {
                      _borderColor = color_box;
                    }

                    return BorderSide(color: _borderColor, width: 3);
                  }),
                ),
              ),
            ),
            Visibility(
                visible: isSelected[2],
                child: Icon(
                  Icons.arrow_downward,
                  color: Colors.red,
                )),
            Container(
              margin: EdgeInsets.only(top: 5, left: 20, right: 20, bottom: 20),
              child: OutlinedButton(
                child: Text(
                  "Mobile\n\n Good video quality in SD(480p). Watch on any phone or tablet. Computer and TV not included. \nTHB99/month",
                  style: TextStyle(color: color_text[2]),
                ),
                onPressed: () {
                  setState(() {
                    plan_id = 3;
                    color_text[0] = Colors.black54;
                    color_text[1] = Colors.black54;
                    color_text[2] = Colors.black;
                    color_text[3] = Colors.black54;
                    isSelected[0] = false;
                    isSelected[1] = false;
                    isSelected[2] = true;
                    isSelected[3] = false;
                  });
                },
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
                      _borderColor = color_click_box;
                    } else {
                      _borderColor = color_box;
                    }

                    return BorderSide(color: _borderColor, width: 3);
                  }),
                ),
              ),
            ),
            Visibility(
                visible: isSelected[3],
                child: Icon(
                  Icons.arrow_downward,
                  color: Colors.red,
                )),
            Container(
              margin: EdgeInsets.only(top: 5, left: 20, right: 20, bottom: 20),
              child: OutlinedButton(
                child: Text(
                  "Mobile\n\n Good video quality in SD(480p). Watch on any phone or tablet. Computer and TV not included. \nTHB99/month",
                  style: TextStyle(color: color_text[3]),
                ),
                onPressed: () {
                  setState(() {
                    plan_id = 4;
                    color_text[1] = Colors.black;
                    color_text[0] = Colors.black54;
                    color_text[1] = Colors.black54;
                    color_text[2] = Colors.black54;
                    color_text[3] = Colors.black;
                    isSelected[0] = false;
                    isSelected[1] = false;
                    isSelected[2] = false;
                    isSelected[3] = true;
                  });
                },
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
                      _borderColor = color_click_box;
                    } else {
                      _borderColor = color_box;
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
                        return Plan_screen(
                          value: plan_id,
                        );
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
