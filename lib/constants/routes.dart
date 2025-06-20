import 'package:go_router/go_router.dart';
import 'package:plan/feautures/onboard_screen/onboard_screen.dart';
import 'package:plan/feautures/sign_in/sign_in.dart';
import 'package:plan/feautures/sign_up/sign_up.dart';

class AppRoutes {
  static GoRouter goRouter = GoRouter(
    routes: [
      GoRoute(path: '/', builder: (context, state) => OnBoardScreen()),
      GoRoute(path: '/sign-up', builder: (context, state) => SignUp()),
      GoRoute(path: '/sign-in', builder: (context, state) => SignIn()),
    ],
  );
}
