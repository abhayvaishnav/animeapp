import 'package:flutter/material.dart';

import '../Models/Anime/anime_model.dart';
import '../Screens/anime/anime_details_page.dart';
import '../app_style.dart';

class AnimeCard extends StatefulWidget {
  final double height;
  final double width;
  final AnimeModel? topAiringAnime;
  final int index;
  final List<Color> gradientColor;

  const AnimeCard({
    super.key,
    required this.height,
    required this.width,
    required this.topAiringAnime,
    required this.index,
    required this.gradientColor,
  });

  @override
  State<AnimeCard> createState() => _AnimeCardState();
}

class _AnimeCardState extends State<AnimeCard> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (builder) => AnimeDetailPage(
            topAiringAnime: widget.topAiringAnime?.data.first,
            pageColor: widget.gradientColor[1],
          ),
        ),
      ),
      child: Container(
        height: widget.height * 0.2,
        width: widget.width * 0.9,
        padding: const EdgeInsets.all(8),
        margin: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: widget.gradientColor),
          boxShadow: const [
            BoxShadow(
              color: Colors.grey,
              offset: Offset(0.0, 1.0), //(x,y)
              blurRadius: 6.0,
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                // border: Border.all(
                //   width: 1,
                //   color: Colors.white,
                // ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image(
                  image: NetworkImage(
                      '${widget.topAiringAnime?.data[widget.index].imageURL.toString()}'),
                ),
              ),
            ),
            const SizedBox(width: 10),
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '${widget.topAiringAnime?.data[widget.index].title}',
                    style: AppStyle.mainContent,
                    overflow: TextOverflow.fade,
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
          ],
        ),
      ),
    );
  }
}
