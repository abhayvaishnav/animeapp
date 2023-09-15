import 'package:animeapp/Network/network.dart';
import 'package:flutter/material.dart';

import '../Models/characters/anime_characters_model.dart';
import '../Screens/anime/anime_character_details_page.dart';
import '../app_style.dart';

class CharactersWidget extends StatefulWidget {
  final double height;
  final double width;
  final Color pageColor;
  final String getAnimeCharacters;

  const CharactersWidget({
    super.key,
    required this.height,
    required this.width,
    required this.pageColor,
    required this.getAnimeCharacters,
  });

  @override
  State<CharactersWidget> createState() => _CharactersWidgetState();
}

class _CharactersWidgetState extends State<CharactersWidget> {
  Anime anime = Anime();
  late Future<dynamic> characterFuture;

  @override
  void initState() {
    characterFuture = anime.getAnimeCharacters(widget.getAnimeCharacters);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Characters',
          style: AppStyle.mainTitle,
        ),
        const SizedBox(height: 10),
        SizedBox(
          height: widget.height * 0.12,
          width: widget.width,
          child: FutureBuilder(
              future: characterFuture,
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                AnimeCharactersModel? getAnimeCharactersModel = snapshot.data;
                final error = snapshot.error;
                if (snapshot.hasError) {
                  return Text('$error');
                }
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (snapshot.hasData) {
                  return ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: getAnimeCharactersModel?.data.length,
                    itemBuilder: (BuildContext context, int index) {
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (builder) => AnimeCharacterDetails(
                                  characterID: getAnimeCharactersModel!
                                      .data[index].character.malId,
                                  colorID: widget.pageColor,
                                  characterName: getAnimeCharactersModel
                                      .data[index].character.name,
                                ),
                              ));
                        },
                        child: CircleAvatar(
                          minRadius: widget.width * 0.14,
                          backgroundImage: NetworkImage(
                            '${getAnimeCharactersModel?.data[index].character.images.jpg.imageUrl}',
                            scale: 0.5,
                          ),
                        ),
                      );
                    },
                  );
                } else {
                  return const CircularProgressIndicator();
                }
              }),
        ),
      ],
    );
  }
}
