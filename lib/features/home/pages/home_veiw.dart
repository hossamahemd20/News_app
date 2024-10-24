import 'package:flutter/material.dart';
import 'package:news_app/features/home/widgets/category_item_widget.dart';
import 'package:news_app/features/home/widgets/custom_drower_widghet.dart';
import 'package:news_app/features/home/widgets/selected_category_view.dart';
import 'package:news_app/models/category_data.dart';
import 'package:news_app/models/splash/pages/search_screen.dart';

class HomeVeiw extends StatefulWidget {
  const HomeVeiw({super.key});

  @override
  State<HomeVeiw> createState() => _HomeVeiwState();
}

class _HomeVeiwState extends State<HomeVeiw> {
  List<CategoryData> categoryDataList = [
    CategoryData(
        categoryId: "sports",
        categoryName: "Sports",
        categoryIcon: "assets/icons/sports.png",
        categorybackgoundColor: const Color(0xFFC91C22)),
    CategoryData(
        categoryId: "general",
        categoryName: "Politics",
        categoryIcon: "assets/icons/Politics.png",
        categorybackgoundColor: const Color(0xFF003E90)),
    CategoryData(
        categoryId: "health",
        categoryName: "Health",
        categoryIcon: "assets/icons/health.png",
        categorybackgoundColor: const Color(0xFFED1E79)),
    CategoryData(
        categoryId: "business",
        categoryName: "Business",
        categoryIcon: "assets/icons/bussines.png",
        categorybackgoundColor: const Color(0xFFCF7E48)),
    CategoryData(
        categoryId: "environment",
        categoryName: "Environment",
        categoryIcon: "assets/icons/environment.png",
        categorybackgoundColor: const Color(0xFF4882CF)),
    CategoryData(
        categoryId: "science",
        categoryName: "Science",
        categoryIcon: "assets/icons/science.png",
        categorybackgoundColor: const Color(0xFFF2D352)),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(8.0),
        decoration: const BoxDecoration(
            color: Colors.white,
            image: DecorationImage(
              image: AssetImage("assets/images/pattern.png"),
            )),
        child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            actions: [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: IconButton(
                    onPressed: () {
                      showSearch(context: context, delegate: SearchScreen());
                    },
                    icon: Icon(Icons.search)),
              )
            ],

            title: Text(
              selectedCategoryData == null
                  ? "News App ! "
                  : selectedCategoryData!.categoryName,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            // actions: [
            //   // if (selectedCategoryData != null)
            //     IconButton(
            //       onPressed: () {},
            //       icon: const Icon(
            //         Icons.search_rounded,
            //         size: 40,
            //         color: Colors.white,
            //       ),
            //     )
            // ],
          ),
          drawer: CustomDrowerWidghet(
            onCategorytChangedClicked: onCategorytChangedClicked,
          ),
          body: selectedCategoryData == null
              ? Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Pick your category \n of interest ",
                        style: TextStyle(
                          fontFamily: "Exo",
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF4F5A69),
                          height: 1.2,
                        ),
                      ),
                      Expanded(
                        child: GridView.builder(
                          padding: const EdgeInsets.only(
                              top: 20, left: 15, right: 15),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 20,
                            crossAxisSpacing: 20,
                            childAspectRatio: 0.90,
                          ),
                          itemBuilder: (context, index) => CategoryItemWidget(
                            categoryData: categoryDataList[index],
                            index: index,
                            onCategoryClicked: onCategoryClicked,
                          ),
                          itemCount: categoryDataList.length,
                        ),
                      )
                    ],
                  ),
                )
              : SelectedCategoryView(
                  categoryData: selectedCategoryData!,
                ),
        ));
  }

  CategoryData? selectedCategoryData;

  void onCategoryClicked(CategoryData categoryData) {
    setState(() {
      selectedCategoryData = categoryData;
    });
  }

  void onCategorytChangedClicked() {
    setState(() {
      selectedCategoryData = null;
      Navigator.pop(context);
    });
  }
}
