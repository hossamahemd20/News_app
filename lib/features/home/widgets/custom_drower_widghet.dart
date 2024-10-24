import 'package:flutter/material.dart';

import '../../../data/core/config/colors_palette.dart';

class CustomDrowerWidghet extends StatelessWidget {
  final void Function() onCategorytChangedClicked;

  const CustomDrowerWidghet(
      {super.key, required this.onCategorytChangedClicked});

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    return Container(
        width: mediaQuery.size.width * 0.7,
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: mediaQuery.size.height * 0.2,
              color: ColorPalette.primaryColor,
              alignment: AlignmentDirectional.center,
              child: const Text(
                "NEWS APP !",
                style: TextStyle(
                  fontFamily: "Exo",
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            InkWell(
              onTap: () {
                onCategorytChangedClicked();
              },
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Icon(
                      Icons.list,
                      size: 35,
                      color: Colors.black,
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      "Categories",
                      style: TextStyle(
                        fontFamily: "Exo",
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Icon(
                    Icons.settings,
                    size: 35,
                    color: Colors.black,
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    "Settings",
                    style: TextStyle(
                      fontFamily: "Exo",
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
