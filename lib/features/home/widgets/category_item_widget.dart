import 'package:flutter/material.dart';
import 'package:news_app/models/category_data.dart';

class CategoryItemWidget extends StatelessWidget {
  final CategoryData categoryData;
  final void Function(CategoryData)? onCategoryClicked;
  final int index;

  const CategoryItemWidget(
      {super.key,
      required this.categoryData,
      required this.index,
      required this.onCategoryClicked});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onCategoryClicked!(categoryData);
      },
      child: Container(
        decoration: BoxDecoration(
          color: categoryData.categorybackgoundColor,
          borderRadius: BorderRadius.only(
            bottomLeft: const Radius.circular(25),
            bottomRight: index % 2 == 0
                ? const Radius.circular(0)
                : const Radius.circular(25),
            topLeft: index % 2 == 0
                ? const Radius.circular(25)
                : const Radius.circular(25),
            topRight: const Radius.circular(25),
          ),
        ),
        child: Column(
          children: [
            Expanded(child: Image.asset(categoryData.categoryIcon)),
            Text(
              categoryData.categoryName,
              style: const TextStyle(
                  fontFamily: "Exo",
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                  color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
