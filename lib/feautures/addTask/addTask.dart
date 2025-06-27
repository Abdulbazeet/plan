import 'package:flutter/material.dart';
import 'package:plan/constants/variables.dart';
import 'package:sizer/sizer.dart';

class AddTask extends StatefulWidget {
  const AddTask({super.key});

  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppVariables.bgColor,
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: Text(
          'Add Task',
          style: TextStyle(fontSize: 17.sp, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20.sp),
          child: ListView(
            children: [
              //**
              //task title
              // */
              Text(
                'Task title',
                style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 10.sp),
              TextField(
                controller: _titleController,
                style: TextStyle(
                  fontSize: 14.5.sp,
                  fontWeight: FontWeight.w600,
                ),
                decoration: InputDecoration(
                  hint: Text(
                    'Task title',
                    style: TextStyle(fontSize: 14.5.sp, color: Colors.black45),
                  ),
                  filled: true,
                  fillColor: Colors.white,

                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black45),
                    borderRadius: BorderRadius.circular(20.sp),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black45),
                    borderRadius: BorderRadius.circular(20.sp),
                  ),
                ),
              ),
              SizedBox(height: 20.sp),

              //**
              //Task description
              // */
              Text(
                'Task Desscription',
                style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 10.sp),
              TextField(
                controller: _descriptionController,
                maxLines: 4,
                style: TextStyle(
                  fontSize: 14.5.sp,
                  fontWeight: FontWeight.w600,
                ),
                decoration: InputDecoration(
                  hint: Text(
                    'Task description...',
                    style: TextStyle(fontSize: 14.5.sp, color: Colors.black45),
                  ),
                  filled: true,

                  fillColor: Colors.white,

                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black45),
                    borderRadius: BorderRadius.circular(20.sp),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black45),
                    borderRadius: BorderRadius.circular(20.sp),
                  ),
                ),
              ),
              SizedBox(height: 20.sp),

              //**
              //Due Date
              // */
              Text(
                'Due Date',
                style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 10.sp),
              InkWell(
                onTap: () {},
                child: Container(
                  height: 30.sp,
                  width: 100.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.sp),
                    color: Colors.white,
                    border: Border.all(color: Colors.black45),
                  ),
                ),
              ),
              SizedBox(height: 20.sp),

              //**
              // priority and repeat
              // */
              Row(
                children: [
                  //***
                  // priority
                  // */
                  Expanded(
                    child: InkWell(
                      onTap: () {},
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Priority',
                            style: TextStyle(
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),

                          SizedBox(height: 10.sp),
                          Container(
                            padding: EdgeInsets.all(10.sp),
                            height: 30.sp,

                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.sp),
                              color: Colors.white,
                              border: Border.all(color: Colors.black45),
                            ),

                            child: Row(
                              children: [
                                AppVariables.priority[0]['icon'] as Icon,
                                SizedBox(width: 10.sp),
                                Text(
                                  AppVariables.priority[0]['title'],
                                  style: TextStyle(fontSize: 14.5.sp),
                                ),
                                Spacer(),
                                Icon(Icons.keyboard_arrow_down_outlined),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 10.sp),

                  //**
                  // repeat mode
                  // */
                  Expanded(
                    child: InkWell(
                      onTap: () {},
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Repeat Mode',
                            style: TextStyle(
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),

                          SizedBox(height: 10.sp),
                          Container(
                            padding: EdgeInsets.all(10.sp),
                            height: 30.sp,

                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.sp),
                              color: Colors.white,
                              border: Border.all(color: Colors.black45),
                            ),

                            child: Row(
                              children: [
                                AppVariables.priority[0]['icon'] as Icon,
                                SizedBox(width: 10.sp),
                                Text(
                                  AppVariables.priority[0]['title'],
                                  style: TextStyle(fontSize: 14.5.sp),
                                ),
                                Spacer(),
                                Icon(Icons.keyboard_arrow_down_outlined),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
