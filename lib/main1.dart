// 常用组件介绍：

import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp6());

//================表单组件  需要继承自  stateful 组件=================================
class MyApp6 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new LoginPageState();
  }
}

//登陆 状态类
class LoginPageState extends State<MyApp6> {
  //全局  的key   用于获取   form表单组件
  GlobalKey<FormState> loginKey = new GlobalKey<FormState>();

  //用户名：
  String userName;
  String password;

  void login() {
    var loginForm = loginKey.currentState;

    //验证  表单：
    if (loginForm.validate()) {
      loginForm.save();
      print('userName: =======userName==' +
          userName +
          "========password=" +
          password);
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
        title: "Form 表单示例",
        home: new Scaffold(
            appBar: new AppBar(
              title: new Text("form 表单示例"),
            ),
            body: new Column(
              children: <Widget>[
                new Container(
                  padding: EdgeInsets.all(16),
                  child: new Form(
                    key: loginKey,
                    child: new Column(
                      children: <Widget>[
                        new TextFormField(
                          decoration: new InputDecoration(
                            labelText: "请输入用户名",
                          ),
                          onSaved: (value) {
                            userName = value;
                          },
                          onFieldSubmitted: (value) {
                            print("====onFieldSubmitted===账号==");
                          },
                        ),
                        new TextFormField(
                          decoration: new InputDecoration(
                            labelText: "请输入密码",
                          ),
                          obscureText: true,
                          onSaved: (value) {
                            password = value;
                          },
                          validator: (value) {
                            return value.length < 6 ? "密码长度不够6" : null;
                          },
                          onFieldSubmitted: (value) {
                            print("====onFieldSubmitted=密码=");
                          },
                        )
                      ],
                    ),
                  ),
                ),
                new SizedBox(
                  width: 340,
                  height: 42,
                  child: new RaisedButton(
                    onPressed: login,
                    child: new Text(
                      '登录',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                )
              ],
            )));
  }
}

//============网格列表 组件=======================================================
class MyApp5 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      title: "网格式列表",
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text("网格式列表"),
        ),
        body: new GridView.count(
          primary: false,
          //四周  增加一定的偏移量
          padding: const EdgeInsets.all(20.0),
          crossAxisCount: 3, //每列展示数据
          children: <Widget>[
            const Text("item + 0"),
            const Text("item + 1"),
            const Text("item + 2"),
            const Text("item + 3"),
            const Text("item + 4"),
            const Text("item + 5"),
            const Text("item + 6"),
            const Text("item + 7"),
            const Text("item + 8"),
            const Text("item + 9"),
            const Text("item + 0"),
          ],
        ),
      ),
    );
  }
}

//展示 一个  水平列表组件: ====================================================
class MyApp4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      title: "一个水平的列表组件",
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text("水平列表组件"),
        ),
        body: new Center(
          child: new Container(
            margin: EdgeInsets.symmetric(vertical: 20.0), //偏移量
            height: 200,
            child: new ListView(
              //设置   水平方向排列：
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                new Container(
                  width: 160,
                  color: Colors.blue,
                ),
                new Container(
                  width: 160,
                  color: Colors.green,
                ),
                new Container(
                  width: 160,
                  color: Colors.orange,
                ),
                new Container(
                  width: 160,
                  color: Colors.grey,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

//展示 一个垂直列表组件: ====================================================
class MyApp3 extends StatelessWidget {
  // 创建 一个  长列表;
  @override
  Widget build(BuildContext context) {
    //自动 生成数据
//    List<String> items = new List<String>.generate(500, (i) => "ListItem==$i");

    List<String> items = [];
    for (var i = 0; i < 500; i++) {
      items.add("======item====$i");
    }

    // TODO: implement build
    return new MaterialApp(
      title: "展示一个列表组建",
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text("垂直列表展示"),
        ),
        body: new Center(
            child: new Container(
                child:
//              普通  短列表组建
//              new ListView(
//                children: <Widget>[
//                  new Text("能不能作为header"),
//                  ListTile(
//                    leading: Icon(Icons.phone),
//                    title: new Text("item0"),
//                  ),
//                  ListTile(
//                    leading: Icon(Icons.phone),
//                    title: new Text("item1"),
//                  ),
//                ],
//              ),
                    //长列表 组件
                    new ListView.builder(
          //列表长度
          itemCount: items.length,
          //列表项 构造器;
          itemBuilder: (context, index) {
            return new ListTile(
              leading: new Icon(Icons.phone),
              title: new Text("${items[index]}"),
            );
          },
        ))),
      ),
    );
  }
}

//文本组件========图片组件============================================================
class MyApp2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //创建一个  列表数组
    var listWidgets = <Widget>[];
    for (var i = 0; i < 5; i++) {
      listWidgets.add(new ListTile(
        leading: new Icon(Icons.computer),
        title: new Text("item+====== $i"),
      ));
    }

    // TODO: implement build
    return new MaterialApp(
      title: "文本组件示例",
      home: new Scaffold(
        appBar: new AppBar(
//          leading: new Icon(Icons.computer),
          title: new Text("组件示例"),
        ),
        body: new Column(
          children: <Widget>[
            //凸起  按钮组件：
            new RaisedButton(
                child: new Text(
                  "凸起的按钮",
                  style: new TextStyle(color: Colors.blue),
                ),
                onPressed: () {
                  print("按下了 按钮");
                }),
            //图标按钮  组件
            new IconButton(
                icon: new Icon(
                  Icons.volume_up,
                  size: 50,
                ),
                tooltip: "按下操作", // 长按提示语
                onPressed: () {
                  print('按下操作');
                }),
//        图片组件=
            new Image.network(
              'https://www.baidu.com/img/bd_logo1.png',
//              填充模式：
              fit: BoxFit.fitWidth, // 显示可能拉伸  可能 裁剪    宽度充满
//            fit: BoxFit.none,// 原图显示 无需填充
            ),
            new Icon(
              Icons.phone,
              color: Colors.green,
              size: 100,
            ),
            //图标以及按钮组件
            new Text(
              "这是要展示的字体样式",
              style: new TextStyle(
                color: const Color(0xffff0000),
//                decoration: TextDecoration.lineThrough,  //添加一个   删除线
                decoration: TextDecoration.underline,
                //添加一个  下划线
                decorationColor: const Color(0xff000000),
                //删除线的颜色
                fontSize: 25.0,
                //字体大小
                fontStyle: FontStyle.italic,
                //斜体
//                fontStyle: FontStyle.normal  //正常
                fontWeight: FontWeight.bold,
                //加粗
                letterSpacing: 6.0, //字体间距
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//=======================容器组件示例=============================================
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    var App = new MaterialApp(
      title: "组件介绍",
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text("容器组件示例"),
        ),
        body: new Center(
          //添加  容器
          child: Container(
            width: 200,
            height: 200,
            //绘制在  child后面的装饰
            foregroundDecoration: new BoxDecoration(),
            decoration: BoxDecoration(
                color: Colors.white,
                border: new Border.all(
                    color: Colors.grey, //边框颜色
                    width: 8.0 //边框粗细
                    ),
                borderRadius:
                    const BorderRadius.all(const Radius.circular(8.0)) //边框的弧度
                ),
            child: new Text(
              'flutter',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 28.0),
            ),
          ),
        ),
      ),
    );
    return App;
  }
}
