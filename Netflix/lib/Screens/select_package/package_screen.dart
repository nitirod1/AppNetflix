import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/select_package/components/select_package.dart';

class Package_screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('Netflix', style: TextStyle(color: Colors.red)),
          backgroundColor: Colors.black),
      body: Select_package(),
    );
  }
}
