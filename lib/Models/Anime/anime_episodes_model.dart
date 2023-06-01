class AnimeEpisodesModel {
  AnimeEpisodesModel({
    required this.pagination,
    required this.data,
  });

  Pagination pagination;
  List<Datum> data;

  factory AnimeEpisodesModel.fromJson(Map<String, dynamic> json) =>
      AnimeEpisodesModel(
        pagination: Pagination.fromJson(json["pagination"]),
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );
}

class Datum {
  Datum({
    required this.malId,
    required this.url,
    required this.title,
    required this.titleJapanese,
    required this.titleRomanji,
    required this.aired,
    required this.filler,
    required this.recap,
    required this.forumUrl,
  });

  int malId;
  String url;
  String title;
  String titleJapanese;
  String titleRomanji;
  DateTime aired;
  bool filler;
  bool recap;
  String forumUrl;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        malId: json["mal_id"],
        url: json["url"] ?? "",
        title: json["title"],
        titleJapanese: json["title_japanese"],
        titleRomanji: json["title_romanji"],
        aired: DateTime.parse(json["aired"]),
        filler: json["filler"],
        recap: json["recap"],
        forumUrl: json["forum_url"],
      );
}

class Pagination {
  Pagination({
    required this.lastVisiblePage,
    required this.hasNextPage,
  });

  int lastVisiblePage;
  bool hasNextPage;

  factory Pagination.fromJson(Map<String, dynamic> json) => Pagination(
        lastVisiblePage: json["last_visible_page"],
        hasNextPage: json["has_next_page"],
      );
}
