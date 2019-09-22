import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OpacityPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("OpacityPage"),
      ),
      body: new Center(
        child: new Opacity(
          opacity: 0.3,
          child: new Container(
            width: 200,
            height: 100,
            decoration: new BoxDecoration(color: Colors.black38),
            child: Text(
              '不透明度0.3',
              style: new TextStyle(color: Colors.white, fontSize: 28),
            ),
          ),
        ),
      ),
    );
  }
}
