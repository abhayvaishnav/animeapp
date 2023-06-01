import 'package:animeapp/Models/Anime/anime_model.dart';
import 'package:flutter/material.dart';

import '../app_style.dart';

class TopInfoWidget extends StatefulWidget {
  final double height;
  final double width;
  final AnimeModel? topAiringAnime;
  final int index;

  const TopInfoWidget({
    super.key,
    required this.height,
    required this.width,
    required this.topAiringAnime,
    required this.index,
  });

  @override
  State<TopInfoWidget> createState() => _TopInfoWidgetState();
}

class _TopInfoWidgetState extends State<TopInfoWidget> {
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
                '${widget.topAiringAnime?.data[widget.index].imageURL.toString()}',
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
                    "${widget.topAiringAnime?.data[widget.index].title}",
                    style: AppStyle.mainTitle,
                  ),
                  Text(
                    'Source: ${widget.topAiringAnime?.data[widget.index].source}',
                    style: AppStyle.mainContent,
                  ),
                  Text(
                    'Status: ${widget.topAiringAnime?.data[widget.index].status}',
                    style: AppStyle.mainContent,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Type: ${widget.topAiringAnime?.data[widget.index].type}',
                        style: AppStyle.mainContent,
                        overflow: TextOverflow.fade,
                      ),
                      Text(
                        'Ep: ${widget.topAiringAnime?.data[widget.index].episodes}',
                        style: AppStyle.mainContent,
                        overflow: TextOverflow.fade,
                      ),
                      Text(
                        '⭐ ${widget.topAiringAnime?.data[widget.index].scrore}',
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
