import 'package:flutter/material.dart';
import 'package:flutterdemo/routes.dart';
import 'package:flutterdemo/widgets/third_pages/search_widget/touch_callback.dart';

class PersonalPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new PersonalPageState();
  }
}

class PersonalPageState extends State<PersonalPage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      body: ListView(
        children: <Widget>[
          //头像部分实现：
          Container(
            margin: const EdgeInsets.only(top: 20),
            color: Colors.white,
            height: 80,
            child: TouchCallBack(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  //添加头像
                  Container(
                    margin: const EdgeInsets.only(left: 12, right: 15),
                    child: Image.network(
                      'https://avatar.csdn.net/C/D/F/3_u013233097.jpg',
                      width: 70,
                      height: 70,
                    ),
                  ),
                  //用户名和账号：
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'zqHero',
                          style:
                              TextStyle(fontSize: 18, color: Color(0xff353535)),
                        ),
                        Text(
                          "账号: 229457269",
                          style:
                              TextStyle(fontSize: 14, color: Color(0xffa9a9a9)),
                        )
                      ],
                    ),
                  ),
                  //二维码图片：
                  Container(
                    margin: const EdgeInsets.only(left: 12, right: 15),
                    child: Image.network(
                      'https://avatar.csdn.net/C/D/F/3_u013233097.jpg',
                      width: 24,
                      height: 24,
                    ),
                  ),
                ],
              ),
              onPressed: () {
                ToastUtil.toast(context, "userInfo");
              },
            ),
          ),
          //列表项：
          Container(
            margin: EdgeInsets.only(top: 20),
            color: Colors.white,
            child: ImItem(
              title: "好友动态",
              icon: Icon(Icons.ac_unit),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 20),
            color: Colors.white,
            child: Column(
              children: <Widget>[
                ImItem(
                  title: "消息管理",
                  icon: Icon(Icons.message),
                ),
                ImItem(
                  title: "我的相册",
                  icon: Icon(Icons.photo),
                ),
                ImItem(
                  title: "我的文件",
                  icon: Icon(Icons.attach_file),
                ),
                ImItem(
                  title: "联系客服",
                  icon: Icon(Icons.chat),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 20),
            color: Colors.white,
            child: ImItem(
              title: "清除缓存",
              icon: Icon(Icons.file_download),
            ),
          ),
        ],
      ),
    );
  }
}

//-----------------自定义 列表项：-----------------
class ImItem extends StatelessWidget {
  //标题：
  final String title;
  final String imagePath;
  final Icon icon;

  const ImItem({Key key, this.title, this.imagePath, this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return TouchCallBack(
      onPressed: () {
        ToastUtil.toast(context, "$title");
      },
      child: Container(
        height: 50,
        child: Row(
          children: <Widget>[
            Container(
              child: imagePath != null
                  ? Image.asset(
                      imagePath,
                      width: 32,
                      height: 32,
                    )
                  : SizedBox(
                      height: 32,
                      width: 32,
                      child: icon,
                    ),
              margin: EdgeInsets.only(left: 22, right: 20),
            ),
            //
            Text(
              title,
              style: TextStyle(fontSize: 16, color: Color(0xff353535)),
            )
          ],
        ),
      ),
    );
  }
}
