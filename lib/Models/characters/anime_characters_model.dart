class AnimeCharactersModel {
  AnimeCharactersModel({
    required this.data,
  });

  List<Datum> data;

  factory AnimeCharactersModel.fromJson(Map<String, dynamic> json) =>
      AnimeCharactersModel(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );
}

class Datum {
  Datum({
    required this.character,
  });

  Character character;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        character: Character.fromJson(json["character"]),
      );
}

class Character {
  Character({
    required this.malId,
    required this.url,
    required this.images,
    required this.name,
  });

  int malId;
  String url;
  CharacterImages images;
  String name;

  factory Character.fromJson(Map<String, dynamic> json) => Character(
        malId: json["mal_id"],
        url: json["url"],
        images: CharacterImages.fromJson(json["images"]),
        name: json["name"],
      );
}

class CharacterImages {
  CharacterImages({
    required this.jpg,
  });

  Jpg jpg;

  factory CharacterImages.fromJson(Map<String, dynamic> json) =>
      CharacterImages(
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
