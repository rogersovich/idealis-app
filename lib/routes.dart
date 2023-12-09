import 'package:flutter/material.dart';
//* Import Screens
import 'src/feature/home/presentation/screens/home_screen.dart';
import 'src/feature/introduction/presentation/widgets/introduction_screen.dart';

class Routes {
  static const String home = '/home';
  static const String introduction = '/';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case introduction:
        return MaterialPageRoute(builder: (_) => const IntroductionScreen());
      case home:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      default:
        throw const FormatException('Route not found! Check routes again.');
    }
  }
}