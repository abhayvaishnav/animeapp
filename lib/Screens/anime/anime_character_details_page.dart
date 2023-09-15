import 'package:flutter/material.dart';
import 'package:expandable_text/expandable_text.dart';

import '../../Models/characters/anime_character_details_model.dart';
import '../../Network/network.dart';
import '../../app_style.dart';

class AnimeCharacterDetails extends StatefulWidget {
  final int characterID;
  final Color colorID;
  final String characterName;
  const AnimeCharacterDetails({
    super.key,
    required this.characterID,
    required this.colorID,
    required this.characterName,
  });

  @override
  State<AnimeCharacterDetails> createState() => AnimeCharacterDetailsState();
}

class AnimeCharacterDetailsState extends State<AnimeCharacterDetails> {
  // function calls
  Anime anime = Anime();
  late Future<AnimeCharacterDetailsModel> animeCharacterDetailsFuture;

  @override
  void initState() {
    animeCharacterDetailsFuture =
        anime.getAnimeCharacterDetails(widget.characterID.toString());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: widget.colorID,
      appBar: AppBar(
        title: Text(
          widget.characterName,
          style: AppStyle.mainTitle,
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            FutureBuilder(
                future: animeCharacterDetailsFuture,
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  AnimeCharacterDetailsModel? getAnimeCharacterDetailsModel =
                      snapshot.data;
                  final error = snapshot.error;
                  if (snapshot.hasError) {
                    return Text('$error');
                  }
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  if (snapshot.hasData) {
                    return Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              padding: const EdgeInsets.all(8.0),
                              child: Image.network(
                                getAnimeCharacterDetailsModel!
                                    .data.images.jpg.imageUrl,
                                height: height * 0.33,
                                width: width * 0.33,
                              ),
                            ),
                            SizedBox(
                              width: width * 0.5,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    getAnimeCharacterDetailsModel.data.name,
                                    style: AppStyle.mainTitle,
                                  ),
                                  Text(
                                    getAnimeCharacterDetailsModel
                                        .data.nameKanji,
                                    style: AppStyle.mainTitle,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Container(
                          padding: const EdgeInsets.all(20),
                          child: ExpandableText(
                            getAnimeCharacterDetailsModel.data.about,
                            expandText: 'read all',
                            collapseText: 'read less',
                            maxLines: 8,
                            linkColor: const Color(0xFF343A40),
                            animation: true,
                            collapseOnTextTap: true,
                            style: AppStyle.mainContent,
                          ),
                        )
                      ],
                    );
                  } else {
                    return const CircularProgressIndicator();
                  }
                })
          ],
        ),
      ),
    );
  }
}
