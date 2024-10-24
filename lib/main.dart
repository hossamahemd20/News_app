import 'package:flutter/material.dart';
import 'package:news_app/models/artical_detailes/artical_details.dart';

import 'data/core/config/app_route.dart';
import 'data/core/config/applcation_theme_manger.dart';
import 'data/core/config/page_routes_name.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'News app',
      debugShowCheckedModeBanner: false,
      theme: ApplactionThemeManger.themeData,
      initialRoute: PageRoutesName.intial,
      onGenerateRoute: AppRouter.onGenerateRoute,
      routes: {
        ArticleDetails.routeName: (_) => const ArticleDetails(),
      },
    );
  }
}
