//ios  风格组件
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CupertinoActivityInPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
//        leading: Icon(Icons.chevron_left),
        title: new Text("CupertinoActivityIndicator"),
      ),
      body: new Center(
          child: CupertinoActivityIndicator(
            radius: 60.0,
          ),
      ),
    );
  }
}
