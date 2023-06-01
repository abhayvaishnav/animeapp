class AnimeRecommendationModel {
  AnimeRecommendationModel({
    required this.data,
  });

  final List<Datum> data;

  factory AnimeRecommendationModel.fromJson(Map<String, dynamic> json) =>
      AnimeRecommendationModel(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );
}

class Datum {
  Datum({
    required this.entry,
    required this.url,
    required this.votes,
  });

  final Entry entry;
  final String url;
  final int votes;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        entry: Entry.fromJson(json["entry"]),
        url: json["url"],
        votes: json["votes"],
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
