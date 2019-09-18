import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class ConstranedBoxPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("ConstranedBoxPage"),
      ),
      body: new ConstrainedBox(
        constraints: const BoxConstraints(
            minWidth: 150, maxWidth: 200, maxHeight: 150, minHeight: 100),
        child: Container(
          width: 300,
          height: 300,
          color: Colors.green,
        ),
      ),
    );
  }
}
