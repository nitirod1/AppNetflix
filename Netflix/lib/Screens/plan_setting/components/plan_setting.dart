import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/plan_setting/components/background.dart';
import 'package:flutter_auth/components/rounded_button.dart';
import 'package:flutter_auth/components/rounded_input_field.dart';
import 'package:flutter_auth/models/Payment.dart';

import 'package:flutter_auth/models/User.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../Movie.dart';

class Plan_setting extends StatelessWidget {
  final int plan_id;

  String firstName;
  String lastName;
  String cardNumber;
  String expDate;
  String cvcCode;
  String phoneNumber;

  Plan_setting({Key key, @required this.plan_id}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text(
              "Set up your payment.",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 18),
            ),
            RoundedInputField(
              hintText: "First Name",
              icon: Icons.account_circle_outlined,
              rr: 0,
              onChanged: (value) {
                firstName = value;
              },
            ),
            RoundedInputField(
              icon: Icons.lock_open_outlined,
              hintText: "Last Name",
              rr: 0,
              onChanged: (value) {
                lastName = value;
              },
            ),
            RoundedInputField(
              icon: Icons.credit_card,
              hintText: "Card number",
              rr: 0,
              onChanged: (value) {
                cardNumber = value;
              },
            ),
            RoundedInputField(
              icon: Icons.info,
              hintText: "Expiration date (month/years)",
              rr: 0,
              onChanged: (value) {
                expDate = value;
              },
            ),
            RoundedInputField(
              icon: Icons.lock_rounded,
              hintText: "Security Code",
              rr: 0,
              onChanged: (value) {
                cvcCode = value;
              },
            ),
            RoundedInputField(
              icon: Icons.lock_rounded,
              hintText: "Phone",
              rr: 0,
              onChanged: (value) {
                phoneNumber = value;
              },
            ),
            RoundedButton(
              color: Color.fromRGBO(229, 9, 20, 1),
              text: "Start membership",
              press: () async {
                var result = await setPayment(Payment(
                    firstname: firstName,
                    lastname: lastName,
                    cardNumber: cardNumber,
                    planId: plan_id,
                    cvcCode: cvcCode,
                    expDate: expDate,
                    phoneNumber: phoneNumber));
                if (result == true) {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return Main_movie(); // TODO: return viewer
                      },
                    ),
                    (Route<dynamic> route) => false,
                  );
                }
              },
            )
          ],
        ),
      ),
    );
  }
}

Future<bool> setPayment(Payment payment) async {
  try {
    var dio = Dio();

    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('tokenUser');

    var response =
        await dio.post("https://netflix-cpe231.herokuapp.com/user/payment",
            data: payment.toJson(),
            options: Options(headers: {
              'Authorization': 'Bearer $token',
            }));
    if (response.statusCode != 200) {
      return false;
    }

    return true;
  } catch (e) {
    return false;
  }
}
