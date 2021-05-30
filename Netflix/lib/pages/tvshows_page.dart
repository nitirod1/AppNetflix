import 'package:flutter/material.dart';
import 'package:netflix_clone/json/home_json.dart';
import 'package:netflix_clone/pages/profile_page.dart';
import 'package:netflix_clone/json/mylist_json.dart';
import 'package:netflix_clone/pages/video_detail_page.dart';

class TVShowsPage extends StatefulWidget {
  @override
  _TVShowsPageState createState() => _TVShowsPageState();
}

class _TVShowsPageState extends State<TVShowsPage> {
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
        "TV Show",
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
      actions: [
        IconButton(
          icon: Image.asset("assets/images/test1.jpg",
              width: 26, height: 26, fit: BoxFit.cover),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (_) => Profile()));
          },
        )
      ],
    );
  }

  Widget getBody() {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: GridView.count(
          crossAxisCount: 3,
          crossAxisSpacing: 7,
          mainAxisSpacing: 5,
          childAspectRatio: 0.7,
          children: List.generate(
            mylistTest.length,
            (index) => Container(
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => VideoDetailPage(
                              videoUrl: originalList[index]["url"])));
                },
              ),
              decoration: BoxDecoration(
                color: Colors.green,
                image: DecorationImage(
                  image: AssetImage(mylistTest[index]['img']),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(6),
              ),
              //width: 50,
              //height: 50,
              //color: Colors.red,
              // child: Text("$index"),
            ),
          ),
        ),
      ),
    );
  }
}
