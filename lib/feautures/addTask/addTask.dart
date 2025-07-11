// ignore_for_file: no_leading_underscores_for_local_identifiers, unused_local_variable

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:plan/constants/variables.dart';
import 'package:sizer/sizer.dart';
import 'package:table_calendar/table_calendar.dart';

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

  // String formatted = DateFormat('EEEE, MMMM d, y').format(DateTime.now());

  String startTaskTime = '00:00';
  String endTaskTime = '00:00';
  //
  DateTime endDate = DateTime.now();
  DateTime startDate = DateTime.now();
  String formaatedStartDate() {
    return DateFormat('EEE, MMMM d, y').format(startDate);
  }

  String formaatedEndDate() {
    return DateFormat('EEE, MMMM d, y').format(endDate);
  }

  bool? _endDate = false;

  showPriority() {
    return showModalBottomSheet(
      isDismissible: false,
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
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Select Task Priority',
                        style: TextStyle(
                          fontSize: 17.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          context.pop();
                        },
                        child: Container(
                          padding: EdgeInsets.all(10.sp),
                          decoration: BoxDecoration(
                            color: Colors.black38,
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.close,
                            color: Colors.black,
                            size: 15.sp,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20.sp),

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
      isDismissible: false,
      useSafeArea: true,

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
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Select Repeat Mode',
                          style: TextStyle(
                            fontSize: 17.sp,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        GestureDetector(
                          onTap: () {
                            context.pop();
                          },
                          child: Container(
                            padding: EdgeInsets.all(10.sp),
                            decoration: BoxDecoration(
                              color: Colors.black38,
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              Icons.close,
                              color: Colors.black,
                              size: 15.sp,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20.sp),
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
                              borderRadius: BorderRadiusGeometry.circular(
                                15.sp,
                              ),
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
                                              borderRadius:
                                                  BorderRadius.circular(15.sp),
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
                                                              color:
                                                                  Colors.black,
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
                          ],
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
              ),
            );
          },
        );
      },
    );
  }

  //**
  // due date dialog
  // */

  showDueDate() {
    DateTime _focusedDay = DateTime.now();
    DateTime _focusedDay2 = DateTime.now();
    DateTime _selectedDay = startDate;
    DateTime _selectedDay2 = endDate;

    bool _showStartCalendar = true;
    // bool? _endDate = false;
    bool _showMonthYearPicker = false;
    CalendarFormat _startCalendarFormat = CalendarFormat.month;
    CalendarFormat _endCalendarFormat = CalendarFormat.month;

    showModalBottomSheet(
      context: context,
      isDismissible: false,
      useSafeArea: true,

      isScrollControlled: true,

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
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Date and Time',
                          style: TextStyle(
                            fontSize: 17.sp,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        GestureDetector(
                          onTap: () {
                            context.pop();
                          },
                          child: Container(
                            padding: EdgeInsets.all(10.sp),
                            decoration: BoxDecoration(
                              color: Colors.black38,
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              Icons.close,
                              color: Colors.black,
                              size: 15.sp,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10.sp),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Choose start date',
                          style: TextStyle(
                            fontSize: 14.5.sp,
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Switch(
                          activeColor: AppVariables.lightGreen,
                          value: true,
                          onChanged: (value) {
                            // value == true
                            // ? setState1(() {
                            //   _endDate = null;
                            // })
                            // : null;
                          },
                        ),
                      ],
                    ),

                    // _showStartCalendar == true
                    //     ?
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 10.sp),
                          decoration: BoxDecoration(
                            color: AppVariables.lightGreen.withValues(
                              alpha: .1,
                            ),
                            borderRadius: BorderRadius.circular(20.sp),
                          ),

                          child: TableCalendar(
                            focusedDay: _focusedDay,
                            firstDay: DateTime(1800),
                            lastDay: DateTime(2100),

                            onDaySelected: (selectedDay, focusedDay) {
                              setState1(() {
                                _selectedDay = selectedDay;
                                _focusedDay = focusedDay;
                              });
                            },
                            selectedDayPredicate:
                                (day) => isSameDay(_selectedDay, day),
                            headerStyle: HeaderStyle(
                              formatButtonVisible: false,
                              // titleTextFormatter: (_, __) => '',
                            ),
                            calendarFormat: _startCalendarFormat,

                            calendarStyle: CalendarStyle(
                              selectedDecoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppVariables.lightGreen,
                              ),
                              tablePadding: EdgeInsets.zero,
                              todayDecoration: BoxDecoration(
                                color: AppVariables.lightPurple,
                                shape: BoxShape.circle,
                              ),
                            ),
                            calendarBuilders: CalendarBuilders(
                              headerTitleBuilder: (context, day) {
                                return _showMonthYearPicker
                                    ? Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        DropdownButton<int>(
                                          value: _focusedDay.month,
                                          items: List.generate(12, (index) {
                                            final month = index + 1;
                                            return DropdownMenuItem(
                                              value: month,
                                              child: Text(
                                                DateFormat.MMMM().format(
                                                  DateTime(0, month),
                                                ),
                                                style: TextStyle(
                                                  fontSize: 14.5.sp,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            );
                                          }),
                                          onChanged: (value) {
                                            if (value != null) {
                                              setState1(() {
                                                _focusedDay = DateTime(
                                                  _focusedDay.year,
                                                  value,
                                                );
                                              });
                                            }
                                          },
                                        ),
                                        const SizedBox(width: 8),
                                        DropdownButton<int>(
                                          value: _focusedDay.year,
                                          items: List.generate(301, (index) {
                                            final year = 1800 + index;
                                            return DropdownMenuItem(
                                              value: year,
                                              child: Text(
                                                '$year',
                                                style: TextStyle(
                                                  fontSize: 14.5.sp,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            );
                                          }),
                                          onChanged: (value) {
                                            if (value != null) {
                                              setState1(() {
                                                _focusedDay = DateTime(
                                                  value,
                                                  _focusedDay.month,
                                                );
                                              });
                                            }
                                          },
                                        ),
                                        IconButton(
                                          icon: const Icon(Icons.check),
                                          onPressed: () {
                                            setState1(() {
                                              _showMonthYearPicker = false;
                                            });
                                          },
                                        ),
                                      ],
                                    )
                                    : GestureDetector(
                                      onTap: () {
                                        setState1(() {
                                          _showMonthYearPicker = true;
                                        });
                                      },
                                      child: Row(
                                        children: [
                                          Text(
                                            DateFormat.yMMMM().format(day),
                                            style: TextStyle(
                                              fontSize: 14.5.sp,

                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          SizedBox(width: 10.sp),
                                          Icon(
                                            Icons.keyboard_arrow_down_outlined,
                                          ),
                                        ],
                                      ),
                                    );
                              },
                            ),
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            setState1(() {
                              _startCalendarFormat =
                                  _startCalendarFormat == CalendarFormat.month
                                      ? CalendarFormat.week
                                      : CalendarFormat.month;
                            });
                          },
                          icon:
                              _startCalendarFormat == CalendarFormat.month
                                  ? Icon(Icons.keyboard_arrow_up_rounded)
                                  : Icon(Icons.keyboard_arrow_down_sharp),
                        ),
                      ],
                    ),

                    // : SizedBox.shrink(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Choose end date',
                          style: TextStyle(
                            fontSize: 14.5.sp,
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Switch(
                          activeColor: AppVariables.lightGreen,
                          value: _endDate!,
                          onChanged: (value) {
                            setState1(() {
                              _endDate = value;

                              _startCalendarFormat = CalendarFormat.week;
                            });
                          },
                        ),
                      ],
                    ),

                    _endDate == true
                        ? Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 10.sp),
                              decoration: BoxDecoration(
                                color: AppVariables.lightGreen.withValues(
                                  alpha: .1,
                                ),
                                borderRadius: BorderRadius.circular(20.sp),
                              ),

                              child: TableCalendar(
                                focusedDay: _focusedDay2,
                                firstDay: DateTime(1800),
                                lastDay: DateTime(2100),

                                onDaySelected: (selectedDay, focusedDay) {
                                  setState1(() {
                                    _selectedDay2 = selectedDay;
                                    _focusedDay2 = focusedDay;
                                  });
                                },
                                calendarFormat: _endCalendarFormat,
                                selectedDayPredicate:
                                    (day) => isSameDay(_selectedDay2, day),
                                headerStyle: HeaderStyle(
                                  formatButtonVisible: false,
                                  // titleTextFormatter: (_, __) => '',
                                ),

                                calendarStyle: CalendarStyle(
                                  selectedDecoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: AppVariables.lightGreen,
                                  ),
                                  tablePadding: EdgeInsets.zero,
                                  todayDecoration: BoxDecoration(
                                    color: AppVariables.lightPurple,
                                    shape: BoxShape.circle,
                                  ),
                                ),
                                calendarBuilders: CalendarBuilders(
                                  headerTitleBuilder: (context, day) {
                                    return _showMonthYearPicker
                                        ? Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            DropdownButton<int>(
                                              value: _focusedDay2.month,
                                              items: List.generate(12, (index) {
                                                final month = index + 1;
                                                return DropdownMenuItem(
                                                  value: month,
                                                  child: Text(
                                                    DateFormat.MMMM().format(
                                                      DateTime(0, month),
                                                    ),
                                                    style: TextStyle(
                                                      fontSize: 14.5.sp,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                );
                                              }),
                                              onChanged: (value) {
                                                if (value != null) {
                                                  setState1(() {
                                                    _focusedDay2 = DateTime(
                                                      _focusedDay2.year,
                                                      value,
                                                    );
                                                  });
                                                }
                                              },
                                            ),
                                            const SizedBox(width: 8),
                                            DropdownButton<int>(
                                              value: _focusedDay2.year,
                                              items: List.generate(301, (
                                                index,
                                              ) {
                                                final year = 1800 + index;
                                                return DropdownMenuItem(
                                                  value: year,
                                                  child: Text(
                                                    '$year',
                                                    style: TextStyle(
                                                      fontSize: 14.5.sp,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                );
                                              }),
                                              onChanged: (value) {
                                                if (value != null) {
                                                  setState1(() {
                                                    _focusedDay2 = DateTime(
                                                      value,
                                                      _focusedDay2.month,
                                                    );
                                                  });
                                                }
                                              },
                                            ),
                                            IconButton(
                                              icon: const Icon(Icons.check),
                                              onPressed: () {
                                                setState1(() {
                                                  _showMonthYearPicker = false;
                                                });
                                              },
                                            ),
                                          ],
                                        )
                                        : GestureDetector(
                                          onTap: () {
                                            setState1(() {
                                              _showMonthYearPicker = true;
                                            });
                                          },
                                          child: Row(
                                            children: [
                                              Text(
                                                DateFormat.yMMMM().format(day),
                                                style: TextStyle(
                                                  fontSize: 14.5.sp,

                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              SizedBox(width: 10.sp),
                                              Icon(
                                                Icons
                                                    .keyboard_arrow_down_outlined,
                                              ),
                                            ],
                                          ),
                                        );
                                  },
                                ),
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                setState1(() {
                                  _endCalendarFormat =
                                      _endCalendarFormat == CalendarFormat.month
                                          ? CalendarFormat.week
                                          : CalendarFormat.month;
                                });
                              },
                              icon:
                                  _endCalendarFormat == CalendarFormat.month
                                      ? Icon(Icons.keyboard_arrow_up_rounded)
                                      : Icon(Icons.keyboard_arrow_down_sharp),
                            ),
                          ],
                        )
                        : SizedBox.shrink(),
                    ElevatedButton(
                      onPressed: () {
                        if (_selectedDay2.isBefore(_selectedDay)) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                'End date must be after start date',
                                style: TextStyle(fontSize: 14.5.sp),
                              ),
                            ),
                          );
                          context.pop();
                        } else {
                          setState(() {
                            endDate = _selectedDay2;
                            startDate = _selectedDay;
                          });
                          context.pop();
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppVariables.lightGreen,
                        fixedSize: Size.fromWidth(100.w),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadiusGeometry.circular(15.sp),
                        ),
                        padding: EdgeInsets.symmetric(
                          horizontal: 20.sp,
                          vertical: 15.sp,
                        ),
                      ),
                      child: Text(
                        'Save',
                        style: TextStyle(
                          fontSize: 14.5.sp,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  showTimeDialog() {
    List<String> startPart = startTaskTime.split(':');
    List<String> endParts = endTaskTime.split(':');

    int _startHourIndex = int.parse(startPart[0]);
    int _startSecondsIndex = int.parse(startPart[1]);
    int _endHourIndex = int.parse(endParts[0]);
    int _endSecondsIndex = int.parse(endParts[1]);
    int hourCount = 24;
    int secondCount = 60;
    bool isStartime = true;
    FixedExtentScrollController _startHourcontroller =
        FixedExtentScrollController(initialItem: _startHourIndex);
    FixedExtentScrollController _endHourcontroller =
        FixedExtentScrollController(initialItem: _endHourIndex);
    FixedExtentScrollController _startSecondscontroller =
        FixedExtentScrollController(initialItem: _startSecondsIndex);
    FixedExtentScrollController _endSecondscontroller =
        FixedExtentScrollController(initialItem: _endSecondsIndex);

    int getHourValue(int index) => index % hourCount;
    int getSecondsValue(int index) => index % hourCount;

    showModalBottomSheet(
      context: context,
      isDismissible: false,
      useSafeArea: true,

      isScrollControlled: true,

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
            String startTime() {
              String _t = "00:00";
              var _a = _startHourIndex.toString().padLeft(2, '0');
              var _b = _startSecondsIndex.toString().padLeft(2, '0');

              return _t = "$_a : $_b";
            }

            String endTime() {
              String _t = "00:00";
              var _a = _endHourIndex.toString().padLeft(2, '0');
              var _b = _endSecondsIndex.toString().padLeft(2, '0');

              return _t = "$_a : $_b";
            }

            return Padding(
              padding: EdgeInsets.all(15.sp),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Choose Time',
                        style: TextStyle(
                          fontSize: 17.sp,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      GestureDetector(
                        onTap: () {
                          context.pop();
                        },
                        child: Container(
                          padding: EdgeInsets.all(10.sp),
                          decoration: BoxDecoration(
                            color: Colors.black38,
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.close,
                            color: Colors.black,
                            size: 15.sp,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10.sp),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Start Time',
                            style: TextStyle(
                              fontSize: 14.5.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(height: 15.sp),
                          GestureDetector(
                            onTap: () {
                              setState1(() {
                                isStartime = true;
                              });

                              WidgetsBinding.instance.addPostFrameCallback((
                                timeStamp,
                              ) {
                                _startHourcontroller.jumpToItem(
                                  _startHourIndex,
                                );
                                _startSecondscontroller.jumpToItem(
                                  _startSecondsIndex,
                                );
                              });
                            },
                            child: Container(
                              margin: EdgeInsets.symmetric(horizontal: 15.sp),
                              padding: EdgeInsets.symmetric(
                                horizontal: 20.sp,
                                vertical: 15.sp,
                              ),
                              decoration: BoxDecoration(
                                color:
                                    isStartime == true
                                        ? AppVariables.lightGreen
                                        : Colors.transparent,
                                borderRadius: BorderRadius.circular(15.sp),
                                border:
                                    isStartime == false ? Border.all() : null,
                              ),
                              child: Text(
                                startTime(),
                                style: TextStyle(
                                  fontSize: 14.5.sp,
                                  color:
                                      isStartime == true
                                          ? Colors.white
                                          : Colors.black,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'End Time',
                            style: TextStyle(
                              fontSize: 14.5.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(height: 15.sp),
                          GestureDetector(
                            onTap: () {
                              setState1(() {
                                isStartime = false;

                                WidgetsBinding.instance.addPostFrameCallback((
                                  timeStamp,
                                ) {
                                  _endHourcontroller.jumpToItem(_endHourIndex);
                                  _endSecondscontroller.jumpToItem(
                                    _endSecondsIndex,
                                  );
                                });
                              });
                            },
                            child: Container(
                              margin: EdgeInsets.symmetric(horizontal: 15.sp),
                              padding: EdgeInsets.symmetric(
                                horizontal: 20.sp,
                                vertical: 15.sp,
                              ),
                              decoration: BoxDecoration(
                                color:
                                    isStartime == false
                                        ? AppVariables.lightGreen
                                        : Colors.transparent,
                                borderRadius: BorderRadius.circular(15.sp),
                                border:
                                    isStartime == true ? Border.all() : null,
                              ),
                              child: Text(
                                endTime(),
                                style: TextStyle(
                                  fontSize: 14.5.sp,

                                  color:
                                      isStartime == true
                                          ? Colors.black
                                          : Colors.white,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 10.sp),
                  SizedBox(width: 100.w, child: Divider(color: Colors.black38)),
                  SizedBox(height: 10.sp),
                  isStartime == true
                      ? Row(
                        children: [
                          Expanded(
                            child: SizedBox(
                              height: 10.h,
                              child: ListWheelScrollView.useDelegate(
                                itemExtent: 20.sp,
                                perspective: .003,
                                controller: _startHourcontroller,
                                physics: FixedExtentScrollPhysics(),
                                onSelectedItemChanged: (index) {
                                  setState1(() {
                                    _startHourIndex = getHourValue(index);

                                    // _startHourIndex = index;//
                                  });
                                },
                                childDelegate: ListWheelChildBuilderDelegate(
                                  //   childCount: _extent,
                                  builder: (context, index) {
                                    final hour = getHourValue(
                                      index,
                                    ).toString().padLeft(2, '0');

                                    final isSelected =
                                        getHourValue(index) == _startHourIndex;
                                    // final hour = (index % hourCount)
                                    //     .toString()
                                    //     .padLeft(2, '0');
                                    // final isSelected =
                                    //     (index % hourCount) ==
                                    //     (_startHourIndex % hourCount);

                                    return Text(
                                      hour,
                                      style: TextStyle(
                                        fontSize: isSelected ? 15.sp : 14.5.sp,
                                        color:
                                            isSelected
                                                ? Colors.black
                                                : Colors.black45,
                                        fontWeight:
                                            isSelected
                                                ? FontWeight.w600
                                                : FontWeight.normal,
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                          ),

                          Text(
                            ':',
                            style: TextStyle(
                              fontSize: 15.sp,
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Expanded(
                            child: SizedBox(
                              height: 10.h,
                              child: ListWheelScrollView.useDelegate(
                                itemExtent: 20.sp,
                                perspective: .003,
                                controller: _startSecondscontroller,
                                physics: FixedExtentScrollPhysics(),
                                onSelectedItemChanged: (index) {
                                  setState1(() {
                                    _startSecondsIndex = getSecondsValue(index);
                                    // _startSecondsIndex = index;
                                  });
                                },
                                childDelegate: ListWheelChildBuilderDelegate(
                                  //   childCount: _extent,
                                  builder: (context, index) {
                                    final seconds = getSecondsValue(
                                      index,
                                    ).toString().padLeft(2, '0');

                                    final isSelected =
                                        getSecondsValue(index) ==
                                        _startSecondsIndex;

                                    // final seconds = (index % secondCount)
                                    //     .toString()
                                    //     .padLeft(2, '0');

                                    // final isSelected =
                                    //     (index % secondCount) ==
                                    //     (_startSecondsIndex % secondCount);
                                    return Text(
                                      seconds,

                                      style: TextStyle(
                                        fontSize: isSelected ? 15.sp : 14.5.sp,
                                        color:
                                            isSelected
                                                ? Colors.black
                                                : Colors.black45,
                                        fontWeight:
                                            isSelected
                                                ? FontWeight.w600
                                                : FontWeight.normal,
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
                      : Row(
                        children: [
                          Expanded(
                            child: SizedBox(
                              height: 10.h,
                              child: ListWheelScrollView.useDelegate(
                                itemExtent: 20.sp,
                                perspective: .003,
                                controller: _endHourcontroller,
                                physics: FixedExtentScrollPhysics(),
                                onSelectedItemChanged: (index) {
                                  setState1(() {
                                    _endHourIndex = getHourValue(index);

                                    // _endHourIndex = index;
                                  });
                                },
                                childDelegate: ListWheelChildBuilderDelegate(
                                  //   childCount: _extent,
                                  builder: (context, index) {
                                    final hour_end = getHourValue(
                                      index,
                                    ).toString().padLeft(2, '0');
                                    final isSelected =
                                        getHourValue(index) == _endHourIndex;

                                    return Text(
                                      hour_end,
                                      style: TextStyle(
                                        fontSize: isSelected ? 15.sp : 14.5.sp,
                                        color:
                                            isSelected
                                                ? Colors.black
                                                : Colors.black45,
                                        fontWeight:
                                            isSelected
                                                ? FontWeight.w600
                                                : FontWeight.normal,
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                          ),

                          Text(
                            ':',
                            style: TextStyle(
                              fontSize: 15.sp,
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Expanded(
                            child: SizedBox(
                              height: 10.h,
                              child: ListWheelScrollView.useDelegate(
                                itemExtent: 20.sp,
                                perspective: .003,
                                controller: _endSecondscontroller,
                                physics: FixedExtentScrollPhysics(),
                                onSelectedItemChanged: (index) {
                                  setState1(() {
                                    _endSecondsIndex = getSecondsValue(index);
                                    // _endSecondsIndex = index;
                                  });
                                },
                                childDelegate: ListWheelChildBuilderDelegate(
                                  //   childCount: _extent,
                                  builder: (context, index) {
                                    final seconds_end = getSecondsValue(
                                      index,
                                    ).toString().padLeft(2, '0');
                                    final isSelected =
                                        getSecondsValue(index) ==
                                        _endSecondsIndex;

                                    return Text(
                                      seconds_end,
                                      style: TextStyle(
                                        fontSize: isSelected ? 15.sp : 14.5.sp,
                                        color:
                                            isSelected
                                                ? Colors.black
                                                : Colors.black45,
                                        fontWeight:
                                            isSelected
                                                ? FontWeight.w600
                                                : FontWeight.normal,
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                  SizedBox(height: 10.sp),
                  SizedBox(width: 100.w, child: Divider(color: Colors.black38)),
                  SizedBox(height: 10.sp),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        if (_startHourIndex > _endHourIndex ||
                            (_startHourIndex == _endHourIndex &&
                                _startSecondsIndex >= _endSecondsIndex)) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                'End time must be after start time',
                                style: TextStyle(fontSize: 14.5.sp),
                              ),
                            ),
                          );
                          context.pop();
                        } else {
                          startTaskTime = startTime();
                          endTaskTime = endTime();
                          context.pop();
                        }
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(
                        horizontal: 20.sp,
                        vertical: 15.sp,
                      ),
                      backgroundColor: AppVariables.lightGreen,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.sp),
                      ),
                      fixedSize: Size.fromWidth(100.w),
                    ),
                    child: Text(
                      'Save ',
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
                onTap: () {
                  showDueDate();
                },
                child: Container(
                  padding: EdgeInsets.all(10.sp),
                  alignment: Alignment.centerLeft,
                  height: 30.sp,
                  width: 100.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.sp),
                    color: Colors.white,
                    border: Border.all(color: Colors.black45),
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.calendar_month, color: Colors.black38),
                      SizedBox(width: 10.sp),
                      _endDate == false
                          ? Text(
                            formaatedStartDate(),
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14.5.sp,
                            ),
                          )
                          : Text(
                            "${formaatedStartDate()}     -     ${formaatedEndDate()}",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14.5.sp,
                            ),
                          ),
                      Spacer(),
                      Icon(Icons.keyboard_arrow_down_sharp),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20.sp),

              //**
              // choose time of alarm
              // */
              Text(
                'Set Time',
                style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 10.sp),
              InkWell(
                onTap: () {
                  showTimeDialog();
                },
                child: Container(
                  padding: EdgeInsets.all(10.sp),
                  alignment: Alignment.centerLeft,
                  height: 30.sp,
                  width: 100.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.sp),
                    color: Colors.white,
                    border: Border.all(color: Colors.black45),
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.timer_sharp, color: Colors.black38),
                      SizedBox(width: 10.sp),
                      Text(
                        '$startTaskTime     -     $endTaskTime',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14.5.sp,
                        ),
                      ),
                      Spacer(),
                      Icon(Icons.keyboard_arrow_down_sharp),
                    ],
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
              SizedBox(height: 20.sp),

              //**
              //
              // category
              // */
              Text(
                'Category',
                style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w600),
              ),

              Wrap(
                spacing: 10.sp,
                runSpacing: 10.sp,

                children: List.generate(AppVariables.categoryLists.length, (
                  index,
                ) {
                  final item = AppVariables.categoryLists[index];
                  final isSelected = _index == index;

                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        _index = index;
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 18.sp,
                        vertical: 10.sp,
                      ),
                      decoration: BoxDecoration(
                        color:
                            isSelected
                                ? AppVariables.lightGreen
                                : Colors.transparent,
                        border:
                            isSelected
                                ? null
                                : Border.all(color: Colors.black38),
                        borderRadius: BorderRadius.circular(20.sp),
                      ),
                      child: Text(
                        item,
                        style: TextStyle(
                          fontSize: 14.5.sp,
                          color: isSelected ? Colors.white : Colors.black,
                        ),
                      ),
                    ),
                  );
                }),
              ),
              SizedBox(height: 20.sp),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20.sp,
                    vertical: 15.sp,
                  ),
                  backgroundColor: AppVariables.lightGreen,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.sp),
                  ),
                  fixedSize: Size.fromWidth(100.w),
                ),
                child: Text(
                  'Cerate Task',
                  style: TextStyle(
                    fontSize: 14.5.sp,
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
