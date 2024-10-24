import 'package:flutter/material.dart';
import 'package:news_app/data/core/config/page_routes_name.dart';
import 'package:news_app/features/home/pages/home_veiw.dart';
import 'package:news_app/models/splash/pages/splash_view.dart';

class AppRouter {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case PageRoutesName.intial:
        return MaterialPageRoute(
            builder: (context) => SplashVeiw(), settings: settings);
      case PageRoutesName.home:
        return MaterialPageRoute(
            builder: (context) => const HomeVeiw(), settings: settings);
      default:
        return MaterialPageRoute(
            builder: (context) => SplashVeiw(), settings: settings);
    }
  }
}
