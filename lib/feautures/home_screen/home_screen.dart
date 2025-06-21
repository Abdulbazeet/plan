import 'package:flutter/material.dart';
import 'package:plan/constants/variables.dart';
import 'package:plan/feautures/calendar/calendar.dart';
import 'package:plan/feautures/home/home.dart';
import 'package:plan/feautures/notes/notes.dart';
import 'package:plan/feautures/profile/profile.dart';
import 'package:sizer/sizer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _index = 0;
  final List _body = [Home(), Calendar(), Notes(), Profile()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppVariables.bgColor,
      body: _body[_index],
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(15.sp).copyWith(bottom: 25.sp),
        child: ClipRRect(
          borderRadius: BorderRadius.horizontal(
            left: Radius.circular(20.sp),
            right: Radius.circular(20.sp),
          ),
          child: Theme(
            data: Theme.of(context).copyWith(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              navigationBarTheme: NavigationBarThemeData(height: 50.sp),
            ),
            child: BottomNavigationBar(
              elevation: 10.sp,

              selectedItemColor: AppVariables.lightGreen,
              unselectedItemColor: Colors.black,
              showUnselectedLabels: false,
              showSelectedLabels: false,
              onTap: (value) {
                setState(() {
                  _index = value;
                });
              },
              currentIndex: _index,

              //  type: BottomNavigationBarType.fixed,
              items: [
                BottomNavigationBarItem(
                  icon: Image.asset(
                    'assets/icons8-home-32.png',
                    height: 20.sp,
                    width: 20.sp,
                  ),
                  activeIcon: Container(
                    // height: 20.sp,
                    decoration: BoxDecoration(
                      color: AppVariables.lightGreen,
                      borderRadius: BorderRadius.circular(18.sp),
                    ),
                    padding: EdgeInsets.symmetric(
                      horizontal: 12.sp,
                      vertical: 12.sp,
                    ),
                    margin: EdgeInsets.only(left: 15.sp),
                    child: Row(
                      children: [
                        Image.asset(
                          'assets/icons8-home-32.png',
                          color: Colors.white,
                          height: 20.sp,
                          width: 20.sp,
                        ),
                        SizedBox(width: 10.sp),
                        Text(
                          'Home',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 17.sp,
                          ),
                        ),
                      ],
                    ),
                  ),

                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: Image.asset(
                    'assets/icons8-calendar-32.png',
                    height: 20.sp,
                    width: 20.sp,
                  ),
                  activeIcon:  Container(
                    // height: 20.sp,
                    decoration: BoxDecoration(
                      color: AppVariables.lightGreen,
                      borderRadius: BorderRadius.circular(18.sp),
                    ),
                    padding: EdgeInsets.symmetric(
                      horizontal: 12.sp,
                      vertical: 12.sp,
                    ),
                    margin: EdgeInsets.only(left: 15.sp),
                    child: Row(
                      children: [
                        Image.asset(
                          'assets/icons8-calendar-32.png',
                          color: Colors.white,
                          height: 20.sp,
                          width: 20.sp,
                        ),
                        SizedBox(width: 10.sp),
                        Text(
                          'Calendar',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 17.sp,
                          ),
                        ),
                      ],
                    ),
                  ),
                  label: '',
                ),

                BottomNavigationBarItem(
                  icon: Image.asset(
                    'assets/icons8-notes-32.png',
                    height: 20.sp,
                    width: 20.sp,
                  ),

                  activeIcon:  Container(
                    // height: 20.sp,
                    decoration: BoxDecoration(
                      color: AppVariables.lightGreen,
                      borderRadius: BorderRadius.circular(18.sp),
                    ),
                    padding: EdgeInsets.symmetric(
                      horizontal: 12.sp,
                      vertical: 12.sp,
                    ),
                    margin: EdgeInsets.only(left: 15.sp),
                    child: Row(
                      children: [
                        Image.asset(
                          'assets/icons8-notes-32.png',
                          color: Colors.white,
                          height: 20.sp,
                          width: 20.sp,
                        ),
                        SizedBox(width: 10.sp),
                        Text(
                          'Notes',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 17.sp,
                          ),
                        ),
                      ],
                    ),
                  ),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: Image.asset(
                    'assets/icons8-test-account-32.png',
                    height: 20.sp,
                    width: 20.sp,
                  ),
                  activeIcon: Image.asset(
                    'assets/icons8-test-account-32.png',
                    color: AppVariables.lightGreen,
                    height: 20.sp,
                    width: 20.sp,
                  ),
                  label: 'Profile',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
