import 'package:flutter/material.dart';
import 'package:flutter_auth/json/profile.dart';
import 'package:flutter_auth/pages/edit_profile_page.dart';

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
      leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
            size: 20,
          ),
          onPressed: () {
            Navigator.pop(context);
          }),
      title: Text(
        "Manage Profiles",
        style: TextStyle(
            fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
      ),
    );
  }

  Widget getBody() {
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
                              builder: (_) => EditProfilePage(
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
                    ),
                  ),
                ),
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
                              builder: (_) => EditProfilePage(
                                  //videoUrl: originalList[index]["url"],
                                  ),
                            ),
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(45),
                          child: Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(width: 2, color: Colors.white),
                            ),
                            child: Icon(
                              Icons.edit,
                              color: Colors.white,
                              size: 30,
                            ),
                          ),
                        ),
                      ),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Colors.black.withOpacity(0.5),
                            Colors.black.withOpacity(0.5),
                          ],
                        ),
                        color: Colors.green,
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
                                builder: (_) => EditProfilePage(),
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
    );
  }
}
