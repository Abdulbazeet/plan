// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:plan/constants/variables.dart';
import 'package:plan/feautures/auth/bloc/auth_bloc.dart';
import 'package:sizer/sizer.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) async {
        await Future.delayed(const Duration(seconds: 3));
        if (state is Unauthenticated) {
          context.go('/onboard-screen');
        } else if (state is Authenticated) {
          context.go('/homescreen');
        }
      },

      child: Scaffold(
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
