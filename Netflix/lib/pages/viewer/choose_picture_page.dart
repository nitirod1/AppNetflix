import 'package:flutter/material.dart';
import 'package:flutter_auth/json/home_json.dart';

import '../video_detail_page.dart';

class ChoosePicturePage extends StatefulWidget {
  @override
  _ChoosePicturePageState createState() => _ChoosePicturePageState();
}

class _ChoosePicturePageState extends State<ChoosePicturePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
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
        "Choose Picture",
        style: TextStyle(
            fontSize: 24, fontWeight: FontWeight.bold, color: Colors.red),
      ),
    );
  }

  Widget getBody() {
    return SafeArea(
        child: Column(
      children: List.generate(
          4,
          (index) => Container(
                child: Column(
                  children: [
                    Container(
                      child: Text(
                        "Name Picture",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    //แถบเรื่องของหนัง "popularList"
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Row(
                            children:
                                List.generate(popularList.length, (index) {
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
                                            videoUrl: popularList[index]
                                                ["url"])));
                              },
                            ),
                            decoration: BoxDecoration(
                              color: Colors.green,
                              image: DecorationImage(
                                image: AssetImage(popularList[index]['img']),
                                fit: BoxFit.cover,
                              ),
                              borderRadius: BorderRadius.circular(6),
                            ),
                          );
                        })),
                      ),
                    ),
                  ],
                ),
              )),
    ));
  }
}
