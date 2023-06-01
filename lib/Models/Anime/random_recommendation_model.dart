class RandomAnimeRecommendationModel {
  RandomAnimeRecommendationModel({
    required this.pagination,
    required this.data,
  });

  final Pagination pagination;
  final List<Datum> data;

  factory RandomAnimeRecommendationModel.fromJson(Map<String, dynamic> json) =>
      RandomAnimeRecommendationModel(
        pagination: Pagination.fromJson(json["pagination"]),
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );
}

class Datum {
  Datum({
    required this.malId,
    required this.entry,
    required this.content,
    required this.date,
  });

  final String malId;
  final List<Entry> entry;
  final String content;
  final DateTime date;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        malId: json["mal_id"],
        entry: List<Entry>.from(json["entry"].map((x) => Entry.fromJson(x))),
        content: json["content"],
        date: DateTime.parse(json["date"]),
      );
}

class Entry {
  Entry({
    required this.malId,
    required this.url,
    required this.imageURL,
    required this.title,
  });

  final int malId;
  final String url;
  final String imageURL;
  final String title;

  factory Entry.fromJson(Map<String, dynamic> json) => Entry(
        malId: json["mal_id"],
        url: json["url"],
        imageURL: json["images"]["jpg"]["image_url"],
        title: json["title"],
      );
}

class Pagination {
  Pagination({
    required this.lastVisiblePage,
    required this.hasNextPage,
  });

  final int lastVisiblePage;
  final bool hasNextPage;

  factory Pagination.fromJson(Map<String, dynamic> json) => Pagination(
        lastVisiblePage: json["last_visible_page"],
        hasNextPage: json["has_next_page"],
      );

  Map<String, dynamic> toJson() => {
        "last_visible_page": lastVisiblePage,
        "has_next_page": hasNextPage,
      };
}
