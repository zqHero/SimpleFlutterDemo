import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class ClipPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('ClipPage'),
      ),
      body:
      //裁剪为  自定义形状
      new ClipPath(
        clipper: CustomPathCliper(), //指定裁剪的 大小
        child: new SizedBox(
          width: 300,
          height: 300,
          child: new Image.asset(
            "lib/imgs/demo.jpg",
            fit: BoxFit.fitHeight,
          ),
        ),
      ),

          //裁剪为  矩形
//      new ClipRect(
//        clipper: RectClipper(), //指定裁剪的 大小
//        child: new SizedBox(
//          width: 300,
//          height: 300,
//          child: new Image.asset(
//            "lib/imgs/demo.jpg",
//            fit: BoxFit.fitHeight,
//          ),
//        ),
//      ),

          //圆角 矩形
//      new ClipRRect(
//        borderRadius: new BorderRadius.all(new Radius.circular(30)),
//        child: new SizedBox(
//          width: 300,
//          height: 300,
//          child: new Image.asset(
//            "lib/imgs/demo.jpg",
//            fit: BoxFit.fitHeight,
//          ),
//        ),
//      ),

      //圆形裁剪
//      new ClipOval(
//        child: new SizedBox(
//          width: 300,
//          height: 300,
//          child: new Image.asset(
//            "lib/imgs/demo.jpg",
//            fit: BoxFit.fitHeight,
//          ),
//        ),
//      ),
    );
  }
}


//根据 路径  进行 裁剪为自定义形状
class CustomPathCliper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    // TODO: implement getClip
    Path path = new Path();

    path.moveTo(0, 0);//起始点
    path.lineTo(300, 300);//终止点
    path.lineTo(300, 0);//终止点

    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return true;
  }
}



//裁剪为 矩形
class RectClipper extends CustomClipper<Rect> {
  //返回 大小
  @override
  Rect getClip(Size size) {
    // TODO: implement getClip
    return new Rect.fromLTRB(100, 100, size.width - 100, size.height - 100);
  }

  //是否重新裁剪
  @override
  bool shouldReclip(CustomClipper<Rect> oldClipper) {
    // TODO: implement shouldReclip
    return true;
  }
}
