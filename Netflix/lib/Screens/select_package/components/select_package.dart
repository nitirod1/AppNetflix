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
  final Color color_text = Colors.white;
  final isSelected = <bool>[false, false, false];
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
              child: ToggleButtons(
                color: Colors.white.withOpacity(0.60),
                selectedColor: Color(0xFF6200EE),
                selectedBorderColor: Color(0xFF6200EE),
                fillColor: Color(0xFF6200EE).withOpacity(0.08),
                splashColor: Color(0xFF6200EE).withOpacity(0.12),
                hoverColor: Color(0xFF6200EE).withOpacity(0.04),
                borderRadius: BorderRadius.circular(4.0),
                isSelected: isSelected,
                onPressed: (index) {
                  // Respond to button selection
                  setState(() {
                    isSelected[index] = !isSelected[index];
                  });
                },
                children: [
                  Icon(Icons.favorite),
                  Icon(Icons.visibility),
                  Icon(Icons.notifications),
                ],
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
                        return Plan_screen();
                      },
                    ),
                  );
                },
                child: const Text('Moblie'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
