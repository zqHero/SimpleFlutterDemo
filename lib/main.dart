import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'routes.dart';

void main() => runApp(MyApp());

//Material 路由

//Cupertino 跳转路由：
final Map<String, WidgetBuilder> routes = {
  "HomePage": (context) => HomePage(),

  "CupertinoActivityIndicator": (context) => CupertinoActivityInPage(),
  "CupertinoAlertDialog": (context) => CupertinoAlertDiaPage(),
  "CupertinoButton": (context) => CupertinoButtonPage(),
  "Cupertino": (context) => CupertinoPage(),

  //Widget 基础组件：
  "LoadingJsonAssetsPage": (context) => LoadingJsonAssetsPage(),

  //Layout 中 引用路由：
  "GridViewPage": (context) => GridViewPage(),
  "TablePage": (context) => TablePage(),

  "AlignPage": (context) => AlignPage(),
  "FittedBoxPage": (context) => FittedBoxPage(),
  "StackAlignmentPage": (context) => StackAlignmentPage(),
  "StackPositionedPage": (context) => StackPositionedPage(),
  "IndexedStackPage": (context) => IndexedStackPage(),
  "OverflowBoxPage": (context) => OverflowBoxPage(),

  "SizedBoxPage": (context) => SizedBoxPage(),
  "ConstranedBoxPage": (context) => ConstranedBoxPage(),
  "LimitedBoxPage": (context) => LimitedBoxPage(),
  "AspectRatioPage": (context) => AspectRatioPage(),
  "FractionallySizedBoxPage": (context) => FractionallySizedBoxPage(),

  "WrapPage": (context) => WrapPage(),
  "AllLayoutDemoPage": (context) => AllLayoutDemoPage(),

  //gesture 组件
  "GestureDetectorPage": (context) => GestureDetectorPage(),
  "DissmissiblePage": (context) => DissmissiblePage(),

  // decorated 装饰组件
  "OpacityPage": (context) => OpacityPage(),
  "DecoratedBoxPage": (context) => DecoratedBoxPage(),
  "RotatedBoxPage": (context) => RotatedBoxPage(),
  "ClipPage": (context) => ClipPage(),
  "CanvasPage": (context) => CanvasPage(),

  //Animation 动画组件
  "AnimatedOpactityPage": (context) => AnimatedOpactityPage(),
  "HeroPage1": (context) => HeroPage1(),

  //sdk
  "ChatPage": (context) => ChatPage(),
  "SearchPage": (context) => SearchPage(),
};

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "App",
      theme: new ThemeData(
        platform: TargetPlatform.iOS,
        primaryColor: Colors.green,
        scaffoldBackgroundColor: Color(0xffebebeb),
      ),
      home: new LoadingPage(),
      routes: routes,
    );
  }
}
