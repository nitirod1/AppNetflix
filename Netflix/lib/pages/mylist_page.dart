/*onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) => Profile()));
                              },*/
import 'package:flutter/material.dart';

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
      //body: getBody(),
    );
  }
Widget getAppbar(){
return AppBar(
  backgroundColor: Colors.black,
  elevation: 0,
  title: Text(
    "Mylist",
    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
  ),
  
);
}

}