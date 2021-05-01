/*onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) => Profile()));
                              },*/
import 'package:flutter/material.dart';
import 'package:netflix_clone/pages/profile_page.dart';
import 'package:netflix_clone/json/mylist_json.dart';

class Mylist_page extends StatefulWidget {
  @override
  _Mylist_pageState createState() => _Mylist_pageState();
}

class _Mylist_pageState extends State<Mylist_page> {
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
        "Mylist",
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget getBody() {
    var size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      //ทำการเลื่อนได้
      child: SingleChildScrollView(
        child: 
                        SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: 
                            
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: List.generate(3,
                                    (index) {
                              return Container(
                                margin: EdgeInsets.only(right: 8),
                                width: 110,
                                height: 160,
                                decoration: BoxDecoration(
                                  color: Colors.green,
                                  image: DecorationImage(
                                    image: AssetImage(
                                        mylistTest[index]['img']),
                                    fit: BoxFit.cover,
                                  ),
                                  borderRadius: BorderRadius.circular(6),
                                ),
                              );
                            })),
                          ),
                        ),


                        
            //containner อีกกล่อง
          /*  Container(
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
                                icon: Icon(
                                  Icons.collections_bookmark,
                                  color: Colors.white,
                                  size: 35,
                                ),
                                onPressed: null),
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
                                        builder: (_) => Profile()));
                              },
                            ),
                            //เชื่อมไปหน้าโปรไฟล์
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ), */
        ),
      );
  }
}
