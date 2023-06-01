class AnimeCharacterDetailsModel {
  AnimeCharacterDetailsModel({
    required this.data,
  });

  Data data;

  factory AnimeCharacterDetailsModel.fromJson(Map<String, dynamic> json) =>
      AnimeCharacterDetailsModel(
        data: Data.fromJson(json["data"]),
      );
}

class Data {
  Data({
    required this.malId,
    required this.url,
    required this.images,
    required this.name,
    required this.nameKanji,
    required this.nicknames,
    required this.favorites,
    required this.about,
  });

  int malId;
  String url;
  Images images;
  String name;
  String nameKanji;
  List<String> nicknames;
  int favorites;
  String about;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        malId: json["mal_id"],
        url: json["url"],
        images: Images.fromJson(json["images"]),
        name: json["name"],
        nameKanji: json["name_kanji"],
        nicknames: List<String>.from(json["nicknames"].map((x) => x)),
        favorites: json["favorites"],
        about: json["about"],
      );
}

class Images {
  Images({
    required this.jpg,
  });

  Jpg jpg;

  factory Images.fromJson(Map<String, dynamic> json) => Images(
        jpg: Jpg.fromJson(json["jpg"]),
      );
}

class Jpg {
  Jpg({
    required this.imageUrl,
  });

  String imageUrl;

  factory Jpg.fromJson(Map<String, dynamic> json) => Jpg(
        imageUrl: json["image_url"],
      );
}
