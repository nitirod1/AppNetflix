import 'package:flutter/material.dart';
import 'package:netflix_clone/json/search_json.dart';
import 'package:netflix_clone/pages/profile_page.dart';
import 'package:netflix_clone/pages/video_detail_page.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: getAppbar(),
      body: getBody(),
    );
  }

//ทำการเขียนส่วน Appbar ด้านบน รวมไปถึงช่อง search
  Widget getAppbar() {
    return AppBar(
      backgroundColor: Colors.black,
      elevation: 0,
      title: Container(
        height: 35,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.25),
          borderRadius: BorderRadius.circular(5),
        ),
        child: TextField(
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: "Searches",
            hintStyle: TextStyle(color: Colors.white.withOpacity(0.5)),
            prefixIcon: Icon(
              Icons.search,
              color: Colors.white.withOpacity(0.5),
            ),
          ),
        ),
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

//ทำส่วนเนื้อหาที่ search มาด้านล่าง
  Widget getBody() {
    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(top: 10, left: 18, right: 18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //ส่วนตัวหนังสือ Top Searches ด้านบน
            Text(
              "Top Searches",
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 12),
            //ด้านล่างของตัวหนังสือ Top searchs

            Column(
                children: List.generate(searchJson.length, (index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Row(
                  children: [
                    Container(
                      width: (size.width - 36) * 0.8,
                      height: 80,
                      //decoration: BoxDecoration(color: Colors.red),
                      //image: DecorationImage(image: AssetImage(searchJson[0]["img"])),
                      child: Row(
                        children: [
                          Stack(
                            children: [
                              //ทำในส่วนของภาพหนัง
                              Container(
                                width: 120,
                                height: 70,
                                decoration: BoxDecoration(
                                  //color: Colors.red,
                                  borderRadius: BorderRadius.circular(5),
                                  image: DecorationImage(
                                    image: AssetImage(searchJson[index]["img"]),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Container(
                                width: 120,
                                height: 70,
                                decoration: BoxDecoration(
                                    color: Colors.black.withOpacity(0.2)),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                            width: (size.width - 36) * 0.4,
                            child: Text(
                              searchJson[index]["title"],
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          )
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => VideoDetailPage(
                                      videoUrl: (searchJson[index]["video"]),
                                    )));
                      },
                      child: Container(
                        width: (size.width - 36) * 0.2,
                        height: 80,
                        child: Center(
                          child: Container(
                            width: 35,
                            height: 35,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(width: 2, color: Colors.white),
                            ),
                            child: Center(
                              child: Icon(
                                Icons.play_arrow,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }))
          ],
        ),
      ),
    );
  }
}
