import 'dart:math';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:plan/constants/variables.dart';
import 'package:sizer/sizer.dart';
import 'package:simple_circular_progress_bar/simple_circular_progress_bar.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // final item = AppVariables.myLists;
  // int _itemCount = 4;
  int _pageCount = (AppVariables.myLists.length / 4).ceil();
  final List<Color> taskColors = [
    Color(0xFFE5F7F1), // Travel Plans
    Color(0xFFEDEAF7), // Study
    Color(0xFFFDEAEA), // Work Tasks
    Color(0xFFFFF7E5), // Night Routine
  ];
  Random _random = Random();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppVariables.bgColor,
      body: Padding(
        padding: EdgeInsets.all(20.sp).copyWith(bottom: 0),
        child: ListView(
          children: [
            Container(
              height: 50.sp,
              width: 100.w,
              decoration: BoxDecoration(
                color: AppVariables.darkGreen,
                borderRadius: BorderRadius.circular(20.sp),
              ),
              child: Stack(
                children: [
                  Positioned(
                    bottom: 27.sp,
                    right: -12.sp,
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
                    bottom: 11.sp,
                    right: 9.sp,
                    child: Container(
                      height: 20.sp,
                      width: 20.sp,
                      decoration: BoxDecoration(
                        color: AppVariables.lightPurple,
                        borderRadius: BorderRadius.circular(10.sp),
                      ),
                    ),
                  ),

                  Positioned(
                    bottom: 20.sp,
                    right: 30.sp,
                    child: Container(
                      height: 15.sp,
                      width: 15.sp,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(7.sp),
                      ),
                    ),
                  ),

                  Positioned(
                    top: 7.sp,
                    left: 20.sp,
                    child: Container(
                      height: 15.sp,
                      width: 15.sp,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(7.sp),
                      ),
                    ),
                  ),

                  Positioned(
                    top: 30.sp,
                    left: -15.sp,
                    child: Container(
                      height: 20.sp,
                      width: 20.sp,
                      decoration: BoxDecoration(
                        color: AppVariables.lightPurple,
                        borderRadius: BorderRadius.circular(10.sp),
                      ),
                    ),
                  ),

                  Positioned(
                    top: 20.sp,
                    left: 10.sp,
                    child: Container(
                      height: 20.sp,
                      width: 20.sp,
                      decoration: BoxDecoration(
                        color: AppVariables.lightGreen,
                        borderRadius: BorderRadius.circular(10.sp),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.sp),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Today\'s Tasks Progress',
                              style: TextStyle(
                                fontSize: 17.sp,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(height: 7.sp),
                            SizedBox(width: 40.sp, child: Divider()),

                            //  SizedBox(height: 7.sp),
                            Text(
                              '7/10 Tasks completed',
                              style: TextStyle(
                                fontSize: 15.sp,
                                fontWeight: FontWeight.normal,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(width: 20.sp),
                        SimpleCircularProgressBar(
                          size: 30.sp,
                          fullProgressColor: Colors.white,
                          backStrokeWidth: 10.sp,
                          progressStrokeWidth: 10.sp,
                          backColor: Colors.grey,
                          onGetText:
                              (p0) => Text(
                                '${p0.toInt()}%',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            //**
            //my lists
            // */
            SizedBox(height: 20.sp),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'My List',
                  style: TextStyle(color: Colors.black, fontSize: 16.sp),
                ),
                InkWell(
                  onTap: () {},
                  child: Text(
                    'see all',
                    style: TextStyle(color: Colors.black45, fontSize: 15.sp),
                  ),
                ),
              ],
            ),

            SizedBox(
              height: 55.sp,
              child: PageView.builder(
                itemCount: _pageCount,
                scrollDirection: Axis.horizontal,

                itemBuilder: (context, index) {
                  final list =
                      AppVariables.myLists.skip(index * 4).take(4).toList();
                  return GridView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: list.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10.sp,
                      mainAxisSpacing: 10.sp,

                      childAspectRatio: 6.sp,
                    ),
                    itemBuilder: (context, index) {
                      final _color =
                          taskColors[_random.nextInt(taskColors.length)];
                      return Container(
                        alignment: Alignment.centerLeft,
                        padding: EdgeInsets.all(12.sp),
                        decoration: BoxDecoration(
                          color: _color,
                          borderRadius: BorderRadius.circular(20.sp),
                          border: Border.all(color: Colors.grey, width: 7.sp),
                        ),
                        child: Row(
                          children: [
                            Image.asset(list[index]['icon']!),
                            SizedBox(width: 15.sp),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    list[index]['title']!,
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 15.sp,
                                    ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  Text(
                                    list[index]['tasks']!,
                                    style: TextStyle(
                                      fontWeight: FontWeight.normal,
                                      fontSize: 15.sp,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
              ),
            ),

            //**
            //my tasks
            // */
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'My Tasks',
                  style: TextStyle(color: Colors.black, fontSize: 16.sp),
                ),
                InkWell(
                  onTap: () {},
                  child: Text(
                    'see all',
                    style: TextStyle(color: Colors.black45, fontSize: 15.sp),
                  ),
                ),
              ],
            ),

            Column(
              children: List.generate(8, (index) {
                return Container(
                  margin: EdgeInsets.symmetric(vertical: 15.sp),
                  padding: EdgeInsets.all(15.sp),
                  height: 40.sp,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20.sp),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.check_circle,
                            color: AppVariables.lightGreen,
                          ),
                          SizedBox(width: 10.sp),
                          Expanded(
                            child: Text(
                              'Give this job to a capable client',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 15.sp,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          SizedBox(width: 10.sp),
                          Text(
                            '12:34pm',
                            style: TextStyle(
                              color: Colors.black45,
                              fontSize: 14.sp,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10.sp),
                      Row(
                        children: [
                          Container(
                            padding: EdgeInsets.all(10.sp),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15.sp),
                              color: Colors.red.withValues(alpha: .1),
                            ),
                            child: Row(
                              children: [
                                Icon(Icons.flag, color: Colors.red),
                                Text(
                                  'Highest',
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    color: Colors.red,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(width: 10.sp),
                          Container(
                            padding: EdgeInsets.all(10.sp),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15.sp),
                              color: AppVariables.lightPurple.withValues(
                                alpha: .2,
                              ),
                            ),
                            child: Text(
                              'Study',
                              style: TextStyle(
                                fontSize: 14.sp,
                                color: AppVariables.lightPurple,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          SizedBox(width: 10.sp),
                          Container(
                            padding: EdgeInsets.all(10.sp),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15.sp),
                              color: AppVariables.lightGreen.withValues(
                                alpha: .1,
                              ),
                            ),
                            child: Text(
                              'Repeat',
                              style: TextStyle(
                                fontSize: 14.sp,
                                color: AppVariables.lightGreen,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          SizedBox(width: 20.sp),
                          Icon(
                            Icons.folder_outlined,
                            color: Colors.black45,
                            size: 17.sp,
                          ),
                          SizedBox(width: 10.sp),
                          Icon(
                            Icons.attachment_outlined,
                            color: Colors.black45,
                            size: 17.sp,
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              }),
            ),
          ],
        ),
      ),

      //**
      //floating ction buttons
      // */
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          IconButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Color.fromARGB(255, 189, 229, 219),
              fixedSize: Size(25.sp, 25.sp),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.sp),
              ),
            ),
            onPressed: () {},
            icon: Image.asset('assets/ai.png'),
          ),
          SizedBox(height: 10.sp),
          IconButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppVariables.lightGreen,
              fixedSize: Size(30.sp, 30.sp),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.sp),
              ),
            ),
            onPressed: () {
              print('Add Task Button Pressed');
              context.push('/add-task');
            },
            icon: Icon(Icons.add, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
