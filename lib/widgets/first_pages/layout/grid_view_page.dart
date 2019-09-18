import 'package:flutter/material.dart';

class GridViewPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("GridView"),
      ),
      body: new Center(
        child: buildGrid(),
      ),
    );
  }

  buildGrid() {
    return new GridView.extent(
      maxCrossAxisExtent: 150, //次轴的宽度
      padding: EdgeInsets.all(4), //上下左右   内边距
      mainAxisSpacing: 4,//主轴间隙
      //自动生成 列表
      children: new List<Container>.generate(19, (int index)=>new Container(
        child: new Image.asset("lib/imgs/运算符.jpg"),
      )),
    );
  }
}

