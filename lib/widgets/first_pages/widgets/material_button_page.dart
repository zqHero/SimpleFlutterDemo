import 'package:flutter/material.dart';

//百分比  布局
class AlertDialogPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("AlertDialogPage"),
      ),
      body: new MaterialButton(
        color: Colors.blue,
        child: new Text('AlertDialog'),
        onPressed: () {
          showDialog<Null>(
            context: context,
            barrierDismissible: false,
            builder: (BuildContext context) {
              return new AlertDialog(
                title: new Text('标题'),
                content: new SingleChildScrollView(
                  child: new ListBody(
                    children: <Widget>[
                      new Text('内容 1'),
                      new Text('内容 2'),
                    ],
                  ),
                ),
                actions: <Widget>[
                  new FlatButton(
                    child: new Text('确定'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              );
            },
          ).then((val) {
            print(val);
          });
        },
      ),
    );
  }
}
