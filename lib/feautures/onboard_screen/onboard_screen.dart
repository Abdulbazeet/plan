import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:plan/constants/variables.dart';
import 'package:sizer/sizer.dart';

class OnBoardScreen extends StatefulWidget {
  const OnBoardScreen({super.key});

  @override
  State<OnBoardScreen> createState() => _OnBoardScreenState();
}

class _OnBoardScreenState extends State<OnBoardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //   backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              bottom: 35.h,
              left: 30.sp,
              child: Container(
                height: 20.sp,
                width: 20.sp,
                decoration: BoxDecoration(
                  color: AppVariables.lightGreen,
                  borderRadius: BorderRadius.circular(10.sp),
                ),
              ),
            ),
            Positioned(
              top: 30.h,
              left: 40.sp,
              child: Container(
                height: 20.sp,
                width: 20.sp,
                decoration: BoxDecoration(
                  color:AppVariables.lightPurple,
                  borderRadius: BorderRadius.circular(10.sp),
                ),
              ),
            ),
            Positioned(
              top: 18.h,
              right: 25.sp,
              child: Container(
                height: 40.sp,
                width: 40.sp,
                decoration: BoxDecoration(
                  color:AppVariables.lightPurple,
                  borderRadius: BorderRadius.circular(20.sp),
                ),
              ),
            ),
            Positioned(
              bottom: 35.h,
              left: 30.sp,
              child: Container(
                height: 20.sp,
                width: 20.sp,
                decoration: BoxDecoration(
                  color: AppVariables.lightGreen,
                  borderRadius: BorderRadius.circular(10.sp),
                ),
              ),
            ),
            Positioned(
              bottom: 20.h,
              right: 15.sp,
              child: Container(
                height: 35.sp,
                width: 35.sp,
                decoration: BoxDecoration(
                  color: AppVariables.lightPurple,
                  borderRadius: BorderRadius.circular(17.5.sp),
                ),
              ),
            ),
            Positioned(
              bottom: 32.h,
              right: -15.sp,
              child: Container(
                height: 25.sp,
                width: 25.sp,
                decoration: BoxDecoration(
                  color: AppVariables.lightGreen,
                  borderRadius: BorderRadius.circular(12.5.sp),
                ),
              ),
            ),
            Center(
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
                      color:AppVariables.lightGreen,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: 30.sp,
              right: -32.sp,
              child: Container(
                padding: EdgeInsets.all(10.sp),
                decoration: BoxDecoration(
                  //   color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black,
                      blurRadius: 3.sp,
                      blurStyle: BlurStyle.outer,
                    ),
                  ],
                  borderRadius: BorderRadius.circular(10.sp),
                ),
                child: Text(
                  'Stay organized and achieve                   \nyour goals effortlessly',
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
              ),
            ),
            Positioned(
              bottom: 20.h,
              left: -32.sp,
              child: Container(
                padding: EdgeInsets.all(10.sp),
                decoration: BoxDecoration(
                  //   color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black,
                      blurRadius: 3.sp,
                      blurStyle: BlurStyle.outer,
                    ),
                  ],
                  borderRadius: BorderRadius.circular(10.sp),
                ),
                child: Text(
                  '                   Have the whole day in the \n                   palm of your hand',
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
              ),
            ),
            Positioned(
              bottom: 20.sp,
              right: 0,
              left: 0,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.sp),
                child: Column(
                  //   mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppVariables.lightGreen,
                        fixedSize: Size(100.w, 30.sp),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.sp),
                        ),
                      ),
                      onPressed: () {
                        context.go('/sign-in');
                      },
                      child: Text(
                        'SIGN IN',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    SizedBox(height: 10.sp),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        // backgroundColor: Color(0xFF0BCC9D),
                        fixedSize: Size(100.w, 30.sp),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.sp),
                        ),
                      ),
                      onPressed: () {
                        context.go('/sign-up');
                      },
                      child: Text(
                        'CREATE NEW ACCOUNT',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // Positioned(
            //   right: 0,
            //   left: 0,
            //   top: 15.h,

            //   child: Image.asset('assets/PLAN_IT-removebg-preview.png', ),
            // ),
          ],
        ),
      ),
    );
  }
}
