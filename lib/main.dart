import 'package:flutter/material.dart';
import 'package:nti_flutter_tasks/TaskOnLoginRegister/RegisterScreen/register.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Authentication',

      home: RegisterScreen(),
    );
  }
}
