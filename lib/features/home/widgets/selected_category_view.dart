import 'package:flutter/material.dart';
import 'package:news_app/data/data_source/api_manger.dart';
import 'package:news_app/models/sources_model.dart';

import '../../../data/core/config/colors_palette.dart';
import '../../../models/category_data.dart';
import 'category_view_details_widget.dart';

class SelectedCategoryView extends StatelessWidget {
  final CategoryData categoryData;

  const SelectedCategoryView({super.key, required this.categoryData});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: ApiManger.fetchSourceList(categoryData.categoryId),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Text("fetching has Error");
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(
                color: ColorPalette.primaryColor,
              ),
            );
          }
          List<Source> sourcesList = snapshot.data ?? [];
          // return CategoryViewDetailsWidget(sourcesList: sourcesList);
          return CategoryViewDetailsWidget(
              sourceslist: sourcesList, sourcesList: sourcesList);
        });
  }
}
