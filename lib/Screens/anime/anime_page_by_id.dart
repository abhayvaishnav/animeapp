import 'package:flutter/material.dart';

import '../../Models/Anime/anime_model.dart';
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
    Future getAnime = Anime().getAnimeByID(widget.animeID);
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: Text(
          widget.animeName,
          style: const TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: SizedBox(
                height: height,
                width: width,
                child: FutureBuilder(
                    future: getAnime,
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      AnimeModel? topAiringAnime = snapshot.data;
                      final error = snapshot.error;
                      if (snapshot.hasError) {
                        return Text('$error');
                      }
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator());
                      }
                      if (snapshot.hasData) {
                        return ListView.builder(
                          shrinkWrap: true,
                          itemCount: topAiringAnime?.data.length,
                          itemBuilder: (BuildContext context, int index) {
                            return const Text("HI");
                            // AnimeCard(
                            //   height: height,
                            //   width: width,
                            //   topAiringAnime: topAiringAnime,
                            //   index: index,
                            //   gradientColor: [
                            //     AppStyle.colorSwatch[Random()
                            //         .nextInt(AppStyle.colorSwatch.length)],
                            //     AppStyle.colorSwatch[Random()
                            //         .nextInt(AppStyle.colorSwatch.length)]
                            //   ],
                            // );
                          },
                        );
                      } else {
                        return const CircularProgressIndicator();
                      }
                    }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
