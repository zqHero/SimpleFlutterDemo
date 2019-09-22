import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RotatedBoxPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("RotatedBoxPage"),
      ),
      body: RotatedBox(
        quarterTurns: 1, //旋转次数
        child: Text(
          '旋转示例',
          style: TextStyle(fontSize: 28),
        ),
      ),
    );
  }
}
