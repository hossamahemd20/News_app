import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/models/articles_model.dart';
import 'package:url_launcher/url_launcher.dart';

class ArticleDetails extends StatelessWidget {
  static const String routeName = "articleDetails";

  const ArticleDetails({super.key});

  @override
  Widget build(BuildContext context) {
    var article = ModalRoute.of(context)!.settings.arguments as Article;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text(article.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: CachedNetworkImage(imageUrl: article.urlToImage ?? ""),
            ),
            Text(article.author ?? ""),
            Text(
              article.title ?? "",
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(article.publishedAt?.substring(0, 10) ?? ""),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
                height: 400,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(18),
                ),
                child: Column(children: [
                  Text(article.description ?? ""),
                  Text(article.description ?? ""),
                  const SizedBox(
                    height: 30,
                  ),
                  InkWell(
                    onTap: () {
                      launchUrl(Uri.parse(article.url ?? ""));
                    },
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text("View Full Article"),
                        SizedBox(
                          width: 10,
                        ),
                        Icon(
                          Icons.arrow_forward_ios_sharp,
                          size: 18,
                        )
                      ],
                    ),
                  )
                ]))
          ],
        ),
      ),
    );
  }
}
