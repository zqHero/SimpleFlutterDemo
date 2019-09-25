import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterdemo/routes.dart';

class ChatPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new ChatPageState();
  }
}

class ChatPageState extends State<ChatPage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.green,
        title: Text('及时通讯'),
        actions: getActions(),
      ),
      body: currenPage(),
      bottomNavigationBar: new BottomNavigationBar(
        onTap: ((index) {
          setState(() {
            _currentIndex = index;
          });
        }),
        currentIndex: _currentIndex,
        items: getNavBarItems(),
      ),
    );
  }

  //弹出菜单 样式
  _popMenuItem(String title, {String imagePath, IconData icon}) {
    return PopupMenuItem(
      child: Row(
        children: <Widget>[
          imagePath != null
              ? Image.asset(imagePath, width: 32, height: 32)
              : SizedBox(
                  width: 32,
                  height: 32,
                  child: Icon(
                    icon,
                    color: Color(0xff46c01b),
                  ),
                ),
          Container(
            padding: const EdgeInsets.only(left: 30, right: 20),
            child: new Text(
              title,
              style: TextStyle(color: Colors.grey),
            ),
          ),
        ],
      ),
    );
  }

  //生成底部 bar
  getNavBarItems() {
    return [
      new BottomNavigationBarItem(
        title: new Text(
          "聊天",
          style: new TextStyle(
            color: _currentIndex == 0 ? Color(0xff46c01b) : Color(0xff999999),
          ),
        ),
        icon: Icon(
          Icons.home,
          color: _currentIndex == 0 ? Color(0xff46c01b) : Color(0xff999999),
        ),
      ),
      new BottomNavigationBarItem(
        title: new Text(
          "好友",
          style: new TextStyle(
            color: _currentIndex == 1 ? Color(0xff46c01b) : Color(0xff999999),
          ),
        ),
        icon: Icon(
          Icons.list,
          color: _currentIndex == 1 ? Color(0xff46c01b) : Color(0xff999999),
        ),
      ),
      new BottomNavigationBarItem(
        title: new Text(
          "我的",
          style: new TextStyle(
            color: _currentIndex == 2 ? Color(0xff46c01b) : Color(0xff999999),
          ),
        ),
        icon: Icon(
          Icons.print,
          color: _currentIndex == 2 ? Color(0xff46c01b) : Color(0xff999999),
        ),
      ),
    ];
  }

  //获取  popWindow的类：
  getActions() {
    return [
      GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, "SearchPage");
        },
        child: Icon(
          //搜索图标：
          Icons.search,
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(left: 30, right: 20),
        child: GestureDetector(
          onTap: () {
            //弹出菜单
            showMenu(
              context: context,
              position: RelativeRect.fromLTRB(500, 76, 10, 0),
              items: <PopupMenuEntry>[
                _popMenuItem("发起会话", icon: Icons.chat),
                _popMenuItem("添加好友", icon: Icons.add),
                _popMenuItem("联系客服", icon: Icons.face),
              ],
            );
          },
          child: Icon(Icons.add),
        ),
      ),
    ];
  }

  //返回  当前界面===
  MessagePage _messagePage;
  ContactPage _contacts;
  PersonalPage _me;
  currenPage() {
    switch (_currentIndex) {
      case 0:
        if (_messagePage == null) _messagePage = new MessagePage();
        return _messagePage;
      case 1:
        if (_contacts == null) _contacts = new ContactPage();
        return _contacts;
      case 2:
        if (_me == null) _me = new PersonalPage();
        return _me;
    }
  }
}
