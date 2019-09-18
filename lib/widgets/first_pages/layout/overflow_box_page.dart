import 'package:flutter/material.dart';

class OverflowBoxPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("OverflowBoxPage"),
      ),
      body: new Container(
        color: Colors.green,
        width: 200,
        height: 200,
        padding: EdgeInsets.all(20),
        child: new OverflowBox(
          alignment: Alignment.topLeft,
          maxWidth: 400,
          maxHeight: 400,
          child: Container(
            color: Colors.blueGrey,
            width: 300,
            height: 300,
          ),
        ),
      ),
    );
  }
}
