import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Login/login_screen.dart';
import 'package:flutter_auth/Screens/Signup/components/background.dart';
import 'package:flutter_auth/components/already_have_an_account_acheck.dart';
import 'package:flutter_auth/components/rounded_button.dart';
import 'package:flutter_auth/components/rounded_input_field.dart';
import 'package:flutter_auth/components/rounded_password_field.dart';
import 'package:flutter_auth/Screens/select_package/package_screen.dart';
import 'package:flutter_auth/models/User.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Body extends StatelessWidget {
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
            Text(
              "Create a password to start your membership.",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 16),
            ),
            SizedBox(height: size.height * 0.03),
            RoundedInputField(
              hintText: "Your Email",
              icon: Icons.person,
              rr: 29,
              onChanged: (value) {
                email = value;
                print(email);
              },
            ),
            RoundedPasswordField(
              onChanged: (value) {
                password = value;
                print(password);
              },
            ),
            RoundedButton(
              color: Color.fromRGBO(229, 9, 20, 1),
              text: "SIGNUP",
              press: () async {
                String token = await RegisterUser(email, password);
                print(token);
                // if (token == "email has register") {
                //   Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //       builder: (context) {
                //         return LoginScreen();
                //       },
                //     ),
                //   );
                // }
                if (token != null) {
                  final prefs = await SharedPreferences.getInstance();
                  prefs.setString('tokenUser', token);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return Package_screen();
                      },
                    ),
                  );
                }
              },
            ),
            SizedBox(height: size.height * 0.03),
            AlreadyHaveAnAccountCheck(
              login: false,
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return LoginScreen();
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

Future<String> RegisterUser(String email, String password) async {
  try {
    var dio = Dio();
    var response = await dio.post(
        "https://netflix-cpe231.herokuapp.com/login/register",
        data: {'email': email, 'password': password});
    if (response.statusCode != 200) {
      print("error");
      return "";
    }

    return response.data['token'];
  } catch (e) {
    print(e.toString());
  }
}
