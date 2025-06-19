import 'package:flutter/material.dart';
import 'package:plan/constants/routes.dart';
import 'package:sizer/sizer.dart';

void main() {
  WidgetsFlutterBinding();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder:
          (p0, p1, p2) => MaterialApp.router(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            ),
            routerConfig: AppRoutes.goRouter,
          ),
    );
  }
}
