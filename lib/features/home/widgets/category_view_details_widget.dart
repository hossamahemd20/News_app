import 'package:flutter/material.dart';
import 'package:news_app/features/home/widgets/tab_item_widget.dart';
import 'package:news_app/models/sources_model.dart';

import '../../../data/core/config/colors_palette.dart';
import '../../../data/data_source/api_manger.dart';
import '../../../models/articles_model.dart';
import 'Article_Item_Widget.dart';

class CategoryViewDetailsWidget extends StatefulWidget {
  final List<Source> sourceslist;

  const CategoryViewDetailsWidget(
      {super.key,
      required this.sourceslist,
      required List<Source> sourcesList});

  @override
  State<CategoryViewDetailsWidget> createState() =>
      _CategoryViewDetailsWidgetState();
}

class _CategoryViewDetailsWidgetState extends State<CategoryViewDetailsWidget> {
  int selectIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DefaultTabController(
          length: widget.sourceslist.length,
          child: TabBar(
            tabAlignment: TabAlignment.start,
            indicatorPadding: EdgeInsets.zero,
            padding: const EdgeInsets.symmetric(vertical: 10),
            indicator: const BoxDecoration(),
            labelPadding: const EdgeInsets.symmetric(horizontal: 6),
            isScrollable: true,
            dividerColor: Colors.transparent,
            onTap: (index) {
              setState(() {
                selectIndex = index;
              });
            },
            tabs: widget.sourceslist
                .map((source) => TabItemWidget(
                    isSelected:
                        selectIndex == widget.sourceslist.indexOf(source),
                    source: source))
                .toList(),
          ),
        ),
        SizedBox(
          height: 40,
        ), //the of source
        FutureBuilder<List<Article>>(
            future:
                ApiManger.fetchArticlesList(widget.sourceslist[selectIndex].id),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return const Text(
                  "fetching has Error",
                );
              }
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(
                    color: ColorPalette.primaryColor,
                  ),
                );
              }
              List<Article> articleslist = snapshot.data ?? [];
              return Expanded(
                child: ListView.builder(
                  itemBuilder: (context, index) => ArticleItemWidget(
                    article: articleslist[index],
                  ),
                  itemCount: articleslist.length,
                ),
              );
            })
      ],
    );
  }
}
