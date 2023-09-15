import 'package:animeapp/Network/network.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';

import '../Models/Anime/anime_recommendation_model.dart';
import '../Screens/anime/anime_page_by_id.dart';
import '../app_style.dart';

class SuggestionsWidget extends StatefulWidget {
  final double height;
  final double width;
  final Color pageColor;
  final String getAnimeRecommendation;

  const SuggestionsWidget({
    super.key,
    required this.height,
    required this.width,
    required this.pageColor,
    required this.getAnimeRecommendation,
  });

  @override
  State<SuggestionsWidget> createState() => _SuggestionsWidgetState();
}

class _SuggestionsWidgetState extends State<SuggestionsWidget> {
  Anime anime = Anime();
  late Future<AnimeRecommendationModel> suggestionFuture;

  @override
  void initState() {
    suggestionFuture =
        anime.getAnimeRecommendation(widget.getAnimeRecommendation);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Suggested Anime',
          style: AppStyle.mainTitle,
        ),
        SizedBox(
            height: widget.height * 0.3,
            width: widget.width,
            child: FutureBuilder(
                future: suggestionFuture,
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  AnimeRecommendationModel? animeRecommendationModel =
                      snapshot.data;
                  final error = snapshot.error;
                  if (snapshot.hasError) {
                    return Text('$error');
                  }
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  if (snapshot.hasData) {
                    return animeRecommendationModel!.data.isNotEmpty
                        ? Swiper(
                            itemCount: animeRecommendationModel.data.length,
                            itemWidth: widget.width,
                            itemHeight: widget.height * 0.3,
                            layout: SwiperLayout.TINDER,
                            index: 0,
                            control: const SwiperControl(),
                            itemBuilder: (BuildContext context, int index) {
                              return InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (builder) =>
                                              AnimeRecommendationPage(
                                                animeID:
                                                    animeRecommendationModel
                                                        .data[index].entry.malId
                                                        .toString(),
                                                animeName:
                                                    animeRecommendationModel
                                                        .data[index]
                                                        .entry
                                                        .title,
                                              )));
                                },
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image(
                                    image: NetworkImage(
                                      animeRecommendationModel
                                          .data[index].entry.imageURL,
                                    ),
                                  ),
                                ),
                              );
                            },
                          )
                        : Center(
                            child: Text(
                            'No Suggestions Found',
                            style: AppStyle.mainTitle,
                          ));
                  } else {
                    return const CircularProgressIndicator();
                  }
                })),
      ],
    );
  }
}
