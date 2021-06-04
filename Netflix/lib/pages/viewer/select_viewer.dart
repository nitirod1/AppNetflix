import 'package:flutter/material.dart';
import 'package:flutter_auth/json/profile.dart';
import 'package:flutter_auth/pages/edit_profile_page.dart';

import '../profile_user.dart';
import '../root_app.dart';

class SelectViewerPage extends StatefulWidget {
  @override
  _SelectViewerPageState createState() => _SelectViewerPageState();
}

class _SelectViewerPageState extends State<SelectViewerPage> {
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
        "NETFLIX",
        style: TextStyle(
            fontSize: 24, fontWeight: FontWeight.bold, color: Colors.red),
      ),
      actions: [
        IconButton(
            icon: Icon(
              Icons.edit,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (_) => ProfileUserPage()));
            }),
      ],
    );
  }

  Widget getBody() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(50),
        child: Scaffold(
          backgroundColor: Colors.black,
          body: SafeArea(
            child: Center(
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
                                builder: (_) => RootApp(),
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
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 85),
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
                                  builder: (_) => RootApp(),
                                ),
                              );
                            },
                            child: Center(
                              child: Text(
                                profileData[index]["name"],
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
