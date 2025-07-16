import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:plan/feautures/addTask/addTask.dart';
import 'package:plan/feautures/home_screen/home_screen.dart';
import 'package:plan/feautures/onboard_screen/onboard_screen.dart';
import 'package:plan/feautures/auth/sign_in/sign_in.dart';
import 'package:plan/feautures/auth/sign_up/sign_up.dart';
import 'package:plan/splash_screen/splash_screen.dart';

class AppRoutes {
  static GoRouter goRouter = GoRouter(
    // redirect: (context, state) {
    //   final authState = BlocProvider.of<AuthBloc>(context).state;
    //   final loc = state.fullPath;
    //   print('Redirect: authState=$authState, location=$loc, fullState=$state');

    //   if (authState is AuthInitial) {
    //     return loc == '/splash-screen' ? null : '/splash-screen';
    //   } else if (authState is Authenticated) {
    //     return loc == '/homescreen' ? null : '/homescreen';
    //   } else if (authState is Unauthenticated) {
    //     return loc == '/' ? null : '/';
    //   }

    //   return null;
    // },
    routes: [

      GoRoute(path: '/', builder: (context, state) => SplashScreen()),
      GoRoute(path: '/onboard-screen', builder: (context, state) => OnBoardScreen()),
      
      GoRoute(path: '/sign-up', builder: (context, state) => SignUp()),
      GoRoute(path: '/sign-in', builder: (context, state) => SignIn()),
      GoRoute(path: '/homescreen', builder: (context, state) => HomeScreen()),
      GoRoute(path: '/add-task', builder: (context, state) => AddTask()),
    ],
  );
}
