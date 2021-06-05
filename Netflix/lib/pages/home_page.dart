import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/json/home_json.dart';
import 'package:flutter_auth/models/Movie.dart';
import 'package:flutter_auth/pages/topbar_menu/movie_page.dart';

import 'package:flutter_auth/pages/topbar_menu/mylist_page.dart';
import 'package:flutter_auth/pages/profile_page.dart';
import 'package:flutter_auth/pages/topbar_menu/tvshows_page.dart';
import 'package:flutter_auth/pages/video_detail_page.dart';
import 'package:flutter_auth/pages/video_player_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
                  Stack(children: [
                    Container(
                      height: 500,
                      decoration: BoxDecoration(
                          color: Colors.green,
                          image: DecorationImage(
                            image: AssetImage(
                                "assets/images/banner_1.webp"), //ใส่รูป banner หนัง
                            fit: BoxFit.cover,
                          )),
                    ),
                    //กล่องจัดการเกี่ยวกับความชัดของพื้นหลัง
                    Container(
                      height: 500,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Colors.black.withOpacity(0.85),
                            Colors.black.withOpacity(0),
                          ],
                          end: Alignment.topCenter,
                          begin: Alignment.bottomCenter,
                        ),
                      ),
                    ),
                    //ใส่ชื่อเรื่อง
                    Container(
                      height: 500,
                      width: size.width,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(
                            "assets/images/title_img_1.webp",
                            width: 300,
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            "Exciting - Scifi - Drama - Scifi Adventure",
                            style: TextStyle(
                              fontSize: 11,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ]),
                  SizedBox(height: 15),
                  RowFirstMovie(context: context),
                  SizedBox(
                    height: 40,
                  ),
                  //ทำแถบหนังแต่ละเรื่องข้างล่าง เช่น netflix
                  buildGenresMovie(1, widget.viewer),
                  buildMyList(widget.viewer),
                ],
              ),
            ),
            //containner อีกกล่อง
            Container(
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
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) => ProfilePage()));
                              },
                            ),
                            //เชื่อมไปหน้าโปรไฟล์
                          ],
                        )
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    //แถบเมนูชื่อ
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => TVShowsPage()));
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
                                    builder: (_) => MylistPage()));
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
          //แถบเรื่องของหนัง "Hit on netflix"
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
}

class RowFirstMovie extends StatelessWidget {
  const RowFirstMovie({
    Key key,
    @required this.context,
  }) : super(key: key);

  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return Row(
        //แถวปุ่มของหนัง
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          //ทำปุ่ม my list
          GestureDetector(
            onTap: () {},
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
                      fontWeight: FontWeight.w600, color: Colors.white),
                ),
              ],
            ),
          ),
          //ทำกล่องปุ่ม play
          //กดเพื่อเข้าหน้าเล่นรายละเอียดวิดีโอ
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
            onTap: () {},
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
                      fontWeight: FontWeight.w600, color: Colors.white),
                ),
              ],
            ),
          ),
        ]);
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
