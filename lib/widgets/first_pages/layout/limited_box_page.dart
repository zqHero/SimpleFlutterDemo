import 'package:flutter/material.dart';

class LimitedBoxPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("LimitedBoxPage"),
      ),
      body: new Row(
        children: <Widget>[
          Container(
            color: Colors.grey,
            width: 100,
          ),
          LimitedBox(
            maxWidth: 150, //设置 最大  宽度 限制 子元素在此范围内
            child: Container(
              color: Colors.green,
              width: 250,
            ),
          )
        ],
      ),
    );
  }
}
