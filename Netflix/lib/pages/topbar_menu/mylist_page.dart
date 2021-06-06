import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/models/Movie.dart';
import 'package:flutter_auth/pages/profile_page.dart';

import '../home_page.dart';
import '../video_detail_page.dart';

class MylistPage extends StatefulWidget {
  final int viewer;

  const MylistPage({Key key, this.viewer}) : super(key: key);

  @override
  _MylistPageState createState() => _MylistPageState();
}

class _MylistPageState extends State<MylistPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      resizeToAvoidBottomInset: false,
      appBar: getAppbar(),
      //bottomNavigationBar: getFooter(),
      body: getBody(),
    );
  }

  Widget getAppbar() {
    return AppBar(
      backgroundColor: Colors.black,
      elevation: 0,
      title: Text(
        "My List",
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
      actions: [
        IconButton(
          icon: Image.asset("assets/images/test1.jpg",
              width: 26, height: 26, fit: BoxFit.cover),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (_) => ProfilePage()));
          },
        )
      ],
    );
  }

  Widget getBody() {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: FutureBuilder(
          future: getMovieMyList(widget.viewer),
          builder: (context, snapshot) {
            return GridView.count(
              crossAxisCount: 3,
              crossAxisSpacing: 7,
              mainAxisSpacing: 5,
              childAspectRatio: 0.7,
              children: List.generate(
                snapshot.data.length,
                (index) => Container(
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
                ),
              ),
            );
          },
        ),
      ),
    );
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
