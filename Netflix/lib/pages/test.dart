import 'package:flutter/material.dart';
import 'package:netflix_clone/json/home_json.dart';
import 'package:netflix_clone/json/profile.dart';
import 'package:netflix_clone/pages/profile_page.dart';
import 'package:netflix_clone/json/mylist_json.dart';
import 'package:netflix_clone/pages/video_detail_page.dart';

import 'mylist_page.dart';

class ProfileUserPage extends StatefulWidget {
  @override
  _ProfileUserPageState createState() => _ProfileUserPageState();
}

class _ProfileUserPageState extends State<ProfileUserPage> {
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
        "จัดการโปรไฟล์",
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget getBody() {
    var size = MediaQuery.of(context).size;
    //int itemCount = profileData.length;
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(50),
        child: Scaffold(
          backgroundColor: Colors.black,
          body: SafeArea(
            child: Stack(
              children: [
                GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 50,
                  childAspectRatio: 1,
                  children: List.generate(
                    profileData.length,
                    (index) => Container(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => MylistPage(
                                  //videoUrl: originalList[index]["url"],
                                  ),
                            ),
                          );
                        },
                      ),

                      decoration: BoxDecoration(
                        color: Colors.green,
                        image: DecorationImage(
                          image: AssetImage(profileData[index]['img']),
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
              ],
            ),
          ),

          /*SafeArea(
            child: GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 20,
              mainAxisSpacing: 50,
              childAspectRatio: 1,
              children: List.generate(
                profileData.length,
                (index) => Container(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => MylistPage(
                              //videoUrl: originalList[index]["url"],
                              ),
                        ),
                      );
                    },
                  ),

                  decoration: BoxDecoration(
                    color: Colors.green,
                    image: DecorationImage(
                      image: AssetImage(profileData[index]['img']),
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
          ),*/
        ),
      ),
    );
  }
}
