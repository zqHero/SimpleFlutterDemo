import 'package:flutter/material.dart';

class DecoratedBoxPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("DecoratedBoxPage"),
      ),
      body: new Center(
        child: new Container(
          width: 300,
          height: 300,
          decoration: BoxDecoration(
            //添加 边框
            border: Border.all(color: Colors.black38, width: 3),
            borderRadius: BorderRadius.circular(20),

            //添加阴影
            boxShadow: <BoxShadow>[
              new BoxShadow(
                color: Colors.blueGrey,
                blurRadius: 8, //模糊值
                spreadRadius: 8, //扩展 阴影半径
                offset: Offset(4, 5), //x和y  偏移量
              )
            ],

            //渐变处理：线性渐变
            gradient: new LinearGradient(
              begin: FractionalOffset(0.5, 0),
              end: FractionalOffset(1, 1),
              colors: <Color>[Colors.red, Colors.red, Colors.grey, Colors.blue],
            ),
            color: Colors.grey,

//              image: DecorationImage(
//                image: ExactAssetImage('lib/imgs/demo.jpg'),
//                fit: BoxFit.cover, //填充
//              ),

          ),
        ),
      ),
    );
  }
}
