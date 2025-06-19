import 'package:go_router/go_router.dart';
import 'package:plan/feautures/onboard_screen/onboard_screen.dart';

class AppRoutes {
  static GoRouter goRouter = GoRouter(routes: [GoRoute(path: '', builder: (context, state) => 
  OnBoardScreen(),)]);
}
