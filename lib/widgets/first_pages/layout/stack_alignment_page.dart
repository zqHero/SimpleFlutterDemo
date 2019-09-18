import 'package:flutter/material.dart';

class StackAlignmentPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("StackAlignmentPage"),
      ),
      body: new Container(
        child: new Stack(
          alignment: Alignment.bottomRight,  //TODO 根据 aliment 定位   右下角对齐
          children: <Widget>[
            //底部 添加一个   头像
            new CircleAvatar(
              backgroundImage: new AssetImage("lib/imgs/运算符.jpg"),
              radius: 100,
            ),
            new Container(
              decoration: new BoxDecoration(color: Colors.black38),
              child: new Text(
                "==============",
                style: new TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}
