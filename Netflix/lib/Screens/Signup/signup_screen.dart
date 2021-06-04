import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Signup/components/body.dart';

class SignUpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('Netflix', style: TextStyle(color: Colors.red)),
          backgroundColor: Colors.black),
      body: Body(),
    );
  }
}
