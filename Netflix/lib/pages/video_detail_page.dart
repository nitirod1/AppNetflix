import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/json/video_detail_json.dart';
import 'package:flutter_auth/models/Movie.dart';
import 'package:flutter_auth/pages/profile_page.dart';
import 'package:flutter_auth/pages/video_player_page.dart';

import 'home_page.dart';

class VideoDetailPage extends StatefulWidget {
  final int idMovie;
  final int idViewer;

  const VideoDetailPage({
    Key key,
    this.idMovie,
    this.idViewer,
  }) : super(key: key);
  @override
  _VideoDetailPageState createState() => _VideoDetailPageState();
}

class _VideoDetailPageState extends State<VideoDetailPage> {
  String posterUrl;
  int activeEpisode = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: getAppBar(),
      body: getBody(),
    );
  }

  Widget getAppBar() {
    return AppBar(
      backgroundColor: Colors.black,
      elevation: 0,
      leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
            size: 20,
          ),
          onPressed: () {
            Navigator.pop(context);
          }),
      actions: [
        IconButton(
            icon: Image.asset(
              "assets/images/test1.jpg",
              fit: BoxFit.cover,
              width: 26,
              height: 26,
            ),
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => ProfilePage()));
            }),
      ],
    );
  }

  Widget getBody() {
    var size = MediaQuery.of(context).size;

    return FutureBuilder(
      future: getMovieDetail(widget.idViewer, widget.idMovie),
      builder: (context, snapshot) {
        posterUrl = snapshot.data.posterUrl;
        return Container(
          width: size.width,
          height: size.height,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(top: 10, left: 15, right: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    alignment: Alignment.center,
                    height: 160,
                    child: Container(
                      child: Image.network(
                        snapshot.data.posterUrl,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    snapshot.data.name,
                    style: TextStyle(
                        height: 1.4,
                        fontSize: 28,
                        color: Colors.white.withOpacity(0.9),
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Text(
                        snapshot.data.year.toString(),
                        style: TextStyle(
                            color: Colors.white.withOpacity(0.5),
                            fontWeight: FontWeight.w500,
                            fontSize: 15),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(2),
                            color: Colors.white.withOpacity(0.2)),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 6, right: 6, top: 4, bottom: 4),
                          child: Text(
                            snapshot.data.rate.toString() + "+",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 12),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Text(
                        snapshot.data.isSeries
                            ? snapshot.data.noSs.toString() + " season"
                            : "",
                        style: TextStyle(
                            color: Colors.white.withOpacity(0.5),
                            fontWeight: FontWeight.w500,
                            fontSize: 15),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => VideoPlayerPage(
                              //videoUrl: "assets/videos/video_1.mp4",
                              ),
                        ),
                      );
                    },
                    child: Container(
                      width: size.width,
                      height: 38,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: Colors.white),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.play_arrow,
                            color: Colors.black,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            "Play",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Container(
                    width: size.width,
                    height: 38,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: Colors.grey.withOpacity(0.3)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.file_download,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          "Download",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  // fill recent
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    snapshot.data.description,
                    style: TextStyle(
                        height: 1.4, color: Colors.white.withOpacity(0.9)),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    "Cast: " + getSimpleNameActor(snapshot.data.actors),
                    style: TextStyle(
                        fontSize: 13,
                        height: 1.4,
                        color: Colors.grey.withOpacity(0.9)),
                  ),
                  SizedBox(
                    height: 3,
                  ),
                  Text(
                    "Director: " + getSimpleNameActor(snapshot.data.directors),
                    style: TextStyle(
                        fontSize: 13,
                        height: 1.4,
                        color: Colors.grey.withOpacity(0.9)),
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 30),
                    child: Row(
                      children: List.generate(likesList.length, (index) {
                        return Padding(
                          padding: const EdgeInsets.only(right: 50),
                          child: Column(
                            children: [
                              Icon(
                                likesList[index]['icon'],
                                size: 25,
                                color: Colors.white.withOpacity(0.9),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(likesList[index]['text'],
                                  style: TextStyle(
                                      fontSize: 12,
                                      height: 1.4,
                                      color: Colors.grey.withOpacity(0.9)))
                            ],
                          ),
                        );
                      }),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  buildHeaderEp(snapshot.data.isSeries),
                  SizedBox(
                    height: 30,
                  ),
                  snapshot.data.isSeries
                      ? buildEpisode(size, widget.idViewer, widget.idMovie)
                      : SizedBox(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget buildHeaderEp(bool isSeries) {
    return Padding(
      padding: const EdgeInsets.only(right: 25),
      child: Column(children: [
        Container(
          decoration: BoxDecoration(
            border: Border(
                top: BorderSide(
              width: 4,
              color: Colors.red.withOpacity(0.8),
            )),
          ),
          child: Padding(
            padding: const EdgeInsets.only(top: 12),
            child: Text(
              isSeries ? "Episode" : "More Like This",
              style: TextStyle(
                fontSize: 16,
                color: Colors.white.withOpacity(0.9),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        )
      ]),
    );
  }

  Widget buildEpisode(Size size, int viewer, int idMovie) {
    return FutureBuilder(
        future: getMovieEpisode(viewer, idMovie),
        builder: (context, snapshot) {
          return Column(
            children: [
              Text(
                "Season 1",
                style: TextStyle(
                    fontSize: 17,
                    color: Colors.white.withOpacity(0.5),
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 15,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: List.generate(snapshot.data.length, (index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Container(
                              width: (size.width - 30) * 0.85,
                              height: 100,
                              child: Row(
                                children: [
                                  Container(
                                    width: 150,
                                    child: Stack(
                                      children: [
                                        Container(
                                          width: 150,
                                          height: 90,
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            child: Image.network(
                                              posterUrl,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                        Container(
                                          width: 150,
                                          height: 90,
                                          decoration: BoxDecoration(
                                              color: Colors.black
                                                  .withOpacity(0.3)),
                                        ),
                                        Positioned(
                                          top: 30,
                                          left: 57,
                                          child: Container(
                                            width: 38,
                                            height: 38,
                                            decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                border: Border.all(
                                                    width: 2,
                                                    color: Colors.white),
                                                color: Colors.black
                                                    .withOpacity(0.4)),
                                            child: Center(
                                              child: Icon(
                                                Icons.play_arrow,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  Container(
                                    width: (size.width) * 0.35,
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 10),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            snapshot.data[index].noEpisode
                                                    .toString() +
                                                ". " +
                                                snapshot.data[index].name,
                                            style: TextStyle(
                                                fontSize: 15,
                                                height: 1.3,
                                                fontWeight: FontWeight.w400,
                                                color: Colors.white
                                                    .withOpacity(0.9)),
                                          ),
                                          // SizedBox(
                                          //   height: 3,
                                          // ),
                                          // Text(
                                          //   "",
                                          //   style: TextStyle(
                                          //       fontSize: 12,
                                          //       color: Colors.white
                                          //           .withOpacity(0.5)),
                                          // )
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              width: (size.width - 30) * 0.15,
                              height: 100,
                              child: Center(
                                child: Icon(
                                  Icons.file_download,
                                  color: Colors.white.withOpacity(0.7),
                                ),
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          snapshot.data[index].description,
                          style: TextStyle(
                              height: 1.4,
                              color: Colors.white.withOpacity(0.5)),
                        ),
                      ],
                    ),
                  );
                }),
              ),
              SizedBox(
                height: 20,
              )
            ],
          );
        });
  }
}

String getSimpleNameActor(List<Actor> actors) {
  String string = "";
  int length = actors.length <= 3 ? actors.length : 3;
  for (int i = 0; i < length; i++) {
    string += actors[i].name;
    if (i != length - 1) {
      string += ", ";
    }
  }
  return string;
}

Future<MovieDetail> getMovieDetail(int viewer, int idMovie) async {
  String token = await getViewerToken(viewer);
  MovieDetail movie;
  try {
    var dio = Dio();
    var response = await dio.get(
      "https://netflix-cpe231.herokuapp.com/movie",
      options: Options(
        headers: {
          'Authorization': 'Bearer $token',
        },
      ),
      queryParameters: {'id': idMovie},
    );

    movie = MovieDetail.fromJson(response.data);
    return movie;
  } catch (e) {
    print(e);
    return movie;
  }
}

Future<List<dynamic>> getMovieEpisode(int viewer, int idMovie) async {
  String token = await getViewerToken(viewer);
  var episode = [];
  try {
    var dio = Dio();
    var response = await dio.get(
      "https://netflix-cpe231.herokuapp.com/movie/episode",
      options: Options(
        headers: {
          'Authorization': 'Bearer $token',
        },
      ),
      queryParameters: {'id': idMovie},
    );
    for (int i = 0; i < response.data.length; i++) {
      // viewers.add(Viewer.fromJson(response.data[i]));
      episode.add(MovieEpisode.fromJson(response.data[i]));
    }

    return episode;
  } catch (e) {
    print(e);
    return episode;
  }
}

// Text(
//   "S1:E1 The Rise of Nobunaga",
//   style: TextStyle(
//       color: Colors.white.withOpacity(0.9),
//       fontWeight: FontWeight.bold,
//       fontSize: 17),
// ),
// SizedBox(
//   height: 10,
// ),
// Row(
//   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//   children: [
//     Container(
//       width: (size.width - 30) * 0.75,
//       child: Stack(
//         children: [
//           Container(
//             width: (size.width - 30) * 0.75,
//             height: 2.5,
//             decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(5),
//                 color: Colors.grey.withOpacity(0.5)),
//           ),
//           Container(
//             width: (size.width - 30) * 0.2,
//             height: 2.5,
//             decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(5),
//                 color: Colors.red.withOpacity(0.8)),
//           ),
//         ],
//       ),
//     ),
//     Text(
//       "35m remaining",
//       style: TextStyle(color: Colors.grey, fontSize: 10),
//     )
//   ],
// ),
