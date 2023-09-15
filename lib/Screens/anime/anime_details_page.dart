import 'package:animeapp/Models/Anime/anime_model.dart';
import 'package:flutter/material.dart';

import '../../Network/network.dart';
import '../../app_style.dart';
import '../../widgets/characters_widget.dart';
import '../../widgets/episode_list_widget.dart';
import '../../widgets/expandable_text_widget.dart';
import '../../widgets/genres_widget.dart';
import '../../widgets/suggestion_stack_widget.dart';
import '../../widgets/top_info_widget.dart';
import '../../widgets/trailer_widget.dart';
import 'anime_episode_page.dart';

class AnimeDetailPage extends StatefulWidget {
  final Datum? topAiringAnime;
  final Color pageColor;
  const AnimeDetailPage({
    super.key,
    required this.topAiringAnime,
    required this.pageColor,
  });
  @override
  _AnimeDetailPageState createState() => _AnimeDetailPageState();
}

class _AnimeDetailPageState extends State<AnimeDetailPage> {
  Anime anime = Anime();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String? trailerURL = widget.topAiringAnime?.trailerURL;
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: widget.pageColor,
      appBar: AppBar(
        leading: IconButton(
          color: Colors.black,
          icon: const Icon(Icons.arrow_back_ios_rounded, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "${widget.topAiringAnime?.title}",
          style: AppStyle.mainTitle,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              TopInfoWidget(
                height: height,
                width: width,
                topAiringAnime: widget.topAiringAnime,
              ),
              const SizedBox(height: 20),
              GenresWidget(
                topAiringAnime: widget.topAiringAnime,
                width: width,
              ),
              const SizedBox(height: 20),
              if (trailerURL != null) TrailerWidget(trailerURL: trailerURL),
              const SizedBox(height: 20),
              CustomExpandableText(text: "${widget.topAiringAnime?.synopsis}"),
              const SizedBox(height: 20),
              CharactersWidget(
                height: height,
                width: width,
                pageColor: widget.pageColor,
                getAnimeCharacters: widget.topAiringAnime!.malId.toString(),
              ),
              const SizedBox(height: 20),
              widget.topAiringAnime?.status == "Not yet aired"
                  ? Container()
                  : EpisodeList(
                      function: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (builder) => AnimeEpisodes(
                                title: "${widget.topAiringAnime?.title}",
                                animeID:
                                    widget.topAiringAnime?.malId.toString(),
                                pageColor: widget.pageColor,
                              ),
                            ));
                      },
                    ),
              const SizedBox(height: 20),
              SuggestionsWidget(
                height: height,
                width: width,
                pageColor: widget.pageColor,
                getAnimeRecommendation:
                    '${widget.topAiringAnime?.malId.toString()}',
              )
            ],
          ),
        ),
      ),
    );
  }
}
