import 'package:flutter/material.dart';

class SizedBoxPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("SizedBoxPage"),
      ),
      body: new SizedBox(
        width: 200,
        height: 300,
        child:Card(
          child: Text(
            "========SizedBox===",
            style: TextStyle(fontSize: 16),
          ),
        ),
      ),
    );
  }
}
