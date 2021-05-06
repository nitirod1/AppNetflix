import 'package:flutter/material.dart';
import 'package:netflix_clone/json/coming_soon_json.dart';
import 'package:netflix_clone/pages/profile_page.dart';

class ComingSoonPage extends StatefulWidget {
  @override
  _ComingSoonPageState createState() => _ComingSoonPageState();
}

class _ComingSoonPageState extends State<ComingSoonPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: getAppbar(),
      body: getBody(),
    );
  }

  Widget getAppbar() {
    //ทำส่วน appbar ด้านบน
    return AppBar(
      backgroundColor: Colors.black,
      elevation: 0,
      title: Text(
        "Coming Soon",
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      actions: [
        IconButton(
            icon: Icon(Icons.collections_bookmark, size: 28), onPressed: () {}),
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
    //ทำการสร้างส่วน body
    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 15, left: 20, right: 20),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.notifications_none_outlined,
                        size: 28,
                        color: Colors.white.withOpacity(0.9),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Text(
                        "Nofications",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.white.withOpacity(0.9),
                        ),
                      )
                    ],
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 22,
                    color: Colors.white.withOpacity(0.9),
                  )
                ]),
          ),
          //ทำการสร้างส่วน coming soon ด้านล่าง
          SizedBox(
            height: 20,
          ),
          Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: List.generate(comingSoonJson.length, (index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 220,
                        child: Stack(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(
                                        comingSoonJson[index]["img"]),
                                    fit: BoxFit.cover),
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.black.withOpacity(0.2),
                              ),
                            )
                          ],
                        ),
                      ),

                      //ทำการเช็คว่ามีค่าเป็น null หรือไม่ ถ้าเป็น null ไม่ต้องแสดงแถบเวลาที่ดู
                      comingSoonJson[index]["duration"]
                          ? Column(
                              children: [
                                SizedBox(
                                  height: 20,
                                ),
                                Stack(
                                  children: [
                                    Container(
                                      height: 2.5,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color: Colors.grey.withOpacity(0.7),
                                      ),
                                    ),

                                    //ทำความยาวของวิดีโอที่ดูอยู่ ว่าดุไว้กี่นาที ทำเป็น stack ซ้อนกัน
                                    Container(
                                      height: 2.5,
                                      width: size.width * 0.34,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color: Colors.red.withOpacity(0.7),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            )
                          : Container(),
                      SizedBox(
                        height: 15,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image.asset(
                              comingSoonJson[index]["title_img"],
                              width: 120,
                            ),
                            Row(
                              children: [

                                Column(children: [
                                  //ทำกดnotification
                                  Icon(
                                    Icons.notifications_none_outlined,
                                    color: Colors.white,
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    "Remind me",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 11,
                                    ),
                                  )
                                ]),
                                SizedBox(width:30,),


                                //ทำปุ่ม info
                                Column(children: [
                                  Icon(
                                    Icons.info_outline,
                                    color: Colors.white,
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    "info",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 11,
                                    ),
                                  )
                                ])
                              ],
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: 20,),


                    ],
                  ),
                );
              }))
        ],
      ),
    );
  }
}
