import 'package:flutter/material.dart';
import 'package:flutter_auth/json/profile.dart';
import 'package:flutter_auth/pages/viewer/choose_picture_page.dart';

class EditProfilePage extends StatefulWidget {
  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
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
        "Edit Profile",
        style: TextStyle(
            fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
      ),
      actions: [
        GestureDetector(
          onTap: () {
            print("SAVE");
          },
          child: Padding(
            padding: const EdgeInsets.only(right: 15, top: 5),
            child: Center(
              child: Text(
                "SAVE",
                style: TextStyle(
                  color: Colors.green,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget getBody() {
    return SafeArea(
      child: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (_) => ChoosePicturePage()));
                },
                child: Stack(
                  children: [
                    Center(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.green,
                          image: DecorationImage(
                            image: AssetImage(profileData[0]['img']),
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        alignment: Alignment.bottomRight,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Icon(
                            Icons.edit,
                            color: Colors.black,
                          ),
                          width: 30,
                          height: 30,
                        ),
                        width: 120,
                        height: 120,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            height: 50,
            width: 300,
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.25),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  style: TextStyle(color: Colors.white),
                  initialValue: "ชื่อเก่า",
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Name Profile",
                    hintStyle: TextStyle(
                      color: Colors.white.withOpacity(0.5),
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          GestureDetector(
            onTap: () {},
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.center,
              //verticalDirection: VerticalDirection.up,
              //mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.delete_sharp,
                  color: Colors.white,
                ),
                SizedBox(
                  width: 7,
                ),
                Text(
                  "Delete profile",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.white,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
