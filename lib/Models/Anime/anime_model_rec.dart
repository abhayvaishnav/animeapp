class AnimeModelRec {
  AnimeModelRecomData? animeModelRecomData;

  AnimeModelRec({this.animeModelRecomData});

  AnimeModelRec.fromJson(Map<String, dynamic> json) {
    animeModelRecomData = json['data'] != null
        ? AnimeModelRecomData.fromJson(json['data'])
        : null;
  }
}

class AnimeModelRecomData {
  int? malId;
  String? url;
  String? title;
  String? imageURL;
  String? scrore;
  String? type;
  String? episodes;
  String? synopsis;
  String? trailerURL;
  List<Demographic> genres;
  String? status;
  String? source;
  AnimeModelRecomData({
    required this.malId,
    required this.url,
    required this.title,
    required this.imageURL,
    required this.scrore,
    required this.type,
    required this.episodes,
    required this.synopsis,
    required this.trailerURL,
    required this.genres,
    required this.status,
    required this.source,
  });

  factory AnimeModelRecomData.fromJson(Map<String, dynamic> json) =>
      AnimeModelRecomData(
        malId: json["mal_id"],
        url: json["url"],
        title: json["title"],
        imageURL: json["images"]["jpg"]["image_url"],
        scrore: json["score"] == null ? '0.0' : json["score"].toString(),
        type: json["type"].toString(),
        episodes: json['episodes'].toString(),
        synopsis: json["synopsis"],
        trailerURL: json["trailer"]["embed_url"],
        genres: List<Demographic>.from(
            json["genres"].map((x) => Demographic.fromJson(x))),
        status: json["status"],
        source: json["source"],
      );
}

class Demographic {
  Demographic({
    required this.malId,
    required this.type,
    required this.name,
    required this.url,
  });

  int malId;
  String type;
  String name;
  String url;

  factory Demographic.fromJson(Map<String, dynamic> json) => Demographic(
        malId: json["mal_id"],
        type: json["type"],
        name: json["name"],
        url: json["url"],
      );
}
