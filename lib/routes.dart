import 'package:flutter/material.dart';
//* Import Screens
import 'src/feature/home/presentation/screens/home_screen.dart';
import 'src/feature/introduction/presentation/widgets/introduction_screen.dart';

class Routes {
  static const String introduction = '/';
  static const String home = '/home';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case introduction:
        return MaterialPageRoute(builder: (_) => const OnBoardingPage());
      case home:
        return MaterialPageRoute(builder: (_) => const HomePage());
      default:
        throw const FormatException('Route not found! Check routes again.');
    }
  }
}
