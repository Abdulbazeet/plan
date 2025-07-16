import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:plan/common/utils.dart';
import 'package:plan/feautures/addTask/addTask.dart';
import 'package:plan/feautures/auth/bloc/auth_bloc.dart';
import 'package:plan/feautures/home_screen/home_screen.dart';
import 'package:plan/feautures/onboard_screen/onboard_screen.dart';
import 'package:plan/feautures/auth/sign_in/sign_in.dart';
import 'package:plan/feautures/auth/sign_up/sign_up.dart';
import 'package:plan/splash_screen/splash_screen.dart';

class AppRoutes {
  static final GlobalKey<NavigatorState> _rootNavigatorKey =
      GlobalKey<NavigatorState>();
  static GoRouter goRouter(BuildContext context) {
    return GoRouter(
      refreshListenable: GoRouterRefreshStream(
        BlocProvider.of<AuthBloc>(context).stream,
      ),
      navigatorKey: _rootNavigatorKey,

      // redirect: (context, state) {
      //   final authState = BlocProvider.of<AuthBloc>(context).state;
      //   if (authState is AuthInitial) {
      //     return state.matchedLocation == '/splash-screen'
      //         ? null
      //         : '/splash-screen';
      //   } else if (authState is Authenticated) {
      //     return state.matchedLocation == '/homescreen' ? null : '/homescreen';
      //   } else if (authState is Unauthenticated) {
      //     return state.matchedLocation == '/' ? null : '/';
      //   }

      //   return null;
      // },
      redirect: (context, state) {
        final authState = BlocProvider.of<AuthBloc>(context).state;
        final loc = state.fullPath;

        final isAuthRoute =
            loc == '/' || loc == '/sign-in' || loc == '/sign-up';
        final isProtected = loc == '/homescreen' || loc == '/add-task';

        if (authState is AuthInitial) {
          return loc == '/splash-screen' ? null : '/splash-screen';
        }

        if (authState is Authenticated) {
          if (isAuthRoute || loc == '/splash-screen') return '/homescreen';
          return null;
        }

        if (authState is Unauthenticated) {
          if (isProtected) return '/';
          return null;
        }

        return null;
      },
      routes: [
        GoRoute(path: '/', builder: (context, state) => OnBoardScreen()),
        GoRoute(
          path: '/splash-screen',
          builder: (context, state) => SplashScreen(),
        ),
        GoRoute(path: '/sign-up', builder: (context, state) => SignUp()),
        GoRoute(path: '/sign-in', builder: (context, state) => SignIn()),
        GoRoute(path: '/homescreen', builder: (context, state) => HomeScreen()),
        GoRoute(path: '/add-task', builder: (context, state) => AddTask()),
      ],
    );
  }
}
