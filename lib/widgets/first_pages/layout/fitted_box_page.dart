import 'package:flutter/material.dart';

class FittedBoxPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("FittedBoxPage缩放布局"),
      ),
      body: new Container(
        color: Colors.grey,
        width: 250,
        height: 250,
        child: new FittedBox(
//          fit: BoxFit.contain,//铺满  横向铺满
//          fit: BoxFit.cover, //放大
//          fit: BoxFit.fitWidth, //铺满宽度
//          fit: BoxFit.fitHeight, //铺满高度
//          fit: BoxFit.fill, //铺满高度  填充 不按照宽高比
          fit: BoxFit.none, //铺满高度  填充 不按照宽高比   不填充

          alignment: Alignment.topLeft,
          child: new Container(
            color: Colors.deepPurple,
            child: new Text("缩放布局"),
          ),
        ),
      ),
    );
  }
}
