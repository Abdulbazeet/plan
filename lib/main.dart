import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:plan/constants/routes.dart';
import 'package:plan/feautures/auth/bloc/auth_bloc.dart';
import 'package:plan/feautures/auth/sign_in/bloc/sign_in_bloc.dart';
import 'package:plan/feautures/auth/sign_up/bloc/sign_up_bloc.dart';
import 'package:plan/splash_screen/splash_screen.dart';
import 'package:sizer/sizer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder:
          (p0, p1, p2) => MultiBlocProvider(
            providers: [
              BlocProvider(create: (context) => AuthBloc()),
              BlocProvider(create: (context) => SignUpBloc()),
              BlocProvider(create: (context) => SignInBloc()),
            ],
            child: Builder(
              builder: (context) {
                  final goRouter = AppRoutes.goRouter(context); 
                return MaterialApp.router(
                  debugShowCheckedModeBanner: false,
                  title: 'Flutter Demo',
                  theme: ThemeData(
                    colorScheme: ColorScheme.fromSeed(
                      seedColor: Colors.deepPurple,
                    ),
                  ),
                  routerConfig: goRouter,
                );
              },
            ),
          ),
    );
  }
}
