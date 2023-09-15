import 'package:animeapp/Network/network.dart';
import 'package:animeapp/app_style.dart';
import 'package:flutter/material.dart';

import '../anime/anime_page.dart';
import '../../const_url.dart';
import '../anime/random_anime_suggestions_page.dart';

class AnimeHomePage extends StatefulWidget {
  const AnimeHomePage({Key? key}) : super(key: key);
  @override
  State<AnimeHomePage> createState() => _AnimeHomePageState();
}

class _AnimeHomePageState extends State<AnimeHomePage> {
  Anime anime = Anime();
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: const Text('Anime'),
        actions: [
          IconButton(
              icon: const Icon(Icons.search_rounded),
              onPressed: () {
                debugPrint("Pressed");
              }),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            homeScreenBanner(
                height: height,
                width: width,
                context: context,
                animePageTitle: 'Top Rated Anime',
                animePageUrl: ApiUrl.topRatedAnimeURL,
                decorationImagePath: 'Assets/banner3.jpeg'),
            homeScreenBanner(
              height: height,
              width: width,
              context: context,
              animePageTitle: 'Top Airing Anime',
              animePageUrl: ApiUrl.topAiringAnimeURL,
              decorationImagePath: 'Assets/banner1.jpeg',
            ),
            homeScreenBanner(
              height: height,
              width: width,
              context: context,
              animePageTitle: 'Upcoming Anime',
              animePageUrl: ApiUrl.upcomingAnimeURL,
              decorationImagePath: 'Assets/banner2.jpeg',
            ),
            // anime suggestions
            Container(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Suggested Anime",
                    style: AppStyle.homepageStyle,
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                      height: MediaQuery.of(context).size.height * 0.5,
                      child: const RandomAnimeSuggestion()),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Container homeScreenBanner(
      {required double height,
      required double width,
      required BuildContext context,
      required String animePageTitle,
      required String animePageUrl,
      required String decorationImagePath}) {
    return Container(
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage(decorationImagePath), fit: BoxFit.contain),
      ),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (builder) => AnimePage(
                      title: animePageTitle,
                      url: animePageUrl,
                    )),
          );
        },
        child: Stack(children: <Widget>[
          Image.asset(decorationImagePath),
          Align(
            alignment: Alignment.topLeft,
            child: Text(
              animePageTitle,
              style: AppStyle.homepageStyle,
            ),
          )
        ]),
      ),
    );
  }
}
