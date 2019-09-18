//路由的 使用  和处理
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'widgets/home_page.dart';

void main() => runApp(MyApp3());

class MyApp3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      home: HomePage(),
    );
  }
}

//tabbar  测试：======================================================================================
class MyApp2 extends StatelessWidget {
  final List<Tab> myTabs = <Tab>[
    Tab(
      text: '选项卡1',
    ),
    Tab(
      text: '选项卡2',
    )
  ];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      home: DefaultTabController(
        length: myTabs.length,
        child: Scaffold(
          appBar: new AppBar(
            title: new Text("tabBar Demo"),
            bottom: TabBar(
              //导航栏
              tabs: myTabs,
            ),
          ),
          body: TabBarView(
            children: <Widget>[
              new Center(
                child: new Text("选项卡1111"),
              ),
              new Center(
                child: new Text("选项卡222"),
              )
            ],
          ),
        ),
      ),
    );
  }
}

//====BottomNavigationBar 底部导航栏组件======================================
class MyApp1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      home: Scaffold(
        body: BottomNavBarPage(),
      ),
    );
  }
}

class BottomNavBarPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => BottomNavBarPageState();
}

class BottomNavBarPageState extends State<BottomNavBarPage> {
  int selectedIndex = 1; //当前选中索引项
  final widgetOptions = [
    Text('Index 0 : 信息'),
    Text('Index 0 : 通讯录'),
    Text('Index 0 : 发现')
  ];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: AppBar(
        title: Text("BottomNavBar示例"),
      ),
      body: Center(
        child: widgetOptions.elementAt(selectedIndex), //居中显示  某一个文本
      ),
      bottomNavigationBar: BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: Icon(Icons.chat), title: Text("信息")),
            BottomNavigationBarItem(
                icon: Icon(Icons.contacts), title: Text("通讯录")),
            BottomNavigationBarItem(
                icon: Icon(Icons.account_circle), title: Text("发现")),
          ],
          currentIndex: selectedIndex,
          fixedColor: Colors.deepPurple,
          onTap: (index) {
            setState(() {
              selectedIndex = index;
            });
          }),
    );
  }
}

//路由的使用==============bottomNavigationBar的使用===============================
var routes = {
  "first": (BuildContext context) => FirstPage(), //添加路由1
  "second": (BuildContext context) => SecondPage(), //添加路由1
};

//初始化  路由  和第一个页面
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      theme: new ThemeData(primarySwatch: Colors.blue),
      home: new HomePage(),
      title: "路由的使用",

//  设置 路由      路由的优先级  高于 home
//      routes: routes,
//      initialRoute: "first",
    );
  }
}

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      title: "第二个界面",
      home: new Scaffold(
        appBar: new AppBar(title: new Text("这是第二个界面")),
        body: new RaisedButton(
          child: new Text("点击结束这个界面"),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}

class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      title: "第一个界面",
      home: new Scaffold(
        appBar: new AppBar(title: new Text("这是第一个界面")),
        body: new RaisedButton(
          child: new Text("点击跳转到第二个界面"),
          onPressed: () {
            Navigator.pushNamed(context, "second");
          },
        ),
      ),
    );
  }
}

