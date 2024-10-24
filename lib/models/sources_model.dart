class SourcesModel {
  final String status;
  final List<Source> sources;

//we make here parsing  to Api
  SourcesModel({required this.status, required this.sources});

  factory SourcesModel.fromJson(Map<String, dynamic> json) => SourcesModel(
        status: json["status"],
        sources: (json["sources"] as List).map(
          (element) {
            return Source.fromJson(element);
          },
        ).toList(),
      );
}

class Source {
  final String id;
  final String name;

  Source({required this.id, required this.name});

  factory Source.fromJson(Map<String, dynamic> json) => Source(
        id: json["id"],
        name: json["name"],
      );
}
