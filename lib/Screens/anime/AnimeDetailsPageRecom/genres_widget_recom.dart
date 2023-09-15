import 'package:animeapp/Models/Anime/anime_model_rec.dart';
import 'package:animeapp/app_style.dart';
import 'package:flutter/material.dart';

class GenresWidgetRecom extends StatefulWidget {
  final AnimeModelRecomData? topAiringAnime;
  final double width;

  const GenresWidgetRecom({
    super.key,
    required this.topAiringAnime,
    required this.width,
  });

  @override
  State<GenresWidgetRecom> createState() => _GenresWidgetRecomState();
}

class _GenresWidgetRecomState extends State<GenresWidgetRecom> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(width: 1, color: Colors.white),
      ),
      height: 28,
      width: widget.width,
      child: Center(
        child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: widget.topAiringAnime?.genres.length,
            itemBuilder: (BuildContext context, int index) => Text(
                  '${widget.topAiringAnime?.genres[index].name.toString()}, ',
                  style: AppStyle.mainContent,
                  overflow: TextOverflow.fade,
                )),
      ),
    );
  }
}
