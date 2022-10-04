import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'employee/employee_vu.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Getx Practice',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home:  EmployeeScreen(),
    );
  }
}