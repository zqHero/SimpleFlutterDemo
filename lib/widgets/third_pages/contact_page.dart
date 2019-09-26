import 'package:flutter/material.dart';
import 'package:flutterdemo/domain/contact_vo.dart';
import 'package:flutterdemo/routes.dart';

//好友界面：
class ContactPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new ContactPageState();
  }
}

class ContactPageState extends State<ContactPage> {
  List<ContactVo> _contactData = [
    ContactVo("A", "奥凯在", "https://img-blog.csdnimg.cn/20190902145240181.jpg"),
    ContactVo("A", "晒单", "https://img-blog.csdnimg.cn/20190902144909300.jpg"),
    ContactVo("B", "波波", "https://img-blog.csdnimg.cn/20190902151922674.jpg"),
    ContactVo("B", "波波大", "https://img-blog.csdnimg.cn/20190902144909300.jpg"),
    ContactVo("C", "操你妈", "https://img-blog.csdnimg.cn/20190915201117102.jpg"),
    ContactVo("D", "大波波", "https://img-blog.csdnimg.cn/20190902145757666.jpg"),
    ContactVo("E", "Eason", "https://img-blog.csdnimg.cn/3_u013233097.jpg"),
    ContactVo(
        "E", "Early", "https://img-blog.csdnimg.cn/20190902151922674.jpg"),
    ContactVo("E", "e不晓得", "https://img-blog.csdnimg.cn/20190902151922674.jpg"),
    ContactVo("S", "傻子", "https://img-blog.csdnimg.cn/20190902145240181.jpg"),
    ContactVo("S", "晒单", "https://img-blog.csdnimg.cn/20190902144909300.jpg"),
  ];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new ContactSiderListPage(
      //好友  列表数据
      items: _contactData,

      headerBuilder: (BuildContext context, int index) {
        return ContactHeader();
      },

      itemBuilder: (BuildContext context, int index) {
        return Container(
          color: Colors.white,
          alignment: Alignment.centerLeft,
          child: new Container(
            child: new ContactItem(item: _contactData[index]),
          ),
        );
      },

      sectionBuilder: (BuildContext context, int index) {
        return Container(
          height: 32,
          padding: const EdgeInsets.only(left: 14),
          color: Colors.grey[300],
          alignment: Alignment.centerLeft,
          //显示 字母
          child: new Text(
            _contactData[index].seationKey,
            style: TextStyle(fontSize: 14, color: Color(0xff909090)),
          ),
        );
      },
    );
  }
}

//item 数据==================================================================
class ContactItem extends StatelessWidget {
  final ContactVo item;
  final String titleName;
  final IconData imageName;

  const ContactItem({Key key, this.item, this.titleName, this.imageName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          border:
              Border(bottom: BorderSide(width: 0.5, color: Color(0xffd9d9d9)))),
      height: 52,
      child: FlatButton(
        onPressed: () {
          ToastUtil.toast(context, "${item.toString()}");
        },
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            imageName != null
                ? Icon(
                    imageName,
                  )
                : Image.network(
                    item.avatarUrl,
                    width: 36,
                    height: 36,
                    scale: 0.9,
                    fit: BoxFit.fill,
                  ),
            Container(
              margin: const EdgeInsets.only(left: 12),
              child: Text(
                titleName == null ? item.name ?? '暂时' : titleName,
                style: TextStyle(fontSize: 14, color: Color(0xff353535)),
              ),
            )
          ],
        ),
      ),
    );
  }
}

//----------------------头部选项卡----------------------------------------------
class ContactHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: <Widget>[
        ContactItem(titleName: "新的朋友", imageName: Icons.child_friendly),
        ContactItem(titleName: "群聊", imageName: Icons.print),
        ContactItem(titleName: "标签", imageName: Icons.photo),
        ContactItem(titleName: "公众号", imageName: Icons.palette),
      ],
    );
  }
}

//------------------------------------------------------------
class ContactSiderListPage extends StatefulWidget {
  //好友 列表数据项:
  final List<ContactVo> items;

  //好友 列表头部构造器:
  final IndexedWidgetBuilder headerBuilder;

  //好友 列表项 构造器:
  final IndexedWidgetBuilder itemBuilder;

  //字母  构造器：
  final IndexedWidgetBuilder sectionBuilder;

  const ContactSiderListPage(
      {Key key,
      this.items,
      this.headerBuilder,
      this.itemBuilder,
      this.sectionBuilder})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ContactSiderListPageState();
  }
}

//好友列表:
class ContactSiderListPageState extends State<ContactSiderListPage> {
  final ScrollController _scrollController = new ScrollController();

  bool _onNotification(ScrollNotification notification) {
    return true;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      body: Stack(
        children: <Widget>[
          NotificationListener(
            onNotification: _onNotification,
            child: ListView.builder(
                controller: _scrollController,
                physics: const AlwaysScrollableScrollPhysics(),
                itemCount: widget.items.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    alignment: Alignment.centerLeft,
                    child: Column(
                      children: <Widget>[
                        //头部
                        _isShowHeaderView(index),
                        //英文字母
                        Offstage(
                          offstage: _shouldShowHeader(index),
                          child: widget.sectionBuilder(context, index),
                        ),
                        //列表项
                        Column(
                          children: <Widget>[
                            widget.itemBuilder(context, index),
                          ],
                        ),
                      ],
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }

  //根据 定位 判断是否显示 列表头:
  _isShowHeaderView(int index) {
    //返回 头部：
    if (index == 0 && widget.headerBuilder != null) {
      return Offstage(
        offstage: false,
        child: widget.headerBuilder(context, index),
      );
    }
    //返回一个    null
    return Container();
  }

  _shouldShowHeader(int index) {
    if (index <= 0) {
      return false;
    }
    if (index != 0 &&
        widget.items[index].seationKey != widget.items[index - 1].seationKey) {
      return false;
    }
    return true;
  }
}
