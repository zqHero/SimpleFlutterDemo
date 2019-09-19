import 'package:flutter/material.dart';

//展示列表数据
final _items = <ListItem>[
  new ListItem("CupertinoActivityIndicator组件", "CupertinoActivityIndicator"),
  new ListItem("CupertinoAlertDialog组件", "CupertinoAlertDialog"),
  new ListItem("CupertinoButton组件", "CupertinoButton"),
  new ListItem("Cupertino导航组件集", "Cupertino"),
];

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new ListView(
      padding: new EdgeInsets.all(0),
//      children: getItemsWidgets(),
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
//                Navigator.push(
//                    context,
//                    new MaterialPageRoute(
//                        builder: (context) => new CupertinoActivityInPage()));
                  Navigator.pushNamed(context, "$route");
              },
            ),
          )));
    }
    return widgets;
  }
}

class ListItem {
  String title;
  String route;

  ListItem(this.title, this.route);
}
