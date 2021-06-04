import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/select_package/components/background.dart';
import 'package:flutter_auth/Screens/plan_setting/plan_screen.dart';

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
  final Color color_text = Colors.white;
  bool isVisible_mobile = false;

  bool isVisible_standard = false;

  bool isVisible_high = false;

  bool isVisible_premiere = false;

  get text => null;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text(
              "Choose the plan that’s right for you",
              style: TextStyle(color: Colors.white),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(left: 120, right: 1),
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
                            return Plan_screen();
                          },
                        ),
                      );
                    },
                    child: const Text('Moblie'),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(right: 1),
                  child: ElevatedButton(
                    style: TextButton.styleFrom(
                      padding: const EdgeInsets.all(1.0),
                      primary: Colors.white,
                      textStyle: const TextStyle(fontSize: 16),
                    ),
                    onPressed: () {},
                    child: const Text('Basic'),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(right: 2),
                  child: ElevatedButton(
                    style: TextButton.styleFrom(
                      padding: const EdgeInsets.all(1.0),
                      primary: Colors.white,
                      textStyle: const TextStyle(fontSize: 16),
                    ),
                    onPressed: () {},
                    child: const Text('Standard'),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(right: 1),
                  child: ElevatedButton(
                    style: TextButton.styleFrom(
                      padding: const EdgeInsets.all(1.0),
                      primary: Colors.white,
                      textStyle: const TextStyle(fontSize: 16),
                    ),
                    onPressed: () {},
                    child: const Text('Premium'),
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Row(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.fromLTRB(15, 10, 5, 10),
                      child: Text(
                        "Monthly price",
                        style: TextStyle(color: color_text),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(25, 10, 5, 10),
                      child: Text(
                        "THB99",
                        style: TextStyle(color: color_text, fontSize: 16),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(5, 10, 5, 10),
                      child: Text(
                        "THB279",
                        style: TextStyle(color: color_text, fontSize: 16),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(5, 20, 5, 20),
                      child: Text(
                        "THB349",
                        style: TextStyle(color: color_text, fontSize: 16),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(5, 20, 20, 20),
                      child: Text(
                        "THB419",
                        style: TextStyle(color: color_text, fontSize: 16),
                      ),
                    ),
                  ],
                )
              ],
            ),
            Column(
              children: [
                Row(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.fromLTRB(15, 10, 5, 10),
                      child: Text(
                        "Video quality",
                        style: TextStyle(color: color_text),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(35, 10, 5, 10),
                      child: Text(
                        "Good",
                        style: TextStyle(color: color_text, fontSize: 16),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(20, 10, 5, 10),
                      child: Text(
                        "Good",
                        style: TextStyle(color: color_text, fontSize: 16),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(20, 20, 5, 20),
                      child: Text(
                        "Better",
                        style: TextStyle(color: color_text, fontSize: 16),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(25, 20, 20, 20),
                      child: Text(
                        "Best",
                        style: TextStyle(color: color_text, fontSize: 16),
                      ),
                    ),
                  ],
                )
              ],
            ),
            Column(
              children: [
                Row(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.fromLTRB(15, 10, 5, 10),
                      child: Text(
                        "Resolution",
                        style: TextStyle(color: color_text),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(50, 10, 5, 10),
                      child: Text(
                        "480p",
                        style: TextStyle(color: color_text, fontSize: 16),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(25, 10, 5, 10),
                      child: Text(
                        "480p",
                        style: TextStyle(color: color_text, fontSize: 16),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(20, 20, 5, 20),
                      child: Text(
                        "1080p",
                        style: TextStyle(color: color_text, fontSize: 16),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(10, 20, 20, 20),
                      child: Text(
                        "4K+HDR",
                        style: TextStyle(color: color_text, fontSize: 16),
                      ),
                    ),
                  ],
                )
              ],
            ),
            Column(
              children: [
                Row(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.fromLTRB(15, 10, 5, 10),
                      child: Text(
                        "Devices you\ncanuse to\nwatch",
                        style: TextStyle(color: color_text, fontSize: 16),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(25, 10, 5, 10),
                      child: Text(
                        "THB99",
                        style: TextStyle(color: color_text, fontSize: 16),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(5, 10, 5, 10),
                      child: Text(
                        "THB279",
                        style: TextStyle(color: color_text, fontSize: 16),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(5, 20, 5, 20),
                      child: Text(
                        "THB349",
                        style: TextStyle(color: color_text, fontSize: 16),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(5, 20, 20, 20),
                      child: Text(
                        "THB419",
                        style: TextStyle(color: Colors.black54, fontSize: 16),
                      ),
                    ),
                  ],
                )
              ],
            ),
            Column(
              children: <Widget>[
                ElevatedButton(
                  style: TextButton.styleFrom(
                    padding: const EdgeInsets.all(1.0),
                    primary: Colors.white,
                    textStyle: const TextStyle(fontSize: 20),
                  ),
                  onPressed: () {
                    setState(() => isVisible_mobile = !isVisible_mobile);
                  },
                  child: const Text('Visible'),
                ),
                Visibility(
                  visible: isVisible_mobile,
                  child: Information_Plan(
                      text: 'sasdsad\n sasdsa\n', color_: Colors.red),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
