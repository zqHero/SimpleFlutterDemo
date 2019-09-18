


import 'package:flutter/material.dart';

class TablePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("Table表格布局"),
        ),
      body: new Center(
        child: Table(
          //设置 表格 有多少列 并制定宽度
          columnWidths: const<int,TableColumnWidth>{
            0:FixedColumnWidth(100),
            1:FixedColumnWidth(40),
            2:FixedColumnWidth(80),
            3:FixedColumnWidth(80),
          },
          //设置  表格边框样式
          border: TableBorder.all(
            color: Colors.black38,width: 2.0,style: BorderStyle.solid
          ),

          children: const <TableRow>[
            //添加 第一行数据
            TableRow(
                children: <Widget>[
                  Text("姓名"),
                  Text("性别"),
                  Text("身高"),
                  Text("年龄"),
                ]
            ),
            TableRow(
                children: <Widget>[
                  Text("张三"),
                  Text("女"),
                  Text("170"),
                  Text("21"),
                ]
            ),
            TableRow(
                children: <Widget>[
                  Text("李四"),
                  Text("男"),
                  Text("180"),
                  Text("25"),
                ]
            )
          ],

        ),
      ),
    );
  }
}