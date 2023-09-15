import 'dart:math';

import 'package:flutter/material.dart';

import 'package:animeapp/Network/network.dart';
import '../../Models/Anime/anime_model.dart';
import '../../app_style.dart';
import '../../widgets/anime_card.dart';

class AnimePage extends StatefulWidget {
  final String title;
  final String url;

  const AnimePage({
    super.key,
    required this.title,
    required this.url,
  });

  @override
  State<AnimePage> createState() => _AnimePageState();
}

class _AnimePageState extends State<AnimePage> {
  late Future<AnimeModel> animePageFuture;
  final scrollController = ScrollController();
  @override
  void initState() {
    animePageFuture = Anime().getAnime(widget.url, 10);
    scrollController.addListener(_scrollListner);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // Future getAnime = Anime().getAnime(widget.url, 5);
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Theme.of(context).colorScheme.primary,
        elevation: 0.0,
        title: Text(
          widget.title,
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
              child: SizedBox(
                height: height,
                width: width,
                child: FutureBuilder(
                    future: animePageFuture,
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
                          // controller: scrollController,
                          shrinkWrap: true,
                          itemCount: topAiringAnime?.data.length,
                          itemBuilder: (BuildContext context, int index) {
                            return AnimeCard(
                              height: height,
                              width: width,
                              topAiringAnime: topAiringAnime,
                              index: index,
                              gradientColor: [
                                AppStyle.colorSwatch[Random()
                                    .nextInt(AppStyle.colorSwatch.length)],
                                AppStyle.colorSwatch[Random()
                                    .nextInt(AppStyle.colorSwatch.length)]
                              ],
                            );
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

  void _scrollListner() {
    print('Scroll listner works');
  }
}
