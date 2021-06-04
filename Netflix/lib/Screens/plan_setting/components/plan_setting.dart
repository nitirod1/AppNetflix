import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/plan_setting/components/background.dart';
import 'package:flutter_auth/components/rounded_input_field.dart';

class Plan_setting extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text(
              "SIGNUP",
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
            ),
            RoundedInputField(
              hintText: "First Name",
              icon: Icons.account_circle_outlined,
              rr: 0,
              onChanged: (value) {},
            ),
            RoundedInputField(
              icon: Icons.lock_open_outlined,
              hintText: "Last Name",
              rr: 0,
              onChanged: (value) {},
            ),
            RoundedInputField(
              icon: Icons.credit_card,
              hintText: "Card number",
              rr: 0,
              onChanged: (value) {},
            ),
            RoundedInputField(
              icon: Icons.info,
              hintText: "Expiration date (month/years)",
              rr: 0,
              onChanged: (value) {},
            ),
            RoundedInputField(
              icon: Icons.lock_rounded,
              hintText: "Security",
              rr: 0,
              onChanged: (value) {},
            ),
          ],
        ),
      ),
    );
  }
}
