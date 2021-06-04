import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Welcome/components/body.dart';

class WelcomeScreen extends StatelessWidget {
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
