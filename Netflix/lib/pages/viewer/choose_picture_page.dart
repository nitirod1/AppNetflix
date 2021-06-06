import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/json/choose_picture_json.dart';
import 'package:flutter_auth/json/home_json.dart';
import 'package:flutter_auth/json/profile.dart';
import 'package:flutter_auth/pages/edit_profile_page.dart';

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
      body: getBody(),
    );
  }

  Widget getAppbar() {
    return AppBar(
      backgroundColor: Colors.black,
      elevation: 0,
      title: Text(
        "Choose Picture",
        style: TextStyle(
            fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
      ),
    );
  }

  Widget getBody() {
    return SafeArea(
        child: Column(
            children: List.generate(
                categoryPicture.length,
                (index) => Container(
                      child: Column(children: [
                        Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: Row(
                            children: [
                              Text(
                                categoryPicture[index]["category"],
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16),
                              ),
                            ],
                          ),
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: List.generate(
                              lovealarmPicture.length,
                              (index) => GestureDetector(
                                onTap: () {
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (_) => EditProfilePage()));
                                },
                                child: Container(
                                  margin: EdgeInsets.only(right: 8),
                                  decoration: BoxDecoration(
                                    color: Colors.green,
                                    borderRadius: BorderRadius.circular(3),
                                    image: DecorationImage(
                                      image: AssetImage(
                                        lovealarmPicture[index]["img"],
                                      ),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  width: 80,
                                  height: 80,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                      ]),
                    ))));
  }
}
