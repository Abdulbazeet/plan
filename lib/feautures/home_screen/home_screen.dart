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
      appBar: switch (_index) {
        0 => AppBar(
          title: Text(
            'Olatunji',
            style: TextStyle(
              fontSize: 17.sp,
              fontWeight: FontWeight.bold,
              color: AppVariables.lightGreen,
            ),
          ),
          actions: [Icon(Icons.notifications_outlined)],
          actionsPadding: EdgeInsets.symmetric(horizontal: 20.sp),
        ),
        1 => AppBar(
          backgroundColor: Colors.white,
          title: Text(
            'Calendar',
            style: TextStyle(
              fontSize: 17.sp,
              fontWeight: FontWeight.bold,
              color: AppVariables.lightGreen,
            ),
          ),
          centerTitle: true,
        ),
        _ => null,
      },

      body: _body[_index],
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(15.sp),
        child: ClipRRect(
          borderRadius: BorderRadius.horizontal(
            left: Radius.circular(20.sp),
            right: Radius.circular(20.sp),
          ),
          child: Theme(
            data: Theme.of(context).copyWith(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              //   bottomNavigationBarTheme: BottomNavigationBarThemeData()
            ),
            child: BottomNavigationBar(
              elevation: 30.sp,

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
                    height: 18.sp,
                    width: 18.sp,
                  ),
                  activeIcon: Container(
                    // height: 20.sp,
                    decoration: BoxDecoration(
                      color: AppVariables.lightGreen,
                      borderRadius: BorderRadius.circular(15.sp),
                    ),
                    padding: EdgeInsets.symmetric(
                      horizontal: 12.sp,
                      vertical: 12.sp,
                    ),
                    margin: EdgeInsets.only(left: 5.sp),
                    child: FittedBox(
                      //   fit: BoxFit.scaleDown,
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
                              fontSize: 15.sp,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: Image.asset(
                    'assets/icons8-calendar-32.png',
                    color: Colors.black,
                    height: 20.sp,
                    width: 20.sp,
                  ),
                  activeIcon: Container(
                    // height: 20.sp,
                    decoration: BoxDecoration(
                      color: AppVariables.lightGreen,
                      borderRadius: BorderRadius.circular(15.sp),
                    ),
                    padding: EdgeInsets.symmetric(
                      horizontal: 12.sp,
                      vertical: 12.sp,
                    ),
                    // margin: EdgeInsets.only(left: 5.sp),
                    child: FittedBox(
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
                              fontSize: 15.sp,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  label: '',
                ),

                BottomNavigationBarItem(
                  icon: Image.asset(
                    'assets/icons8-notes-32.png',
                    color: Colors.black,
                    height: 20.sp,
                    width: 20.sp,
                  ),

                  activeIcon: Container(
                    // height: 20.sp,
                    decoration: BoxDecoration(
                      color: AppVariables.lightGreen,
                      borderRadius: BorderRadius.circular(15.sp),
                    ),
                    padding: EdgeInsets.symmetric(
                      horizontal: 12.sp,
                      vertical: 12.sp,
                    ),
                    // margin: EdgeInsets.only(left: 15.sp),
                    child: FittedBox(
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
                              fontSize: 15.sp,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.account_circle_outlined,
                    color: Colors.black54,
                  ),
                  activeIcon: Container(
                    // height: 20.sp,
                    decoration: BoxDecoration(
                      color: AppVariables.lightGreen,
                      borderRadius: BorderRadius.circular(15.sp),
                    ),
                    padding: EdgeInsets.symmetric(
                      horizontal: 12.sp,
                      vertical: 12.sp,
                    ),
                    margin: EdgeInsets.only(right: 10.sp),
                    child: FittedBox(
                      child: Row(
                        children: [
                          Icon(Icons.account_circle, color: Colors.white),
                          SizedBox(width: 10.sp),
                          Text(
                            'Profile',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 15.sp,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  label: '',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
