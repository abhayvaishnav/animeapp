import 'package:flutter/material.dart';

import '../Models/Anime/anime_model.dart';
import '../app_style.dart';

class GenresWidget extends StatefulWidget {
  final AnimeModel? topAiringAnime;
  final double width;
  final int index;
  const GenresWidget({
    super.key,
    required this.topAiringAnime,
    required this.width,
    required this.index,
  });

  @override
  State<GenresWidget> createState() => _GenresWidgetState();
}

class _GenresWidgetState extends State<GenresWidget> {
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
            itemCount: widget.topAiringAnime?.data[widget.index].genres.length,
            itemBuilder: (BuildContext context, int index) => Text(
                  '${widget.topAiringAnime?.data[widget.index].genres[index].name.toString()}, ',
                  style: AppStyle.mainContent,
                  overflow: TextOverflow.fade,
                )),
      ),
    );
  }
}
