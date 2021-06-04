import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  final Widget child;
  const Background({
    Key key,
    @required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      width: double.infinity,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Positioned(
            top: 100,
            child: Align(
              alignment: Alignment.topCenter,
              child: Image.asset(
                "assets/images/Netflix_Logo_PMS.png",
                width: size.width * 0.7,
                height: size.height * 0.3,
              ),
            ),
          ),
          child,
        ],
      ),
    );
  }
}
