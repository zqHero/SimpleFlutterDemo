import 'package:flutter/material.dart';

//百分比  布局
class WrapPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("WrapPage"),
      ),
      body: new Wrap(
        spacing: 8.0,
        runSpacing: 4.0,
        children: <Widget>[
          Chip(
              avatar: CircleAvatar(
                backgroundColor: Colors.blueGrey,
                child: new Text("西门", style: TextStyle(fontSize: 8)),
              ),
              label: Text("西门吹雪")),
          Chip(
              avatar: CircleAvatar(
                backgroundColor: Colors.blueGrey,
                child: new Text("萧十", style: TextStyle(fontSize: 8)),
              ),
              label: Text("萧十一郎")),
          Chip(
              avatar: CircleAvatar(
                backgroundColor: Colors.blueGrey,
                child: new Text("欧阳", style: TextStyle(fontSize: 8)),
              ),
              label: Text("欧阳西毒")),
          Chip(
              avatar: CircleAvatar(
                backgroundColor: Colors.blueGrey,
                child: new Text("青翼", style: TextStyle(fontSize: 8)),
              ),
              label: Text("青翼蝠王")),
        ],
      ),
    );
  }
}
