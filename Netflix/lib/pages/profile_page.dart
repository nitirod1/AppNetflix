import 'package:flutter/material.dart';
import 'package:netflix_clone/json/home_json.dart';
import 'package:netflix_clone/json/profile.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      resizeToAvoidBottomInset: false,
      appBar: getAppbar(),
      //bottomNavigationBar: getFooter(),
      //body: getBody(),
    );
  }

  Widget getAppbar() {
    return AppBar(
      backgroundColor: Colors.black,
      elevation: 0,
      title: Text(
        "Profile",
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
    );
  }

  /* Widget getBody() {
    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: Column(
  2
            Row(
              children: List.generate(profileData.length, (index) {
                return Container(
                  margin: EdgeInsets.only(right: 8),
                  width: 165,
                  height: 300,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    image: DecorationImage(
                      image: AssetImage(profileData[index]["img"]),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(6),
                  ),
                );
              }),
            )
          ],
        ),
      ),
    );
  }*/
}
