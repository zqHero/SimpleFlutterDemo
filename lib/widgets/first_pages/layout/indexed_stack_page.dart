import 'package:flutter/material.dart';

class IndexedStackPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("IndexedStackPage"),
      ),
      body: new Container(
        child: new IndexedStack(
          index: 1,   //只显示 索引值指向的  子元素
          children: <Widget>[
            //底部 添加一个   头像
            new CircleAvatar(
              backgroundImage: new AssetImage("lib/imgs/运算符.jpg"),
              radius: 100,
            ),

            //设置定位 布局
            new Positioned(
                bottom: 20,
                left: 50,
                child: new Text(
                  "==================",
                  style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'serif',
                      color: Colors.black38),
                ))
          ],
        ),
      ),
    );
  }
}
