import 'package:flutter/material.dart';
import 'package:flutterdemo/routes.dart';

class GestureDetectorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("GestureDetectorPage"),
      ),
      body: new Center(
        child: new GestureDetector(
          onTapDown: (detail) {
            ToastUtil.toast(context, "点击事件"); //点击屏幕立即出发 此方法
          },
          onTapUp: (detail) {
            ToastUtil.toast(context, "手指离开屏幕"); //手指离开屏幕  触发此方法
          },
          onTap: () {
            ToastUtil.toast(context, "一次 tap事件");
          },
          onDoubleTap: () {
            ToastUtil.toast(context, "双击事件");
          },
          onLongPress: () {
            ToastUtil.toast(context, "长按事件");
          },
          onVerticalDragStart: (fun) {
            ToastUtil.toast(context, "垂直拖动，");
          },
          onHorizontalDragStart: (fun){
            ToastUtil.toast(context, "水平拖动，");
          },
          child: new Container(
            padding: new EdgeInsets.all(12),
            decoration: new BoxDecoration(
                color: Theme.of(context).buttonColor,
                borderRadius: new BorderRadius.circular(10)),
            child: new Text(
              "测试按钮",
              style: TextStyle(
                fontSize: 12,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
