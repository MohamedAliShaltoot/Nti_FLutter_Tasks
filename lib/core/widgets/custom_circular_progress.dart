import 'package:flutter/material.dart';

class CustomCircularProgressIndicator extends StatelessWidget {
  const CustomCircularProgressIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return const CircularProgressIndicator(
      color: Colors.blue,
      strokeWidth: 2,
      semanticsLabel: 'Loading',
      semanticsValue: 'Loading',
      backgroundColor: Colors.white,
    );
  }
}