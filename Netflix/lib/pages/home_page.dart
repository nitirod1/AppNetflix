import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/models/Movie.dart';
import 'package:flutter_auth/models/MovieHistory.dart';
import 'package:flutter_auth/models/MovieTop.dart';
import 'package:flutter_auth/pages/topbar_menu/movie_page.dart';
import 'package:flutter_auth/pages/topbar_menu/mylist_page.dart';
import 'package:flutter_auth/pages/profile_page.dart';
import 'package:flutter_auth/pages/topbar_menu/tvshows_page.dart';
import 'package:flutter_auth/pages/video_detail_page.dart';
import 'package:flutter_auth/pages/video_player_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

int idMovieBanner;

class HomePage extends StatefulWidget {
  final int viewer;
  final bool isKid;

  const HomePage({Key key, this.viewer, this.isKid}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.black,
      body: getBody(),
    );
  }

  Widget getBody() {
    var size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      //ทำการเลื่อนได้
      child: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              width: size.height - 80,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildBannerMovie(size, widget.viewer),
                  buildTopMovie(1, widget.viewer),
                  buildGenresMovie(1, widget.viewer),
                  buildMyList(widget.viewer),
                  buildHistory(1, widget.viewer),
                ],
              ),
            ),
            buildAppBar(),
          ],
        ),
      ),
    );
  }

  Widget buildAppBar() {
    return Container(
      child: SafeArea(
        child: Column(
          children: [
            //ปุ่มต่างๆ แถบข้างบน
            SizedBox(height: 10), //จัดการช่องว่างข้างบน
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Image.asset(
                    "assets/images/logo.ico", //ทำการใส่ icon
                    width: 35,
                    fit: BoxFit.cover,
                  ),
                ),
                Row(
                  children: [
                    IconButton(
                      icon: Image.asset(
                        "assets/images/test1.jpg", //หน้าโปรไฟล์
                        width: 26,
                        height: 26,
                        fit: BoxFit.cover,
                      ),
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (_) => ProfilePage()));
                      },
                    ),
                  ],
                )
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => TVShowsPage()));
                  },
                  child: Text(
                    "TV Shows",
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => MoviePage()));
                  },
                  child: Text(
                    "Movies",
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => MylistPage(
                                  viewer: widget.viewer,
                                )));
                  },
                  child: Text(
                    "My List",
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  FutureBuilder buildGenresMovie(int genres, int idViewer) {
    return FutureBuilder(
      future: getMovieGenres(genres, idViewer),
      builder: (context, snapshot) {
        return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15),
            child: Text(
              snapshot.data[0].genresName,
              style: TextStyle(
                  fontSize: 15,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 8,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Row(
                  children: List.generate(snapshot.data.length, (index) {
                return Container(
                  margin: EdgeInsets.only(right: 8),
                  width: 110,
                  height: 160,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => VideoDetailPage(
                            idMovie: snapshot.data[index].idMovie,
                          ),
                        ),
                      );
                    },
                    child: Container(
                      child: Image.network(
                        snapshot.data[index].posterUrl,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(6),
                  ),
                );
              })),
            ),
          ),
        ]);
      },
    );
  }

  FutureBuilder buildMyList(int idViewer) {
    return FutureBuilder(
      future: getMovieMyList(idViewer),
      builder: (context, snapshot) {
        return snapshot.data.length != 0
            ? Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: Text(
                    "My List",
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Row(
                        children: List.generate(snapshot.data.length, (index) {
                      return Container(
                        margin: EdgeInsets.only(right: 8),
                        width: 110,
                        height: 160,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => VideoDetailPage(
                                  idMovie: snapshot.data[index].idMovie,
                                ),
                              ),
                            );
                          },
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(6),
                            child: Image.network(snapshot.data[index].posterUrl,
                                fit: BoxFit.cover),
                          ),
                        ),
                      );
                    })),
                  ),
                ),
              ])
            : SizedBox();
      },
    );
  }

  FutureBuilder buildTopMovie(int idMovie, int idViewer) {
    return FutureBuilder(
      future: getTopToken(idMovie, idViewer),
      builder: (context, snapshot) {
        return snapshot.data.length != 0
            ? Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: Text(
                    "Top 10 Movie",
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Row(
                        children: List.generate(snapshot.data.length, (index) {
                      return Container(
                        margin: EdgeInsets.only(right: 8),
                        width: 110,
                        height: 160,
                        child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => VideoDetailPage(
                                    idMovie: snapshot.data[index].idMovie,
                                  ),
                                ),
                              );
                            },
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(6),
                              child: Image.network(
                                  snapshot.data[index].posterUrl,
                                  fit: BoxFit.cover),
                            )),
                      );
                    })),
                  ),
                ),
              ])
            : SizedBox();
      },
    );
  }

  FutureBuilder buildHistory(int idHistory, int idViewer) {
    return FutureBuilder(
      future: getDetailToken(idHistory, idViewer),
      builder: (context, snapshot) {
        return snapshot.data.length != 0
            ? Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: Text(
                    "History",
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Row(
                        children: List.generate(snapshot.data.length, (index) {
                      return Container(
                        margin: EdgeInsets.only(right: 8),
                        width: 110,
                        height: 160,
                        child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => VideoDetailPage(
                                    idMovie: snapshot.data[index].idMovie,
                                  ),
                                ),
                              );
                            },
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(6),
                              child: Image.network(
                                  snapshot.data[index].posterUrl,
                                  fit: BoxFit.cover),
                            )),
                      );
                    })),
                  ),
                ),
              ])
            : SizedBox();
      },
    );
  }

  Widget buildBannerMovie(Size size, int viewer) {
    return FutureBuilder(
      future: getBannerMovie(viewer),
      builder: (context, snapshot) {
        return Container(
          height: 500,
          child: Stack(
            children: [
              Image.network(
                snapshot.data.posterUrl,
                fit: BoxFit.cover,
                height: 500,
                width: size.width,
              ),
              Column(
                children: [
                  Container(
                    height: 100,
                  ),
                  Container(
                    alignment: Alignment.bottomCenter,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: <Color>[Colors.black, Colors.black],
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                child: Column(
                  children: [
                    Container(
                      height: 420,
                    ),
                    Text(
                      getGenresString(snapshot.data.genres),
                      style: TextStyle(
                        fontSize: 11,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                child: Column(
                  children: [
                    Container(height: 450),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          GestureDetector(
                            onTap: () {},
                            child: Container(
                              child: Column(
                                children: [
                                  Icon(
                                    Icons.add,
                                    color: Colors.white,
                                    size: 25,
                                  ),
                                  SizedBox(height: 5),
                                  Text(
                                    "My List",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white),
                                  ),
                                ],
                              ),
                            ),
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
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    right: 13, left: 8, top: 2, bottom: 2),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.play_arrow,
                                      color: Colors.black,
                                      size: 30,
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      "Play",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => VideoDetailPage(
                                    idMovie: idMovieBanner,
                                  ),
                                ),
                              );
                            },
                            child: Column(
                              children: [
                                Icon(
                                  Icons.info_outline,
                                  color: Colors.white,
                                  size: 25,
                                ),
                                SizedBox(height: 5),
                                Text(
                                  "Info",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

Future<List<dynamic>> getTopToken(int idMovie, int idViewer) async {
  String token = await getViewerToken(idViewer);
  var listMovie = [];
  try {
    var dio = Dio();
    var response =
        await dio.get("https://netflix-cpe231.herokuapp.com/browse/top10",
            options: Options(headers: {
              'Authorization': 'Bearer $token',
            }),
            queryParameters: {'id': idMovie});
    for (int i = 0; i < response.data.length; i++) {
      listMovie.add(MovieTop.fromJson(response.data[i]));
    }
    return listMovie;
  } catch (e) {
    print(e);
    return listMovie;
  }
}

Future<List<dynamic>> getDetailToken(int idHistory, int viewer) async {
  String token = await getViewerToken(viewer);
  var listMovie = [];
  try {
    var dio = Dio();
    var response =
        await dio.get("https://netflix-cpe231.herokuapp.com/browse/history",
            options: Options(headers: {
              'Authorization': 'Bearer $token',
            }),
            queryParameters: {'id': idHistory});

    for (int i = 0; i < response.data.length; i++) {
      // viewers.add(Viewer.fromJson(response.data[i]));
      listMovie.add(MovieHistory.fromJson(response.data[i]));
    }
    print(listMovie);
    return listMovie;
  } catch (e) {
    print(e);
    return listMovie;
  }
}

Future<String> getViewerToken(int viewer) async {
  final prefs = await SharedPreferences.getInstance();
  String token = prefs.getString('tokenUser');
  try {
    var dio = Dio();
    var response =
        await dio.get("https://netflix-cpe231.herokuapp.com/viewer/token",
            options: Options(headers: {
              'Authorization': 'Bearer ' + token,
            }),
            queryParameters: {'id': viewer});

    return response.data['token'];
  } catch (e) {
    print(e);
    return "";
  }
}

Future<List<dynamic>> getMovieGenres(int genres, int viewer) async {
  String token = await getViewerToken(viewer);
  var listMovie = [];
  try {
    var dio = Dio();
    var response =
        await dio.get("https://netflix-cpe231.herokuapp.com/browse/genres",
            options: Options(headers: {
              'Authorization': 'Bearer $token',
            }),
            queryParameters: {'id': genres});

    for (int i = 0; i < response.data.length; i++) {
      // viewers.add(Viewer.fromJson(response.data[i]));
      listMovie.add(MoviePoster.fromJson(response.data[i]));
    }
    print(listMovie);
    return listMovie;
  } catch (e) {
    print(e);
    return listMovie;
  }
}

Future<List<dynamic>> getMovieMyList(int viewer) async {
  String token = await getViewerToken(viewer);
  var listMovie = [];
  try {
    var dio = Dio();
    var response = await dio.get(
      "https://netflix-cpe231.herokuapp.com/browse/mylist",
      options: Options(headers: {
        'Authorization': 'Bearer $token',
      }),
    );

    for (int i = 0; i < response.data.length; i++) {
      // viewers.add(Viewer.fromJson(response.data[i]));
      listMovie.add(Movie.fromJson(response.data[i]));
    }
    return listMovie;
  } catch (e) {
    print(e);
    return listMovie;
  }
}

Future<MovieDetail> getBannerMovie(int viewer) async {
  String token = await getViewerToken(viewer);
  MovieDetail movie;
  try {
    var dio = Dio();
    var response = await dio.get(
      "https://netflix-cpe231.herokuapp.com/browse/banner",
      options: Options(
        headers: {
          'Authorization': 'Bearer $token',
        },
      ),
    );

    movie = MovieDetail.fromJson(response.data);
    idMovieBanner = movie.idMovie;
    return movie;
  } catch (e) {
    print(e);
    return movie;
  }
}

String getGenresString(List<Actor> genres) {
  String str = "";
  int len = genres.length < 4 ? genres.length : 4;
  for (int i = 0; i < len; i++) {
    str += genres[i].name;
    if (len - 1 != i) {
      str += " - ";
    }
  }
  return str;
}

// SizedBox(
//   height: 30,
// ),
// Padding(
//   padding: const EdgeInsets.only(left: 15, right: 15),
//   child: Text("Netflix Original",
//       style: TextStyle(
//           fontSize: 15,
//           color: Colors.white,
//           fontWeight: FontWeight.bold)),
// ),
// SizedBox(
//   height: 8,
// ),
//แถบเรื่องของหนัง "originalList"
// SingleChildScrollView(
//   scrollDirection: Axis.horizontal,
//   child: Padding(
//     padding: const EdgeInsets.only(left: 10),
//     child: Row(
//       children: List.generate(
//         originalList.length,
//         (index) {
//           return Container(
//             margin: EdgeInsets.only(right: 8),
//             width: 165,
//             height: 300,
//             child: GestureDetector(
//               onTap: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (_) => VideoDetailPage(
//                       videoUrl: originalList[index]
//                           ["url"],
//                     ),
//                   ),
//                 );
//               },
//             ),
//             decoration: BoxDecoration(
//               color: Colors.green,
//               image: DecorationImage(
//                 image: AssetImage(
//                     originalList[index]['img']),
//                 fit: BoxFit.cover,
//               ),
//               borderRadius: BorderRadius.circular(6),
//             ),
//           );
//         },
//       ),
//     ),
//   ),
// ),
