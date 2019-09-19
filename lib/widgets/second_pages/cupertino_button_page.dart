//ios  风格组件
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CupertinoButtonPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
//        leading: Icon(Icons.chevron_left),
        title: new Text("CupertinoButton"),
      ),
      body: new Center(
        child: CupertinoButton(
          child: Text("cupertinoButton"),
          color: Colors.blue,
          onPressed: () {},
        ),
      ),
    );
  }
}
