import 'package:animeapp/Models/Anime/anime_model_rec.dart';
import 'package:animeapp/Models/Anime/anime_model.dart';
import 'package:animeapp/app_style.dart';
import 'package:flutter/material.dart';

class TopInfoWidgetRecom extends StatefulWidget {
  final double height;
  final double width;
  final AnimeModelRecomData? topAiringAnime;

  const TopInfoWidgetRecom({
    super.key,
    required this.height,
    required this.width,
    required this.topAiringAnime,
  });

  @override
  State<TopInfoWidgetRecom> createState() => _TopInfoWidgetRecomState();
}

class _TopInfoWidgetRecomState extends State<TopInfoWidgetRecom> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height * 0.24,
      width: widget.width,
      decoration: const BoxDecoration(),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image(
              width: widget.width * 0.3,
              image: NetworkImage(
                '${widget.topAiringAnime?.imageURL.toString()}',
              ),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              // decoration: BoxDecoration(
              // border: Border.all(width: 1, color: Colors.white)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${widget.topAiringAnime?.title}",
                    style: AppStyle.mainTitle,
                  ),
                  Text(
                    'Source: ${widget.topAiringAnime?.source}',
                    style: AppStyle.mainContent,
                  ),
                  Text(
                    'Status: ${widget.topAiringAnime?.status}',
                    style: AppStyle.mainContent,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Type: ${widget.topAiringAnime?.type}',
                        style: AppStyle.mainContent,
                        overflow: TextOverflow.fade,
                      ),
                      Text(
                        'Ep: ${widget.topAiringAnime?.episodes}',
                        style: AppStyle.mainContent,
                        overflow: TextOverflow.fade,
                      ),
                      Text(
                        '⭐ ${widget.topAiringAnime?.scrore}',
                        style: AppStyle.mainContent,
                        overflow: TextOverflow.fade,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
