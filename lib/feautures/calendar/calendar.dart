import 'package:flutter/material.dart';
import 'package:plan/constants/variables.dart';
import 'package:sizer/sizer.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';

class Calendar extends StatefulWidget {
  const Calendar({super.key});

  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  CalendarFormat _calendarFormat = CalendarFormat.week;

  DateTime _focusedDay = DateTime.now();
  DateTime _selectedDay = DateTime.now();
  bool _showMonthYearPicker = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppVariables.bgColor,
      body: Padding(
        padding: EdgeInsets.all(20.sp).copyWith(bottom: 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              // margin: EdgeInsets.all(20.sp),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20.sp),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TableCalendar(
                    calendarFormat: _calendarFormat,
                    focusedDay: _focusedDay,
                    firstDay: DateTime(1800),
                    lastDay: DateTime(2100),
                    onFormatChanged: (format) {
                      setState(() {
                        _calendarFormat = format;
                      });
                    },

                    onDaySelected: (selectedDay, focusedDay) {
                      setState(() {
                        _selectedDay = selectedDay;
                        _focusedDay = focusedDay;
                      });
                    },
                    selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
                    headerVisible: true,
                    headerStyle: HeaderStyle(
                      titleCentered: true,
                      formatButtonVisible: false,
                      titleTextFormatter:
                          (_, __) => '', // hide default header title
                    ),
                    calendarStyle: CalendarStyle(
                      selectedDecoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppVariables.lightPurple,
                        // borderRadius: BorderRadius.circular(15),
                      ),
                      tablePadding: EdgeInsets.zero,
                      todayDecoration: BoxDecoration(
                        color: AppVariables.lightGreen,
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    calendarBuilders: CalendarBuilders(
                      headerTitleBuilder: (context, day) {
                        return _showMonthYearPicker
                            ? Row(
                              mainAxisAlignment: MainAxisAlignment.center,
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
                                      ),
                                    );
                                  }),
                                  onChanged: (value) {
                                    if (value != null) {
                                      setState(() {
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
                                      child: Text('$year'),
                                    );
                                  }),
                                  onChanged: (value) {
                                    if (value != null) {
                                      setState(() {
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
                                    setState(() {
                                      _showMonthYearPicker = false;
                                    });
                                  },
                                ),
                              ],
                            )
                            : GestureDetector(
                              onTap: () {
                                setState(() {
                                  _showMonthYearPicker = true;
                                });
                              },
                              child: Text(
                                DateFormat.yMMMM().format(day),
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            );
                      },
                    ),
                  ),

                  // TableCalendar(
                  //   calendarFormat: _calendarFormat,

                  //   firstDay: DateTime(1800),
                  //   lastDay: DateTime(2100),

                  //   onFormatChanged: (format) {
                  //     print(format);
                  //   },
                  //   onHeaderTapped: (focusedDay) {},
                  //   focusedDay: _focusedDay,

                  //   headerStyle: HeaderStyle(
                  //     titleCentered: true,
                  //     formatButtonVisible: false,
                  //   ),

                  //   calendarStyle: CalendarStyle(
                  //     tablePadding: EdgeInsets.all(0),
                  //     //  Decoration: BoxDecoration(color: Colors.white),
                  //     todayDecoration: BoxDecoration(
                  //       color: AppVariables.lightGreen,
                  //       borderRadius: BorderRadius.circular(15.sp),
                  //     ),
                  //   ),
                  //   calendarBuilders: CalendarBuilders(
                  //     headerTitleBuilder: (context, day) {
                  //       return GestureDetector(
                  //         onTap: () async {
                  //           final picked = await showMonthYearPicker(
                  //             context: context,
                  //             initialDate: _focusedDay,
                  //             firstDate: DateTime(1800),
                  //             lastDate: DateTime(2100),
                  //           );

                  //           if (picked != null) {
                  //             setState(() {
                  //               _focusedDay = picked;
                  //             });
                  //           }
                  //         },
                  //         child: Text(
                  //           DateFormat.yMMMM().format(day),
                  //           style: TextStyle(
                  //             fontSize: 18,
                  //             fontWeight: FontWeight.bold,
                  //           ),
                  //         ),
                  //       );
                  //     },
                  //   ),
                  // ),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        _calendarFormat =
                            _calendarFormat == CalendarFormat.week
                                ? CalendarFormat.month
                                : CalendarFormat.week;
                      });
                    },
                    icon:
                        _calendarFormat == CalendarFormat.week
                            ? Icon(
                              Icons.keyboard_arrow_down_outlined,
                              color: Colors.black,
                            )
                            : Icon(
                              Icons.keyboard_arrow_up_outlined,
                              color: Colors.black,
                            ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.sp),
            Text(
              'All Events',
              style: TextStyle(color: AppVariables.lightGreen, fontSize: 16.sp),
            ),
            SizedBox(height: 20.sp),
            Expanded(
              child: ListView.builder(
                itemCount: AppVariables.tasksList.length,
                itemBuilder: (context, index) {
                  final items = AppVariables.tasksList[index];
                  return Padding(
                    padding: EdgeInsets.symmetric(vertical: 10.sp),
                    child: IntrinsicHeight(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,

                        children: [
                          SizedBox(
                            width: 35.sp,

                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  items['startTime'],
                                  style: TextStyle(fontSize: 14.5.sp),
                                ),
                                Text(
                                  items['endTime'],
                                  style: TextStyle(fontSize: 14.5.sp),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(width: 20.sp),
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.all(15.sp),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20.sp),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    items['title'],
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15.sp,
                                    ),
                                  ),
                                  SizedBox(height: 10.sp),
                                  Text(
                                    items['description'],
                                    style: TextStyle(
                                      fontWeight: FontWeight.normal,
                                      fontSize: 14.5.sp,
                                    ),
                                    maxLines: 3,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  SizedBox(height: 10.sp),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.flag,

                                        color: switch (items['priority']) {
                                          'high' => Colors.red,
                                          'medium' => Colors.yellow,
                                          'low' => AppVariables.lightGreen,
                                          _ => null,
                                        },
                                      ),
                                      SizedBox(width: 20.sp),
                                      Container(
                                        padding: EdgeInsets.all(10.sp),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                            15.sp,
                                          ),
                                          color:
                                              items['type'] == 'personal'
                                                  ? AppVariables.lightGreen
                                                      .withValues(alpha: .1)
                                                  : AppVariables.lightPurple
                                                      .withValues(alpha: .1),
                                        ),
                                        child: Text(
                                          items['type'],
                                          style: TextStyle(
                                            fontSize: 14.sp,
                                            color:
                                                items['type'] == 'personal'
                                                    ? AppVariables.lightGreen
                                                    : AppVariables.lightPurple,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
