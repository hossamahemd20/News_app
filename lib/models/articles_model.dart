class ArticlesModel {
  final String status;

  ArticlesModel({required this.status, required this.articles});

  factory ArticlesModel.fromJson(Map<String, dynamic> json) => ArticlesModel(
      status: json["status"],
      articles: json["articles"]
          .map(
            (data) => Article.fromJson(data),
          )
          .toList());

  final List<Article> articles;

//the articles is list  object
}

class Article {
  final String author;
  final String title;
  final String description;
  final String url;
  final String urlToImage;
  final publishedAt;

  Article(
      //we make a constructor
      {required this.author,
      required this.title,
      required this.description,
      required this.url,
      required this.urlToImage,
      required this.publishedAt});

//here we do maping that convert from json to String
  factory Article.fromJson(Map<String, dynamic> json) => Article(
      author: json["source"]["name"],
      title: json["title"],
      description: json["description"],
      url: json["url"],
      urlToImage: json["urlToImage"],
      publishedAt: json["publishedAt"]);
}
