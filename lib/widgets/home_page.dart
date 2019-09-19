import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as prefix0;
import '../routes.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  num bottomNavIndex = 0;
  List<String> tabBarTxts = ["Material", "Cupertino", "Chat", "Others"];
  List<String> bottomBarTxt = ["Material", "Cupertino", "聊天", "其他"];

  bool showDialog = false;
  GlobalKey<ScaffoldState> _homeScaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ConstrainedBox(
        constraints: BoxConstraints.expand(),
        child: new Scaffold(
          key: _homeScaffoldKey,
          appBar: new AppBar(
            title: new Text(tabBarTxts[bottomNavIndex]),
            actions: <Widget>[
              createPopMenus(context),
            ],
          ),
          body: new Center(
            child: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                getBody(bottomNavIndex),
//                Offstage(
//                  offstage:showDialog,
//                  child: getSimpleDialog(),
//                ),
              ],
            ),
          ),
          bottomNavigationBar:
//          getBottomNavBar(),  //两种方式实现 navTabBar
              BottomAppBar(
            color: Colors.white,
            shape: CircularNotchedRectangle(),
            child: Row(
              children: <Widget>[
                createBottomBar(0, Icons.home),
                createBottomBar(1, Icons.print),
                SizedBox(),
                createBottomBar(2, Icons.chat),
                createBottomBar(3, Icons.business),
              ],
              mainAxisAlignment: MainAxisAlignment.spaceAround,
            ),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          floatingActionButton: createFAB(),
          drawer: createDrawer(),
        ));
  }

  //根据  选中项  加载不同的itemView
  getBody(num bottomNavIndex) {
    switch (bottomNavIndex) {
      case 0:
        return FirstPage();
      case 1:
        return SecondPage();
      case 2:
        return ThirdPage();
      case 3:
        return ForthPage();
    }
  }

  // 构建一个  抽屉
  Widget createDrawer() {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero, //避免 listView 导致drawer 不能沉浸
        children: <Widget>[
          //头像
          UserAccountsDrawerHeader(
            accountName: new Text("zhaoq"),
            accountEmail: new Text("https://blog.csdn.net/u013233097"),
            currentAccountPicture: ClipOval(
              child: SizedBox(
                width: 80.0,
                height: 80.0,
                child: Image.network(
                    'https://avatar.csdn.net/C/D/F/3_u013233097.jpg',
                    fit: BoxFit.fill),
              ),
            ),
            onDetailsPressed: () {},
          ),

          ListTile(
              leading: new CircleAvatar(child: Icon(Icons.color_lens)),
              title: Text("切换皮肤")),
          ListTile(
              leading: new CircleAvatar(child: Icon(Icons.photo)),
              title: Text("我的相册")),
          ListTile(
              leading: new CircleAvatar(child: Icon(Icons.wifi)),
              title: Text("设置")),
        ],
      ),
    );
  }

//popMenu
  Widget createPopMenus(BuildContext context) {
    return PopupMenuButton<ConferenceItem>(
      tooltip: "actions",
      offset: Offset(0, 45),
      onSelected: (ConferenceItem selectedItem) {
        if (selectedItem.index == 0) {
          //弹出  alertDialog
          prefix0
              .showDialog(
            context: context,
            barrierDismissible: true,
            builder: (BuildContext context) {
              return new AlertDialog(
                title: new Text('AlertDialog'),
                content: new SingleChildScrollView(
                  child: new ListBody(
                    children: <Widget>[
                      new Text('this is alert content ?'),
                    ],
                  ),
                ),
                actions: <Widget>[
                  new FlatButton(
                    child: new Text('cancel'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  new FlatButton(
                    child: new Text('sure'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              );
            },
          )
              .then((val) {
            print(val);
          });
        } else if (selectedItem.index == 1) {
          //弹出 SimpleDialog
          prefix0
              .showDialog(
            context: context,
            barrierDismissible: true,
            builder: (BuildContext context) {
              return new SimpleDialog(
                title: new Text('SmpleDialog'),
                children: <Widget>[
                  new SimpleDialogOption(
                    child: new Text('item1'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  new SimpleDialogOption(
                    child: new Text('item1'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              );
            },
          )
              .then((val) {
            print(val);
          });
        } else if (selectedItem.index == 2) {
          //show SnackBar  TODO    为什么bug==================================
          _homeScaffoldKey.currentState.showSnackBar(new SnackBar(
            duration: Duration(seconds: 2),
            content: new Text("this is a snackBar"),
          ));
        }
      },
      itemBuilder: (BuildContext context) {
        return <PopupMenuEntry<ConferenceItem>>[
          const PopupMenuItem(
              child: Text("AlertDialog"), value: ConferenceItem.AlertDialog),
          const PopupMenuItem(
              child: Text("SimpleDialog"), value: ConferenceItem.SimpleDialog),
          const PopupMenuItem(
              child: Text("SnackBar"), value: ConferenceItem.SnackBar),
        ];
      },
    );
  }

  //创建一个  floatingActionButton
  Widget createFAB() {
    return new Builder(builder: (context) {
      return new FloatingActionButton(
          child: const Icon(Icons.add),
          shape: new CircleBorder(),
          mini: false,
          elevation: 7,
          //未点击  阴影值
          highlightElevation: 14,
          //点击阴影值
          isExtended: false,
          onPressed: () {
            ToastUtil.toast(context, "this is a simple app about flutter");
          });
    });
  }

  //创建   底部 bottom
  Widget createBottomBar(int index, IconData icon) {
    var color = index == bottomNavIndex ? Colors.blue : Colors.black54;
    return new InkWell(
      child: new Stack(
        alignment: Alignment.center,
        children: <Widget>[
          IconButton(
            icon: Icon(icon, color: color),
          ),
          Positioned(
            top: 33,
            child: new Text(bottomBarTxt[index],
                style: new TextStyle(fontSize: 11, color: color)),
          ),
        ],
      ),
      onTap: () {
        setState(() {
          bottomNavIndex = index;
        });
      },
    );
  }

  //返回一个 dialog
  Widget getSimpleDialog() {
    return SimpleDialog(
      title: const Text("A SimpleDialog"),
      children: <Widget>[
        SimpleDialogOption(
          onPressed: () {
            setState(() {
              showDialog = false;
            });
          },
          child: Text("item0==="),
        ),
        SimpleDialogOption(
          onPressed: () {
            setState(() {
              showDialog = false;
            });
          },
          child: Text("item1==="),
        ),
      ],
    );
  }

//创建一个 BottomBar  暂未使用
//  Widget getBottomNavBar() {
//    return BottomNavigationBar(
//      currentIndex: bottomNavIndex,
//      fixedColor: Colors.blue,
//      items: <BottomNavigationBarItem>[
//        BottomNavigationBarItem(
//            icon: Icon(Icons.chat), title: Text("Flutter基础")),
//        BottomNavigationBarItem(
//            icon: Icon(Icons.contacts), title: Text("第三方sdk")),
//        BottomNavigationBarItem(
//            icon: Icon(Icons.account_circle), title: Text("chat聊天接入")),
//      ],
//      onTap: (int index) {
//        setState(() {
//          bottomNavIndex = index;
//        });
//      },
//    );
//  }
}

//右上角   pop:
enum ConferenceItem { AlertDialog, SimpleDialog, SnackBar }
