//ios  风格组件
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CupertinoAlertDiaPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
//        leading: Icon(Icons.chevron_left),
        title: new Text("CupertinoAlertDialog"),
      ),
      body: new Center(
        child: CupertinoAlertDialog(
          title: Text('提示'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text("是否要删除？"),
                Text("一旦删除数据不可恢复"),
              ],
            ),
          ),
          actions: <Widget>[
            CupertinoDialogAction(
              child: Text("确认？"),
              onPressed: () {},
            ),
            CupertinoDialogAction(
              child: Text("取消？"),
              onPressed: () {},
            )
          ],
        ),
      ),
    );
  }
}
