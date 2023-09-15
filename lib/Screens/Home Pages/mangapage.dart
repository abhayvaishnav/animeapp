import 'package:flutter/material.dart';

class MangaPage extends StatefulWidget {
  const MangaPage({super.key});

  @override
  State<MangaPage> createState() => _MangaPageState();
}

class _MangaPageState extends State<MangaPage> {
  @override
  Widget build(BuildContext context) {
    // var height = MediaQuery.of(context).size.height;
    // var width = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          title: const Text('Manga'),
          actions: [
            IconButton(
              icon: const Icon(Icons.search_rounded, color: Colors.black),
              onPressed: () {
                debugPrint("Pressed");
              },
            ),
          ],
        ),
        body: const Center(child: Text("Coming Soon"))
        // Column(children: [
        //   Container(
        //     margin: const EdgeInsets.all(10),
        //     height: height * 0.1,
        //     width: width,
        //     color: Colors.red,
        //     child: InkWell(
        //         onTap: () {
        //           Navigator.push(
        //             context,
        //             MaterialPageRoute(
        //               builder: (builder) => AnimePage(
        //                 title: 'Top Rated Manga',
        //                 url: ApiUrl.topRatedMangaURL,
        //               ),
        //             ),
        //           );
        //         },
        //         child: const Center(
        //           child: Text('Top Rated Manga'),
        //         )),
        //   ),
        // ]),
        );
  }
}
