import 'package:flutter/material.dart';
import 'package:plan/constants/variables.dart';

class Calendar extends StatefulWidget {
  const Calendar({super.key});

  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: AppVariables.bgColor);
  }
}
