import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_auth/json/profile.dart';
import 'package:flutter_auth/pages/profile_user.dart';
import 'package:flutter_auth/pages/topbar_menu/dropdown_button/test.dart';
import 'package:flutter_auth/pages/viewer/select_viewer.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:flutter_auth/pages/topbar_menu/mylist_page.dart';

// final List<Icon> icon = <Icon>[
//   Icon(Icons.check),
//   Icon(Icons.settings),
//   Icon(Icons.account_circle_outlined),
//   Icon(Icons.logout)
// ];

final List<Icon> icons = [
  Icon(
    Icons.check,
    color: Colors.white,
  ),
  Icon(
    Icons.settings,
    color: Colors.white,
  ),
  Icon(
    Icons.account_circle_outlined,
    color: Colors.white,
  ),
  Icon(
    Icons.logout,
    color: Colors.white,
  )
];

final List<String> menu = ['My List', 'App Settings', 'Account', 'Sign Out'];
final List link = [
  MylistPage(),
  DropDownButton(),
  SelectViewerPage(),
  MylistPage(),
];

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
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
        "Profiles & More",
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget getBody() {
    createAlertDialog(BuildContext context, bool incorrect) {
      String currentText = "";

      return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(
              incorrect
                  ? "Incorrect PIN. Please try again."
                  : "Enter your PIN to access this profile.",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
            content: Wrap(
              children: [
                PinCodeTextField(
                  obscureText: true,
                  obscuringCharacter: '*',
                  animationType: AnimationType.fade,
                  blinkWhenObscuring: true,
                  enablePinAutofill: true,
                  appContext: context,
                  keyboardType: TextInputType.number,
                  length: 4,
                  onChanged: (value) {
                    setState(() {
                      currentText = value;
                    });
                  },
                  onCompleted: (value) {
                    if (value == "1234") {
                      Navigator.of(context).pop();
                    } else {
                      Navigator.of(context).pop();
                      createAlertDialog(context, true);
                    }
                  },
                ),
                SizedBox(
                  height: 70,
                ),
                Text("Forget PIN?", textAlign: TextAlign.center),
              ],
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text("Cancel"))
            ],
          );
        },
      );
    }

    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: List.generate(
                profileData.length,
                (index) => GestureDetector(
                  onTap: () {
                    createAlertDialog(context, false);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(6),
                      image: DecorationImage(
                        image: AssetImage(
                          profileData[index]["img"],
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                    //child: Text("test"),
                    width: 60,
                    height: 60,
                  ),
                ),
              ),
            ),
            SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: List.generate(
                profileData.length,
                (index) => Container(
                  decoration: BoxDecoration(
                    //color: Colors.green,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Center(
                    child: Text(
                      profileData[index]["name"],
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                          fontSize: 16),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 5),
            GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => ProfileUserPage()));
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child: Icon(
                      Icons.edit,
                      color: Colors.white,
                      size: 17,
                    ),
                  ),
                  SizedBox(
                    width: 7,
                  ),
                  Container(
                    child: Text(
                      "Edit profile",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Column(
              children: List.generate(
                menu.length,
                (index) => Container(
                  color: Colors.grey.withOpacity(0.1),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) => link[index]));
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              child: Row(
                                children: [
                                  icons[index],
                                  SizedBox(
                                    width: 8,
                                  ),
                                  Text(
                                    menu[index],
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              child: Icon(
                                Icons.arrow_forward_ios_outlined,
                                size: 14,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),

            // GestureDetector(
            //   onTap: () {
            //     Navigator.push(
            //         context, MaterialPageRoute(builder: (_) => MylistPage()));
            //   },
            //   child: Padding(
            //     padding: const EdgeInsets.only(left: 10),
            //     child: Row(
            //       mainAxisAlignment: MainAxisAlignment.start,
            //       children: [
            //         Container(
            //           child: Icon(
            //             Icons.check,
            //             color: Colors.white,
            //             size: 19,
            //           ),
            //         ),
            //         SizedBox(
            //           width: 8,
            //         ),
            //         Container(
            //           child: Text(
            //             "My List",
            //             style: TextStyle(
            //                 fontSize: 20, fontWeight: FontWeight.bold),
            //           ),
            //           decoration: BoxDecoration(
            //               //border: Border(
            //               //  bottom: BorderSide(width: 3, color: Colors.grey),
            //               //),
            //               ),
            //         ),
            //       ],
            //     ),
            //   ),
            // ),
            // SizedBox(
            //   height: 15,
            // ),
            // GestureDetector(
            //   onTap: () {
            //     Navigator.push(context,
            //         MaterialPageRoute(builder: (_) => EditProfilePage()));
            //   },
            //   child: Padding(
            //     padding: const EdgeInsets.only(left: 10),
            //     child: Row(
            //       mainAxisAlignment: MainAxisAlignment.start,
            //       children: [
            //         Container(
            //           child: Text(
            //             "• Setting",
            //             style: TextStyle(
            //                 fontSize: 20, fontWeight: FontWeight.w600),
            //           ),
            //           decoration: BoxDecoration(
            //               //border: Border(
            //               //  bottom: BorderSide(width: 3, color: Colors.grey),
            //               //),
            //               ),
            //         ),
            //       ],
            //     ),
            //   ),
            // ),
            // SizedBox(
            //   height: 10,
            // ),
            // GestureDetector(
            //   onTap: () {
            //     Navigator.push(context,
            //         MaterialPageRoute(builder: (_) => ProfileUserPage()));
            //   },
            //   child: Padding(
            //     padding: const EdgeInsets.only(left: 10),
            //     child: Row(
            //       mainAxisAlignment: MainAxisAlignment.start,
            //       children: [
            //         Container(
            //           child: Text(
            //             "• Account",
            //             style: TextStyle(
            //                 fontSize: 20, fontWeight: FontWeight.bold),
            //           ),
            //           decoration: BoxDecoration(),
            //         ),
            //       ],
            //     ),
            //   ),
            // ),
            // SizedBox(
            //   height: 10,
            // ),
            // GestureDetector(
            //   onTap: () {
            //     Navigator.push(
            //         context, MaterialPageRoute(builder: (_) => MylistPage()));
            //   },
            //   child: Padding(
            //     padding: const EdgeInsets.only(left: 10),
            //     child: Row(
            //       mainAxisAlignment: MainAxisAlignment.start,
            //       children: [
            //         Container(
            //           child: Text(
            //             "• Help",
            //             style: TextStyle(
            //                 fontSize: 20, fontWeight: FontWeight.bold),
            //           ),
            //           decoration: BoxDecoration(
            //               //border: Border(
            //               //  bottom: BorderSide(width: 3, color: Colors.grey),
            //               //),
            //               ),
            //         ),
            //       ],
            //     ),
            //   ),
            // ),
            // SizedBox(
            //   height: 10,
            // ),
            // GestureDetector(
            //   onTap: () {
            //     Navigator.push(
            //         context, MaterialPageRoute(builder: (_) => MylistPage()));
            //   },
            //   child: Padding(
            //     padding: const EdgeInsets.only(left: 10),
            //     child: Row(
            //       mainAxisAlignment: MainAxisAlignment.start,
            //       children: [
            //         Container(
            //           child: Text(
            //             "• Log out",
            //             style: TextStyle(
            //                 fontSize: 20, fontWeight: FontWeight.bold),
            //           ),
            //           decoration: BoxDecoration(
            //               //border: Border(
            //               //  bottom: BorderSide(width: 3, color: Colors.grey),
            //               //),
            //               ),
            //         ),
            //       ],
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
