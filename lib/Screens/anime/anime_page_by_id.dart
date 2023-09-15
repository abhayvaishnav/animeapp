import 'dart:math';

import 'package:animeapp/Models/Anime/anime_model_rec.dart';
import 'package:animeapp/Screens/anime/AnimeDetailsPageRecom/genres_widget_recom.dart';
import 'package:animeapp/Screens/anime/AnimeDetailsPageRecom/top_info_widget_recom.dart';
import 'package:animeapp/Screens/anime/anime_episode_page.dart';
import 'package:animeapp/app_style.dart';
import 'package:animeapp/widgets/characters_widget.dart';
import 'package:animeapp/widgets/episode_list_widget.dart';
import 'package:animeapp/widgets/expandable_text_widget.dart';
import 'package:animeapp/widgets/suggestion_stack_widget.dart';
import 'package:animeapp/widgets/trailer_widget.dart';
import 'package:flutter/material.dart';

import '../../Network/network.dart';

class AnimeRecommendationPage extends StatefulWidget {
  final String animeName;
  final String animeID;
  const AnimeRecommendationPage(
      {Key? key, required this.animeID, required this.animeName})
      : super(key: key);

  @override
  State<AnimeRecommendationPage> createState() =>
      AnimeRecommendationPageState();
}

class AnimeRecommendationPageState extends State<AnimeRecommendationPage> {
  @override
  Widget build(BuildContext context) {
    Future<AnimeModelRec> getAnime = Anime().getAnimeByID(widget.animeID);
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    Color pageColor =
        AppStyle.colorSwatch[Random().nextInt(AppStyle.colorSwatch.length)];
    return Scaffold(
      backgroundColor: pageColor,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Theme.of(context).colorScheme.primary,
        elevation: 0.0,
        title: Text(
          widget.animeName,
          style: const TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: FutureBuilder<AnimeModelRec>(
                  future: getAnime,
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    AnimeModelRec? animeModelRec = snapshot.data;
                    final error = snapshot.error;
                    if (snapshot.hasError) {
                      return Text('$error');
                    }
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    if (snapshot.hasData) {
                      return SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            children: [
                              TopInfoWidgetRecom(
                                height: height,
                                width: width,
                                topAiringAnime:
                                    animeModelRec!.animeModelRecomData,
                              ),
                              const SizedBox(height: 20),
                              GenresWidgetRecom(
                                topAiringAnime:
                                    animeModelRec.animeModelRecomData,
                                width: width,
                              ),
                              const SizedBox(height: 20),
                              if (animeModelRec
                                      .animeModelRecomData!.trailerURL !=
                                  null)
                                TrailerWidget(
                                    trailerURL: animeModelRec
                                        .animeModelRecomData!.trailerURL
                                        .toString()),
                              const SizedBox(height: 20),
                              CustomExpandableText(
                                  text:
                                      "${animeModelRec.animeModelRecomData!.synopsis}"),
                              const SizedBox(height: 20),
                              CharactersWidget(
                                height: height,
                                width: width,
                                pageColor: pageColor,
                                getAnimeCharacters: animeModelRec
                                    .animeModelRecomData!.malId
                                    .toString(),
                              ),
                              const SizedBox(height: 20),
                              animeModelRec.animeModelRecomData!.status ==
                                      "Not yet aired"
                                  ? Container()
                                  : EpisodeList(
                                      function: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (builder) =>
                                                  AnimeEpisodes(
                                                title:
                                                    "${animeModelRec.animeModelRecomData!.title}",
                                                animeID: animeModelRec
                                                    .animeModelRecomData!.malId
                                                    .toString(),
                                                pageColor: pageColor,
                                              ),
                                            ));
                                      },
                                    ),
                              const SizedBox(height: 20),
                              SuggestionsWidget(
                                height: height,
                                width: width,
                                pageColor: pageColor,
                                getAnimeRecommendation: animeModelRec
                                    .animeModelRecomData!.malId
                                    .toString(),
                              )
                            ],
                          ),
                        ),
                      );
                    } else {
                      return const CircularProgressIndicator();
                    }
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
