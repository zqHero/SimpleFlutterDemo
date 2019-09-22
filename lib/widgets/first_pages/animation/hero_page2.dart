import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HeroPage2 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new HeroPage2State();
  }
}

class HeroPage2State extends State<HeroPage2> {
  bool animationStart = false;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
        appBar: new AppBar(title: new Text("HeroPage2")),
        body: new Center(
          child: new GestureDetector(
            child: new Container(
              width: 300,
              height: 300,
              child: new Hero(
                tag: '第二章图片',
                child: Image.asset("lib/imgs/demo.jpg"),
              ),
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ));
  }
}
