import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterdemo/widgets/first_pages/animation/hero_page2.dart';

class HeroPage1 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new HeroPage1State();
  }
}

class HeroPage1State extends State<HeroPage1> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(title: new Text("HeroPage1")),
      body: new Center(
        child: new GestureDetector(
          child: new Container(
            width: 300,
            height: 300,
            child: new Hero(
              tag: '第一章图片',
              child: Image.asset("lib/imgs/demo.jpg"),
            ),
          ),
          onTap: () {
            Navigator.push(
              context,
              new MaterialPageRoute(builder: (_) {
                return new HeroPage2();
              }),
            );
          },
        ),
      ),
    );
  }
}
