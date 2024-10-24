import 'dart:async';

import 'package:flutter/material.dart';

import '../../../data/core/config/page_routes_name.dart';

class SplashVeiw extends StatefulWidget {
  @override
  State<SplashVeiw> createState() => _SplashVeiwState();
}

class _SplashVeiwState extends State<SplashVeiw> {
  @override
  @override
  void initState() {
    Timer(const Duration(seconds: 3),
        () => Navigator.pushReplacementNamed(context, PageRoutesName.home));
    super.initState();
  }

  Widget build(BuildContext context) {
    // هنا احنا عمدينا صوره فوقيها ايقون
    return Scaffold(
      body: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          Image.asset("assets/images/pattern.png"),
          Image.asset("assets/icons/logo.png"),
        ],
      ),
    );
  }
}
