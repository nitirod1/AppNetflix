import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/json/profile.dart';
import 'package:flutter_auth/models/Viewer.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
        body: FutureBuilder(
          future: getViewer(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            return getBody(snapshot.data);
          },
        ));
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

  Widget getBody(List<dynamic> viewers) {
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
                      viewers.length,
                      (index) => Container(
                        child: GestureDetector(
                          onTap: () async {
                            await showPinNumberDialog(
                                context, false, viewers[index]);
                          },
                        ),
                        decoration: BoxDecoration(
                          color: Colors.green,
                          image: DecorationImage(
                            image: AssetImage(profileData[0]['img']),
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
                        viewers.length,
                        (index) => Container(
                          child: GestureDetector(
                            onTap: () {
                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(
                              //     builder: (_) => RootApp(),
                              //   ),
                              // );
                            },
                            child: Center(
                              child: Text(
                                viewers[index].name,
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

  Future<void> showPinNumberDialog(
      BuildContext context, bool incorrect, Viewer viewer) async {
    if (viewer.pinNumber == "") {
      return Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => RootApp(
            viewer: viewer.idViewer,
            isKid: viewer.isKid,
          ),
        ),
        (Route<dynamic> route) => false,
      );
    }
    return await showDialog(
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
                  onChanged: (value) {},
                  onCompleted: (value) {
                    if (value == viewer.pinNumber) {
                      Navigator.of(context).pop();
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => RootApp(
                            viewer: viewer.idViewer,
                            isKid: viewer.isKid,
                          ),
                        ),
                        (Route<dynamic> route) => false,
                      );
                    } else {
                      Navigator.of(context).pop();
                      showPinNumberDialog(context, true, viewer);
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
        });
  }
}

Future<void> getViewer() async {
  List<Viewer> viewers;

  String token = await getEmailFromToken();
  try {
    var dio = Dio();
    var response = await dio.get("https://netflix-cpe231.herokuapp.com/viewer",
        options: Options(headers: {
          'Authorization': 'Bearer $token',
        }));

    var viewers = [];
    for (int i = 0; i < response.data.length; i++) {
      viewers.add(Viewer.fromJson(response.data[i]));
    }

    return viewers;
  } catch (e) {
    if (e.error == "Http status error [401]") {
      reBill();
      return getViewer();
    }
    print(e);

    return viewers;
  }
}

Future<void> reBill() async {
  String token = await getEmailFromToken();
  try {
    var dio = Dio();
    var response = await dio.get(
        "https://netflix-cpe231.herokuapp.com/user/payment/rebill",
        options: Options(headers: {
          'Authorization': 'Bearer $token',
        }));

    return;
  } catch (e) {
    return;
  }
}

Future<String> getEmailFromToken() async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getString('tokenUser');
}
