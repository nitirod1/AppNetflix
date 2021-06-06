import 'package:flutter/material.dart';
import 'package:flutter_auth/json/root_app_json.dart';
import 'package:flutter_auth/pages/comingsoon_page.dart';
import 'package:flutter_auth/pages/home_page.dart';
import 'package:flutter_auth/pages/search_page.dart';

class RootApp extends StatefulWidget {
  @override
  _RootAppState createState() => _RootAppState();
}

class _RootAppState extends State<RootApp> {
  int activeTab = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      resizeToAvoidBottomInset: false,
      bottomNavigationBar: getFooter(),
      body: getBody(),
    );
  }

  Widget getBody() {
    //ทำการให้แถบข้างล่างเชื่อมโยงไปหน้าอื่น
    return IndexedStack(index: activeTab, children: [
      HomePage(),
      ComingSoonPage(),
      SearchPage(),
      Center(
        child: Text(
          "Dowloads",
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
    ]);
  }

  Widget getFooter() {
    //สร้างแถบเมนูข้างล่าง
    return Container(
      height: 80,
      decoration: BoxDecoration(color: Colors.black),
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(items.length, (index) {
            //ทำการสร้างแต่ละเมนูด้านล่าง
            return GestureDetector(
              onTap: () {
                setState(() {
                  activeTab = index;
                });
              },
              child: Column(children: [
                Icon(
                  items[index]["icon"],
                  color: Colors.white,
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  items[index]["text"],
                  style: TextStyle(color: Colors.white, fontSize: 10),
                )
              ]),
            );
          }),
        ),
      ),
    );
  }
}
