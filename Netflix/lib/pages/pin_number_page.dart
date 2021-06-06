import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class EditProfilePage extends StatefulWidget {
  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
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
        "Edit Profile",
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
      actions: [
        GestureDetector(
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.only(right: 15, top: 5),
            child: Center(
              child: Text(
                "SAVE",
                style: TextStyle(
                  color: Colors.green,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget getBody() {
    createAlertDialog(BuildContext context, bool incorrect) {
      String currentText = "";

      return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(
              incorrect
                  ? "Incorrect PIN. Please try again."
                  : "Enter your PIN to access this profile.",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
            content: Wrap(
              children: [
                PinCodeTextField(
                  obscureText: true,
                  obscuringCharacter: '*',
                  animationType: AnimationType.fade,
                  blinkWhenObscuring: true,
                  enablePinAutofill: true,
                  appContext: context,
                  keyboardType: TextInputType.number,
                  length: 4,
                  onChanged: (value) {
                    setState(() {
                      currentText = value;
                    });
                  },
                  onCompleted: (value) {
                    if (value == "1234") {
                      Navigator.of(context).pop();
                    } else {
                      Navigator.of(context).pop();
                      createAlertDialog(context, true);
                    }
                  },
                ),
                SizedBox(
                  height: 70,
                ),
                Text("Forget PIN?", textAlign: TextAlign.center),
              ],
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text("Cancel"))
            ],
          );
        },
      );
    }
  }
}
