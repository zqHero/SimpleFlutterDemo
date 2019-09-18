import 'package:flutter/material.dart';

class AspectRatioPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("AspectRatioPage"),
      ),
      body: new Container(
        height: 200,
        child: new AspectRatio(
          aspectRatio: 1, //TODO  调整宽高比
          child: new Container(
            color: Colors.green,
          ),
        ),
      ),
    );
  }
}
