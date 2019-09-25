import 'package:flutter/material.dart';

import 'touch_callback.dart';

//搜索界面
class SearchPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return SearchPageState();
  }
}

class SearchPageState extends State<SearchPage> {
  FocusNode focusNode = new FocusNode();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.only(top: 25),
        //水平方向居中：
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Stack(
              children: <Widget>[
                //使用触摸组件回调
                TouchCallBack(
                  isfeed: false,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    height: 45,
                    margin: const EdgeInsets.only(left: 12, right: 12),
                    child: Icon(
                      Icons.chevron_left,
                      color: Colors.black,
                    ),
                  ),
                ),

                Container(
                  alignment: Alignment.centerLeft,
                  height: 45,
                  margin: const EdgeInsets.only(left: 50, right: 10),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(width: 1, color: Colors.green),
                    ),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                        child: TextField(
                          focusNode: _requestFocus(),
                          style: TextStyle(color: Colors.black, fontSize: 16),
                          onChanged: (String text) {},
                          decoration: InputDecoration(
                              hintText: '搜索', border: InputBorder.none),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(right: 10),
                        child: Icon(
                          Icons.mic,
                          color: Color(0xffaaaaaa),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),

            Container(
              margin: const EdgeInsets.only(top: 50),
              child: Text(
                '常用搜索',
                style: TextStyle(fontSize: 14, color: Color(0xffb5b5b5)),
              ),
            ),

            Padding(
              padding: EdgeInsets.all(30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  _getText("朋友"),
                  _getText("聊天"),
                  _getText("群组"),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(left: 30,right: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  _getText("flutter"),
                  _getText("dart"),
                  _getText("c++"),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  // 获取焦点：
  _requestFocus() {
    FocusScope.of(context).requestFocus(focusNode);
    return focusNode;
  }

  _getText(String s) {
    return TouchCallBack(
      isfeed: false,
      onPressed: () {},
      child: Text(
        s,
        style: TextStyle(
          fontSize: 14,
          color: Color(0xff1aad19),
        ),
      ),
    );
  }

}
