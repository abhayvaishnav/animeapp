import 'package:animeapp/Network/network.dart';
import 'package:flutter/material.dart';

import '../../Models/Anime/random_recommendation_model.dart';
import 'anime_page_by_id.dart';

class RandomAnimeSuggestion extends StatefulWidget {
  const RandomAnimeSuggestion({Key? key}) : super(key: key);

  @override
  State<RandomAnimeSuggestion> createState() => _RandomAnimeSuggestionState();
}

class _RandomAnimeSuggestionState extends State<RandomAnimeSuggestion> {
  late Future<RandomAnimeRecommendationModel> animeRecommendationPageFutuer;
  Anime anime = Anime();

  @override
  void initState() {
    animeRecommendationPageFutuer = anime.getRandomAnimeRecommendation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return FutureBuilder(
        future: animeRecommendationPageFutuer,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          RandomAnimeRecommendationModel? randomAnimeRecommendationModel =
              snapshot.data;
          final error = snapshot.error;
          if (snapshot.hasError) {
            return Text('$error');
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasData) {
            return SizedBox(
              height: height,
              width: width,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: randomAnimeRecommendationModel?.data.length,
                itemBuilder: (BuildContext context, int index1) {
                  return Column(
                    children: [
                      Container(
                        height: height * 0.35,
                        width: width,
                        margin: const EdgeInsets.all(10),
                        padding: const EdgeInsets.all(2),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          // border: Border.all(
                          // width: 1, color: Colors.black),
                        ),
                        child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: randomAnimeRecommendationModel
                              ?.data[index1].entry.length,
                          itemBuilder: (BuildContext context, int index2) {
                            return InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (builder) => AnimeRecommendationPage(
                                        animeName:
                                            '${randomAnimeRecommendationModel?.data[index1].entry[index2].title}',
                                        animeID:
                                            '${randomAnimeRecommendationModel?.data[index1].entry[index2].malId}'),
                                  ),
                                );
                              },
                              child: Column(
                                children: [
                                  Expanded(
                                    child: Container(
                                        height: height,
                                        width: width * 0.42,
                                        margin: const EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          // border: Border.all(
                                          //     width: 1,
                                          //     color: Colors.black),
                                          image: DecorationImage(
                                            image: NetworkImage(
                                              '${randomAnimeRecommendationModel?.data[index1].entry[index2].imageURL}',
                                            ),
                                          ),
                                        )),
                                  ),
                                  SizedBox(
                                    width: width * 0.40,
                                    child: Text(
                                      '${randomAnimeRecommendationModel?.data[index1].entry[index2].title}',
                                      style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  );
                },
              ),
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        });
    // Scaffold(
    //   appBar: AppBar(
    //     leading: IconButton(
    //       icon: const Icon(Icons.arrow_back_ios_new_rounded),
    //       onPressed: () {
    //         Navigator.pop(context);
    //       },
    //     ),
    //     iconTheme: const IconThemeData(color: Colors.black),
    //     backgroundColor: Colors.white,
    //     elevation: 0.0,
    //     title: const Text(
    //       "Suggested by the user",
    //       style: TextStyle(color: Colors.black),
    //     ),
    //     centerTitle: true,
    //   ),
    //   body: SingleChildScrollView(
    //     child: Column(
    //       children: [

    //       ],
    //     ),
    //   ),
    // );
  }
}
