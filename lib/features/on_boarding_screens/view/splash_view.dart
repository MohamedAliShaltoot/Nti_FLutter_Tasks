import 'dart:async';

import 'package:flutter/material.dart';

import '../../../core/utils/app_colors.dart';
import 'starting_view.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Navigate to the next screen after 3 seconds
    Timer(Duration(seconds: 3), () {
      Navigator.of(
        context,
      ).pushReplacement(MaterialPageRoute(builder: (context) => StartingScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            //  Image.asset(AppAssets.rightIconSplash,width: 334,height: 343.5,), 
              SizedBox(height: 20), // Space between image and text
              Text(
                'TODO',
                style: TextStyle(fontSize:36, fontWeight: FontWeight.bold,color: AppColors.primary),  
              ),
            ],
          ),
        ),
      ),
    );
  }
}

