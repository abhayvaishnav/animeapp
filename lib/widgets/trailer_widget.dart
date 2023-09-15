import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../Network/network.dart';

class TrailerWidget extends StatefulWidget {
  final String trailerURL;

  const TrailerWidget({
    super.key,
    required this.trailerURL,
  });

  @override
  State<TrailerWidget> createState() => _TrailerWidgetState();
}

class _TrailerWidgetState extends State<TrailerWidget> {
  Anime anime = Anime();
  late YoutubePlayerController controller;
  @override
  void initState() {
    var url = widget.trailerURL;
    controller = YoutubePlayerController(
        initialVideoId: YoutubePlayer.convertUrlToId(url)!,
        flags: const YoutubePlayerFlags(
          autoPlay: false,
          loop: false,
          mute: false,
        ))
      ..addListener(() {
        if (mounted) {
          setState(() {});
        }
      });
    super.initState();
  }

  @override
  void deactivate() {
    super.deactivate();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return YoutubePlayerBuilder(
      player: YoutubePlayer(controller: controller),
      builder: (context, player) => Container(
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
        child: PhysicalModel(
          color: Colors.white,
          elevation: 10,
          borderRadius: BorderRadius.circular(10),
          child: YoutubePlayer(
            controller: controller,
            showVideoProgressIndicator: true,
            bottomActions: [
              IconButton(
                  onPressed: () {
                    if (controller.value.isPlaying) {
                      controller.pause();
                    } else {
                      controller.play();
                    }
                  },
                  icon: const Icon(Icons.play_arrow_rounded))
            ],
          ),
        ),
      ),
    );
  }
}
