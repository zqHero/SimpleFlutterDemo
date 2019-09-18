import 'package:flutter/material.dart';

class AlignPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: AppBar(
        title: new Text("Align对齐布局"),
      ),
      body: new Stack(
        children: <Widget>[
          new Align(
            alignment: FractionalOffset(0.0, 0.0),
            child: new Image.asset(
              "lib/imgs/类层次结构.png",
              width: 120,
              height: 60,
            ),
          ),
          new Align(
            alignment: FractionalOffset(1.0, 0.0),
            child: new Image.asset(
              "lib/imgs/类层次结构.png",
              width: 120,
              height: 60,
            ),
          ),
          new Align(
            alignment: FractionalOffset.center,
            child: new Image.asset(
              "lib/imgs/类层次结构.png",
              width: 120,
              height: 60,
            ),
          ),
          new Align(
            alignment: FractionalOffset.bottomLeft,
            child: new Image.asset(
              "lib/imgs/类层次结构.png",
              width: 120,
              height: 60,
            ),
          ),
          new Align(
            alignment: FractionalOffset.bottomRight,
            child: new Image.asset(
              "lib/imgs/类层次结构.png",
              width: 120,
              height: 60,
            ),
          ),
        ],
      ),
    );
  }
}
