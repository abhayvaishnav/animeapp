import 'package:flutter/material.dart';

import '../app_style.dart';

class EpisodeList extends StatefulWidget {
  final VoidCallback function;

  const EpisodeList({super.key, required this.function});

  @override
  State<EpisodeList> createState() => EpisodeListState();
}

class EpisodeListState extends State<EpisodeList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          width: 1,
          color: Colors.white,
        ),
      ),
      child: ListTile(
        onTap: widget.function,
        enabled: true,
        textColor: Colors.white,
        title: Text(
          'Anime Episode List',
          style: AppStyle.mainTitle,
        ),
        trailing: const Icon(
          Icons.arrow_forward_ios_rounded,
          color: Colors.white,
        ),
      ),
    );
  }
}
