import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
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
  int _index = 0;
  int _index1 = 0;
  bool _isCustom = false;
  Map<String, dynamic> _chosenPriority = AppVariables.priority[0];
  String _chosenMode = AppVariables.repeatMode[0];
  String _chosenRepeat = AppVariables.repeatMode2[0];
  int _interval = 0;
  final List<String> _days = ["S", "M", "T", "W", "T", "F", "S"];
  final List<int> _index2 = [];
  bool _timeFrequency = false;
  bool _dayFrequency = false;
  bool _endOccurrence = false;

  showPriority() {
    return showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusGeometry.directional(
          topEnd: Radius.circular(20.sp),
          topStart: Radius.circular(20.sp),
        ),
      ),
      backgroundColor: Colors.white,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState1) {
            return Padding(
              padding: EdgeInsets.all(15.sp),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Select Task Priority',
                    style: TextStyle(
                      fontSize: 17.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: AppVariables.priority.length,
                    itemBuilder: (context, index) {
                      var item = AppVariables.priority[index];
                      return ElevatedButton(
                        onPressed: () {
                          setState1(() {
                            _index = index;
                          });
                        },

                        style: ElevatedButton.styleFrom(
                          elevation: 0,
                          backgroundColor:
                              _index == index
                                  ? (item['text_color'] as Color).withValues(
                                    alpha: .15,
                                  )
                                  : Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadiusGeometry.circular(15.sp),
                          ),
                        ),
                        child: Row(
                          children: [
                            item['icon'] as Icon,
                            SizedBox(width: 10.sp),
                            Text(
                              "${item['title']} - ${item['description']}",
                              style: TextStyle(
                                color:
                                    _index == index
                                        ? item['text_color'] as Color
                                        : Colors.black,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),

                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _chosenPriority = AppVariables.priority[_index];
                      });
                      context.pop();
                    },

                    style: ElevatedButton.styleFrom(
                      fixedSize: Size.fromWidth(100.w),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadiusGeometry.circular(15.sp),
                      ),
                      backgroundColor: AppVariables.lightGreen,
                    ),
                    child: Text(
                      'Save',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14.5.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  //repeatmode

  showRepeatMode() {
    return showModalBottomSheet(
      isScrollControlled: true,

      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusGeometry.directional(
          topEnd: Radius.circular(20.sp),
          topStart: Radius.circular(20.sp),
        ),
      ),
      backgroundColor: Colors.white,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState1) {
            return Padding(
              padding: EdgeInsets.all(15.sp),
              child: Column(
                //  crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Select Repeat Mode',
                    style: TextStyle(
                      fontSize: 17.sp,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 10.sp),
                  GridView.builder(
                    itemCount: AppVariables.repeatMode.length,
                    shrinkWrap: true,

                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisSpacing: 20.sp,
                      mainAxisSpacing: 10.sp,
                      crossAxisCount: 3,
                      childAspectRatio: 6.sp,
                    ),
                    itemBuilder: (context, index) {
                      var item = AppVariables.repeatMode;
                      return ElevatedButton(
                        onPressed: () {
                          setState1(() {
                            _index1 = index;
                          });
                          if (index == 5) {
                            _isCustom = true;
                          } else {
                            _isCustom = false;
                            setState1(() {});
                          }
                        },

                        style: ElevatedButton.styleFrom(
                          elevation: 0,
                          backgroundColor:
                              _index1 == index
                                  ? (AppVariables.lightGreen)
                                  : Colors.white,
                          shape: RoundedRectangleBorder(
                            side:
                                _index1 != index
                                    ? BorderSide(color: Colors.grey)
                                    : BorderSide.none,
                            borderRadius: BorderRadiusGeometry.circular(15.sp),
                          ),
                        ),
                        child: Text(
                          item[index],
                          style: TextStyle(
                            color:
                                _index1 == index
                                    ? Colors.white
                                    : Colors.black45,
                          ),
                        ),
                      );
                    },
                  ),
                  SizedBox(height: 10.sp),

                  //***
                  // custom settings
                  // */
                  _isCustom == true
                      ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 100.w,
                            child: Text(
                              'Custom settings',
                              style: TextStyle(
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w600,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          SizedBox(height: 10.sp),

                          //**
                          // show interval frequency
                          // */
                          Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Choose interval frequency',
                                    style: TextStyle(
                                      fontSize: 14.5.sp,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  Switch(
                                    activeColor: AppVariables.lightGreen,
                                    value: _timeFrequency,
                                    onChanged: (value) {
                                      setState1(() {
                                        _timeFrequency = value;
                                        // _dayFrequency = false;
                                      });
                                    },
                                  ),
                                ],
                              ),

                              _timeFrequency == true
                                  ? Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 15.sp,
                                      vertical: 10.sp,
                                    ),
                                    child: Row(
                                      children: [
                                        Text(
                                          'Interval',
                                          style: TextStyle(
                                            fontSize: 14.5.sp,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.black54,
                                          ),
                                        ),
                                        SizedBox(width: 10.sp),
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadiusGeometry.circular(
                                                15.sp,
                                              ),
                                          child: InkWell(
                                            onTap: () {
                                              if (_interval != 0) {
                                                setState1(() {
                                                  _interval -= 1;
                                                });
                                              }
                                            },
                                            child: Container(
                                              padding: EdgeInsets.all(10.sp),
                                              decoration: BoxDecoration(
                                                color: AppVariables.lightGreen
                                                    .withValues(alpha: .2),
                                              ),
                                              child: Icon(Icons.remove),
                                            ),
                                          ),
                                        ),

                                        // ),
                                        SizedBox(width: 10.sp),
                                        Text(
                                          "$_interval",
                                          style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 14.5.sp,
                                          ),
                                        ),
                                        SizedBox(width: 10.sp),
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadiusGeometry.circular(
                                                15.sp,
                                              ),
                                          child: InkWell(
                                            onTap: () {
                                              setState1(() {
                                                _interval += 1;
                                              });
                                            },
                                            child: Container(
                                              padding: EdgeInsets.all(10.sp),
                                              decoration: BoxDecoration(
                                                color: AppVariables.lightGreen
                                                    .withValues(alpha: .2),
                                              ),
                                              child: Icon(Icons.add),
                                            ),
                                          ),
                                        ),

                                        Spacer(),
                                        Text(
                                          'Frequency',
                                          style: TextStyle(
                                            fontSize: 14.5.sp,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.black54,
                                          ),
                                        ),
                                        SizedBox(width: 20.sp),

                                        //**
                                        // frequency of time
                                        // */
                                        Container(
                                          padding: EdgeInsets.all(
                                            10.sp,
                                          ).copyWith(bottom: 0, top: 0),
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                              15.sp,
                                            ),
                                            color: AppVariables.lightGreen,
                                          ),
                                          child: DropdownButton<String>(
                                            // dropdownColor: AppVariables.lightGreen,
                                            value: _chosenRepeat,

                                            style: TextStyle(
                                              fontSize: 14.5.sp,
                                              color: Colors.white,
                                            ),
                                            underline: SizedBox.shrink(),
                                            items:
                                                AppVariables.repeatMode2
                                                    .map(
                                                      (e) => DropdownMenuItem<
                                                        String
                                                      >(
                                                        onTap: () {
                                                          setState1(() {
                                                            _chosenRepeat = e;
                                                          });
                                                        },

                                                        value:
                                                            e, // Added value property
                                                        child: Text(
                                                          e,
                                                          style: TextStyle(
                                                            fontSize: 14.5.sp,
                                                            color: Colors.black,
                                                          ),
                                                        ),
                                                      ),
                                                    )
                                                    .toList(),
                                            onChanged: (String? value) {
                                              if (value != null) {
                                                setState1(() {
                                                  _chosenRepeat =
                                                      value; // Actually update the value
                                                });
                                              }
                                            },
                                          ),
                                        ),
                                        SizedBox(height: 20.sp),

                                        //**
                                        // interval
                                        // */
                                      ],
                                    ),
                                  )
                                  : SizedBox.shrink(),
                            ],
                          ),

                          SizedBox(height: 10.sp),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Choose days of the week',
                                style: TextStyle(
                                  fontSize: 14.5.sp,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black,
                                ),
                              ),
                              Switch(
                                activeColor: AppVariables.lightGreen,
                                value: _dayFrequency,
                                onChanged: (value) {
                                  setState1(() {
                                    _dayFrequency = value;
                                    // _timeFrequency = false;
                                  });
                                },
                              ),
                            ],
                          ),
                          SizedBox(height: 10.sp),
                          _dayFrequency == true
                              ? Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 15.sp,
                                  vertical: 10.sp,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  //  mainAxisSize: MainAxisSize.max,
                                  children: List.generate(7, (index) {
                                    return GestureDetector(
                                      onTap: () {
                                        if (!(_index2.contains(index))) {
                                          setState1(() {
                                            _index2.add(index);
                                          });
                                        } else {
                                          setState1(() {
                                            _index2.remove(index);
                                          });
                                        }
                                      },
                                      child: Container(
                                        padding: EdgeInsets.all(15.sp),
                                        margin: EdgeInsets.all(5.sp),
                                        decoration: BoxDecoration(
                                          color:
                                              !(_index2.contains(index))
                                                  ? null
                                                  : AppVariables.lightGreen,
                                          border:
                                              !(_index2.contains(index))
                                                  ? Border.all(
                                                    color: Colors.black45,
                                                  )
                                                  : null,
                                          shape: BoxShape.circle,
                                        ),
                                        child: Text(
                                          _days[index],
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 14.5.sp,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                    );
                                  }),
                                ),
                              )
                              : SizedBox.shrink(),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Choose an end occurrence period',
                                style: TextStyle(
                                  fontSize: 14.5.sp,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black,
                                ),
                              ),
                              Switch(
                                activeColor: AppVariables.lightGreen,
                                value: _endOccurrence,
                                onChanged: (value) {
                                  setState1(() {
                                    _endOccurrence = value;
                                    // _timeFrequency = false;
                                  });
                                },
                              ),
                            ],
                          ),
                        ],
                      )
                      : SizedBox.shrink(),
                  _endOccurrence == true
                      ? Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 15.sp,
                          vertical: 10.sp,
                        ),
                      //  child: DatePicker,
                      )
                      : SizedBox.shrink(),

                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _chosenMode = AppVariables.repeatMode[_index1];
                      });
                      context.pop();
                    },

                    style: ElevatedButton.styleFrom(
                      fixedSize: Size.fromWidth(100.w),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadiusGeometry.circular(15.sp),
                      ),
                      backgroundColor: AppVariables.lightGreen,
                    ),
                    child: Text(
                      'Save',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14.5.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

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
                textAlign: TextAlign.left,
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
                        InkWell(
                          onTap: () => showPriority(),
                          child: Container(
                            padding: EdgeInsets.all(10.sp),
                            height: 30.sp,

                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.sp),
                              color: Colors.white,
                              border: Border.all(color: Colors.black45),
                            ),

                            child: Row(
                              children: [
                                _chosenPriority['icon'] as Icon,
                                SizedBox(width: 10.sp),
                                Text(
                                  _chosenPriority['title'],
                                  style: TextStyle(fontSize: 14.5.sp),
                                ),
                                Spacer(),
                                Icon(Icons.keyboard_arrow_down_outlined),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 10.sp),

                  //**
                  // repeat mode
                  // */
                  Expanded(
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
                        InkWell(
                          onTap: () => showRepeatMode(),
                          child: Container(
                            padding: EdgeInsets.all(10.sp),
                            height: 30.sp,

                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.sp),
                              color: Colors.white,
                              border: Border.all(color: Colors.black45),
                            ),

                            child: Row(
                              children: [
                                Icon(
                                  Icons.calendar_month,
                                  color: Colors.black54,
                                ),
                                SizedBox(width: 10.sp),
                                Text(
                                  _chosenMode,
                                  style: TextStyle(fontSize: 14.5.sp),
                                ),
                                Spacer(),
                                Icon(Icons.keyboard_arrow_down_outlined),
                              ],
                            ),
                          ),
                        ),
                      ],
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
