import 'package:flutter/material.dart';

//百分比  布局
class FractionallySizedBoxPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("FractionallySizedBoxPage"),
      ),
      body: new Container(
        color: Colors.blueGrey, //父元素大小
        width: 200,
        height: 200,
        child: new FractionallySizedBox(
          alignment: Alignment.topLeft,

          widthFactor: 0.5,//宽度因子
          heightFactor: 1.5, //高度银子
          child: new Container(
            color: Colors.green,
          ),
        ),
      ),
    );
  }
}
