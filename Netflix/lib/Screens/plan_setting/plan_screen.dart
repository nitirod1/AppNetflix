import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/plan_setting/components/plan_setting.dart';

class Plan_screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('Netflix', style: TextStyle(color: Colors.red)),
          backgroundColor: Colors.black),
      body: Plan_setting(),
    );
  }
}
