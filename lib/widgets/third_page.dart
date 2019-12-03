import 'package:flutter/material.dart';

class ThirdPage extends StatelessWidget {
  List<_ListItem> _items = <_ListItem>[
    new _ListItem("chatDemo", "ChatPage"),  //聊天界面
    new _ListItem("redux", "ReduxPage"),  //Redux 的使用
  ];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new ListView(
      children: getItemsWidgets(context),
    );
  }

  getItemsWidgets(BuildContext context) {
    var widgets = <Widget>[];
    for (var i = 0; i < _items.length; i++) {
      String title = _items[i].title;
      String route = _items[i].route;
      widgets.add(new Container(
          color: Colors.grey[300],
          padding: EdgeInsets.only(top: 0.5),
          child: new Container(
            color: Colors.white,
            child: new ListTile(
              title: new Text("$title"),
              trailing: Icon(Icons.keyboard_arrow_right), //选中项
              dense: true,
              onTap: () {
                Navigator.pushNamed(context, "$route");
              },
            ),
          )));
    }
    return widgets;
  }
}

class _ListItem {
  String title;
  String route;

  _ListItem(this.title, this.route);
}
