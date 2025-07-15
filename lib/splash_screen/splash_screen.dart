import 'package:flutter/material.dart';
import 'package:plan/constants/variables.dart';
import 'package:sizer/sizer.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child:
          // Image.asset('assets/PLAN_IT-removebg-preview.png')
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //Icon(Icons.edit, color: Color(0xFF0BCC9D), size: 30.sp,),
              Text(
                'PLAN IT',
                style: TextStyle(
                  fontSize: 27.sp,
                  color: AppVariables.lightGreen,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
