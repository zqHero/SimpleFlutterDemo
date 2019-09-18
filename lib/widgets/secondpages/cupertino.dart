//ios  风格组件
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//导航集  组件
class CupertinoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: "Cupertino导航组件集",
      theme: ThemeData(primarySwatch: Colors.blue),
      home: MyPage(),
    );
  }
}

class MyPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new HomrPageState();
  }
}

class HomrPageState extends State<MyPage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new CupertinoTabScaffold(
        tabBar: CupertinoTabBar(
          backgroundColor: CupertinoColors.lightBackgroundGray,
          items: [
            BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.home), title: Text("主页")),
            BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.conversation_bubble),
                title: Text("聊天"))
          ],
        ),
        tabBuilder: (context, index) {
          return CupertinoTabView(
            builder: (context) {
              switch (index) {
                case 0:
                  return HomeP();
                case 1:
                  return ChatP();
                default:
                  return new Container();
              }
            },
          );
        });
  }
}

class ChatP extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Container(
        child: new Center(
      child: new Text("聊天界面"),
    ));
  }
}

class HomeP extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new CupertinoPageScaffold(
      child: new Container(
          child: new Center(
        child: new Text("主页"),
      )),
      navigationBar: CupertinoNavigationBar(
        //导航栏
        backgroundColor: Colors.blue,
        middle: new Text("主界面"),
        trailing: Icon(CupertinoIcons.add), // 右侧 按钮
        leading: Icon(CupertinoIcons.back), //左侧按钮
      ),
    );
  }
}
