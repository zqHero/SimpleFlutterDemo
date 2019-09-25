import 'package:flutter/material.dart';

class LoadingPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new LoadingPageState();
  }
}

class LoadingPageState extends State<LoadingPage> {
  @override
  void initState() {
    // TODO: implement initState 延时3 秒打开主界面
    new Future.delayed(Duration(seconds: 3), () {
      //回调函数
      Navigator.pushReplacementNamed(context, "HomePage");
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Container(
      color: Colors.white,
      child: Image.asset(
        "lib/imgs/flutter.jpg",
        fit: BoxFit.fitWidth,
      ),
    );
  }
}
