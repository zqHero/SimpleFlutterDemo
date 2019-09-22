import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CanvasPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("CanvasPage"),
      ),
      body: new SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: 10),
          child: new Column(
            children: <Widget>[
              SizedBox(
                width: 200,
                child: CustomPaint(
                  painter: LinePainter(),
                ),
              ),
              //绘制 圆形
              SizedBox(
                width: 200,
                height: 200,
                child: CustomPaint(
                  painter: CirclePainter(),
                ),
              ),
              //绘制  椭圆
              SizedBox(
                width: 200,
                height: 200,
                child: CustomPaint(
                  painter: OvalPainter(),
                ),
              ),
              //绘制  圆角 矩形
              SizedBox(
                width: 200,
                height: 200,
                child: CustomPaint(
                  painter: ReactAndRadiusPainter(),
                ),
              ),
              //绘制 多个点：
              SizedBox(
                width: 200,
                height: 200,
                child: CustomPaint(
                  painter: PointesPainter(),
                ),
              ),
              //绘制圆弧
              SizedBox(
                width: 200,
                height: 200,
                child: CustomPaint(
                  painter: CircleLPainter(),
                ),
              ),
              //绘制  路径 Path
              SizedBox(
                width: 200,
                height: 200,
                child: CustomPaint(
                  painter: PathPainter(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//绘制 路径PATH
class PathPainter extends CustomPainter {
  Paint _paint = new Paint()
  ..color = Colors.grey
  ..strokeCap = StrokeCap.round
  ..isAntiAlias = true
  ..strokeWidth  = 2
  ..style = PaintingStyle.stroke;
  @override
  void paint(Canvas canvas, Size size) {
    // TODO: implement paint
    //定义 画笔：
    Path path = new Path()..moveTo(0, 0);
    path.lineTo(50, 50);
    path.lineTo(50, 0);
    path.lineTo(0, 50);
    path.lineTo(50, 50);

    canvas.drawPath(path, _paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return false;
  }
}

//绘制  半圆  圆弧
class CircleLPainter extends CustomPainter {
  Paint _paint = new Paint()
  ..color = Colors.grey
  ..strokeCap = StrokeCap.round
  ..isAntiAlias = true
  ..strokeWidth = 2
  ..style = PaintingStyle.stroke;

  @override
  void paint(Canvas canvas, Size size) {
    // TODO: implement paint
    //绘制圆弧
    const PI = 3.1415926;
    //定义矩形
    Rect rect1 = Rect.fromCircle(center: Offset(40,0),radius: 50);
    //画  1/2 PI    弧度的圆弧：
    canvas.drawArc(rect1, 0, PI/2, true, _paint);

    //定义矩形
    Rect rect2 = Rect.fromCircle(center: Offset(50,80),radius: 50);
    canvas.drawArc(rect2, 0, PI, true, _paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return false;
  }
}

//绘制 多个点
class PointesPainter extends CustomPainter {
  //定义画笔
  Paint _paint = new Paint()
    ..color = Colors.grey
    ..strokeCap = StrokeCap.square  //round 为 圆形
    ..isAntiAlias = true
    ..strokeWidth = 20
    ..style = PaintingStyle.fill;

  @override
  void paint(Canvas canvas, Size size) {
    // TODO: implement paint
    canvas.drawPoints(
      //PointMode 的枚举 类型有三个：
      PointMode.points,
      [
         Offset(10,0),
         Offset(30,20),
         Offset(50,30),
         Offset(70,20),
         Offset(90,0),
      ],
      _paint..color = Colors.grey,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    // TODO: f shouldRepaint
    return false;
  }
}

//矩形  边角带有 弧度的
class ReactAndRadiusPainter extends CustomPainter {
//定义  画笔
  Paint _paint = new Paint()
    ..color = Colors.black38
    ..strokeCap = StrokeCap.square
    ..isAntiAlias = true
    ..strokeWidth = 3.0
    ..style = PaintingStyle.stroke;

  @override
  void paint(Canvas canvas, Size size) {
    //中心点  坐标为200，  200 边长为100
    Rect rect = Rect.fromCircle(center: Offset(50, 0), radius: 50);
    //根据  矩形创建一个  角度为 20的 圆角矩形
    RRect rrect = RRect.fromRectAndRadius(rect, Radius.circular(10));
    //开始  绘制圆角矩形
    canvas.drawRRect(rrect, _paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return false;
  }
}

//绘制  椭圆
class OvalPainter extends CustomPainter {
  //定义  画笔
  Paint _paint = new Paint()
    ..color = Colors.black38
    ..strokeCap = StrokeCap.square
    ..isAntiAlias = true
    ..strokeWidth = 3.0
    ..style = PaintingStyle.stroke;

  @override
  void paint(Canvas canvas, Size size) {
    // TODO: implement paint
    Rect rect = Rect.fromPoints(Offset(0, 0), Offset(100, 50));
    canvas.drawOval(rect, _paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return false;
  }
}

// 绘制圆：
class CirclePainter extends CustomPainter {
  //定义  画笔
  Paint _paint = new Paint()
    ..color = Colors.black38
    ..strokeCap = StrokeCap.square
    ..isAntiAlias = true
    ..strokeWidth = 3.0
    ..style = PaintingStyle.stroke;

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawCircle(Offset(50, 100), 50, _paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return false;
  }
}

// 绘制  直线
class LinePainter extends CustomPainter {
  //定义  画笔
  Paint _paint = new Paint()
    ..color = Colors.black38
    ..strokeCap = StrokeCap.square
    ..isAntiAlias = true
    ..strokeWidth = 3.0
    ..style = PaintingStyle.stroke;

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawLine(Offset(0, 0), Offset(100, 0), _paint); //宽度 设置为不固定
  }

  // 是否需要 重新绘制
  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return false;
  }
}
