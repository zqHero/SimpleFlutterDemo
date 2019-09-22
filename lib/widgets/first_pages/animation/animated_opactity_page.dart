import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AnimatedOpactityPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new AnimatedOpactityPageState();
  }
}

class AnimatedOpactityPageState extends State<AnimatedOpactityPage> {
  bool animationStart = false;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(title: new Text("AnimatedOpactityPage")),
      body: new Center(
        child: new AnimatedOpacity(
          opacity: animationStart ? 1.0 : 0,
          duration: new Duration(seconds: 5),
          child: new Container(
            width: 300,
            height: 300,
            child: Image.asset("lib/imgs/demo.jpg"),
          ),
        ),
      ),
      floatingActionButton: new FloatingActionButton(
        child: new Text(animationStart ? "close" : "start"),
        onPressed: () {
          setState(() {
            animationStart = !animationStart;
          });
        },
      ),
    );
  }
}
