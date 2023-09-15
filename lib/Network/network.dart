import 'dart:convert';

import 'package:animeapp/Models/Anime/anime_model_rec.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart';

import '../Models/Anime/anime_episodes_model.dart';
import '../Models/Anime/anime_model.dart';
import '../Models/Anime/anime_recommendation_model.dart';
import '../Models/Anime/random_recommendation_model.dart';
import '../Models/characters/anime_character_details_model.dart';
import '../Models/characters/anime_characters_model.dart';

class Anime {
  // get anime
  Future<AnimeModel> getAnime(String url, int limit) async {
    Response response = await get(Uri.parse('$url?limit=$limit'));
    if (response.statusCode == 200 || response.statusCode == 400) {
      debugPrint('Calling Anime API URL $url....');
      debugPrint(response.body);
      return AnimeModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load data');
    }
  }

  /// get anime details by id
  Future<AnimeModelRec> getAnimeByID(String animeID) async {
    String animeDetailByIdURL = 'https://api.jikan.moe/v4/anime/$animeID';
    Response response = await get(Uri.parse(animeDetailByIdURL));
    if (response.statusCode == 200 || response.statusCode == 400) {
      debugPrint('Calling Anime API URL $animeDetailByIdURL....');
      debugPrint(response.body);
      return AnimeModelRec.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load data');
    }
  }

  // get anime characters
  Future<AnimeCharactersModel> getAnimeCharacters(String animeID) async {
    String animeCharactersURL =
        'https://api.jikan.moe/v4/anime/$animeID/characters';
    Response response = await get(Uri.parse(animeCharactersURL));
    if (response.statusCode == 200 || response.statusCode == 400) {
      debugPrint('Calling get anime characters API....');
      debugPrint(response.body);
      return AnimeCharactersModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load data');
    }
  }

  // get anime characters details
  Future<AnimeCharacterDetailsModel> getAnimeCharacterDetails(
      String characterID) async {
    String animeCharacterDetailsURL =
        'https://api.jikan.moe/v4/characters/$characterID';
    Response response = await get(Uri.parse(animeCharacterDetailsURL));
    if (response.statusCode == 200 || response.statusCode == 400) {
      debugPrint(
          'Calling get anime characters details API URL $animeCharacterDetailsURL....');
      debugPrint(response.body);
      return AnimeCharacterDetailsModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load data');
    }
  }

  // get anime episode details
  Future<AnimeEpisodesModel> getAnimeEpisodes(String animeID) async {
    String animeEpisodesURL =
        'https://api.jikan.moe/v4/anime/$animeID/episodes';
    Response response = await get(Uri.parse(animeEpisodesURL));
    if (response.statusCode == 200 || response.statusCode == 400) {
      debugPrint(
          'Calling get anime Episodes detail API URL $animeEpisodesURL....');
      debugPrint(response.body);
      return AnimeEpisodesModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load data');
    }
  }

  // get Recommendation based on anime
  Future<AnimeRecommendationModel> getAnimeRecommendation(
      String animeID) async {
    String animeEpisodesURL =
        'https://api.jikan.moe/v4/anime/$animeID/recommendations';
    Response response = await get(Uri.parse(animeEpisodesURL));
    if (response.statusCode == 200 || response.statusCode == 400) {
      debugPrint(
          'Calling get anime recommendations API URL $animeEpisodesURL....');
      debugPrint(response.body);
      return AnimeRecommendationModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load data');
    }
  }

  // get Random Anime Recommendation
  Future<RandomAnimeRecommendationModel> getRandomAnimeRecommendation() async {
    String randomAnimeRecommendationURL =
        'https://api.jikan.moe/v4/recommendations/anime';
    Response response = await get(Uri.parse(randomAnimeRecommendationURL));
    if (response.statusCode == 200 || response.statusCode == 400) {
      debugPrint(
          'Calling get anime recommendations API URL $randomAnimeRecommendationURL....');
      debugPrint(response.body);
      return RandomAnimeRecommendationModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load data');
    }
  }
}
