import 'package:flutter/material.dart';
import 'package:news_app/models/sources_model.dart';

import '../../../data/core/config/colors_palette.dart';

class TabItemWidget extends StatelessWidget {
  final Source source;
  final bool isSelected;

  const TabItemWidget({
    super.key,
    required this.source,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
      decoration: BoxDecoration(
          color: isSelected ? ColorPalette.primaryColor : Colors.white,
          borderRadius: BorderRadius.circular(25),
          border: Border.all(
            color: ColorPalette.primaryColor,
          )),
      child: Text(
        source.name,
        style: TextStyle(
          color:
              isSelected ? const Color(0xFFFFFFFF) : ColorPalette.primaryColor,
          fontFamily: "Exo",
          fontSize: 22,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
