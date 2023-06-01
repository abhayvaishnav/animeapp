import 'package:animeapp/Models/Anime/anime_episodes_model.dart';
import 'package:flutter/material.dart';
import '../../Network/network.dart';
import '../../app_style.dart';

class AnimeEpisodes extends StatefulWidget {
  final String title;
  final String? animeID;
  final Color pageColor;
  const AnimeEpisodes({
    super.key,
    required this.animeID,
    required this.title,
    required this.pageColor,
  });

  @override
  State<AnimeEpisodes> createState() => _AnimeEpisodesState();
}

class _AnimeEpisodesState extends State<AnimeEpisodes> {
  Anime anime = Anime();
  @override
  void initState() {
    super.initState();
    debugPrint(widget.animeID);
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: widget.pageColor,
        leading: IconButton(
          color: Colors.black,
          icon: const Icon(Icons.arrow_back_ios_rounded, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        elevation: 0,
        centerTitle: true,
        title: Text(
          widget.title,
          style: AppStyle.mainTitle,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: height,
                  width: width,
                  child: FutureBuilder(
                      future: anime.getAnimeEpisodes(widget.animeID.toString()),
                      builder: (BuildContext context, AsyncSnapshot snapshot) {
                        AnimeEpisodesModel? animeEpisodesModel = snapshot.data;
                        final error = snapshot.error;
                        if (snapshot.hasError) {
                          return Text('$error');
                        }
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Center(
                              child: CircularProgressIndicator());
                        }
                        if (snapshot.hasData) {
                          return ListView.builder(
                            shrinkWrap: true,
                            itemCount: animeEpisodesModel?.data.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                    width: 1,
                                    color: Colors.white,
                                  ),
                                  color:
                                      animeEpisodesModel!.data[index].filler ==
                                              false
                                          ? Colors.green
                                          : Colors.red,
                                ),
                                margin: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 4),
                                child: ListTile(
                                  // onTap: () {
                                  //   Navigator.push(
                                  //       context,
                                  //       MaterialPageRoute(
                                  //           builder: (builder) =>
                                  //               WebViewContainer(
                                  //                 url:
                                  //                 animeEpisodesModel
                                  //                     .data[index].url,
                                  //               )));
                                  // },
                                  leading: Text(
                                    animeEpisodesModel.data[index].malId
                                        .toString(),
                                    style: AppStyle.animeEpisodeListTitleStyle,
                                  ),
                                  title: Text(
                                    animeEpisodesModel.data[index].title,
                                    style: AppStyle.animeEpisodeListTitleStyle,
                                  ),
                                  subtitle: Text(
                                    animeEpisodesModel.data[index].titleRomanji,
                                    style:
                                        AppStyle.animeEpisodeListSubTitleStyle,
                                  ),
                                  trailing:
                                      animeEpisodesModel.data[index].filler ==
                                              false
                                          ? const Text(
                                              'Cannon',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            )
                                          : const Text(
                                              'Filler',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            ),
                                ),
                              );
                            },
                          );
                        } else {
                          return const Center(
                              child: CircularProgressIndicator());
                        }
                      }),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
