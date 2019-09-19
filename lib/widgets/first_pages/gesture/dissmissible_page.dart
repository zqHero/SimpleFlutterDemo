import 'package:flutter/material.dart';
import 'package:flutterdemo/routes.dart';

class DissmissiblePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("DissmissiblePage"),
      ),
      body: new ListView.builder(
        itemCount: 30,
        itemBuilder: (context, index) {
          return new Dismissible(
              key: new Key("$index"),
              child: new Container(
                padding: EdgeInsets.only(top: 2),
                height: 45,
                child: new Container(
                  height: 45,
                  color: Colors.white,
                  child: new ListTile(
                    title: new Text("列表项$index"),
                  ),
                ),
              ));
        },
      ),
    );
  }
}
