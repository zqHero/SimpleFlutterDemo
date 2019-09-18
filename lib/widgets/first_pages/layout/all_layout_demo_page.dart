import 'package:flutter/material.dart';

//百分比  布局
class AllLayoutDemoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("AllLayoutDemoPage"),
      ),
      body: new ListView(
        children: <Widget>[
          Image.asset(
            "lib/imgs/demo.jpg",
            height: 200,
            fit: BoxFit.fitWidth,
          ),
          addressContainer(),
          buttonsContainer(),
          new Text(
            '''       
            武当山中国阿森纳的大大阿萨大大是大撒大撒我在想这倒是深为什么护着u昂坏事顶。武当山中国阿森纳的大
            大阿萨大大是大撒大撒我在想这倒是深为什么护着u昂坏事顶,武当山中国阿森纳的大大阿萨大大是大撒大撒我在想这倒是深为什么护着u昂坏事顶,武当山中国阿森纳的大大阿萨大大是大撒大撒我在想这倒是深为什么护着u昂坏事顶。
            武当山中国阿森纳的大大阿萨大大是大撒大撒我在想这倒是深为什么护着u昂坏事顶,武当山中国阿森纳的大大阿萨大大是大撒大撒我在想这倒是深为什么护着u昂坏事顶。
            武当山中国阿森纳的大大阿萨大大是大撒大撒我在想这倒是深为什么护着u昂坏事顶,武当山中国阿森纳的大大阿萨大大是大撒大撒我在想这倒是深为什么护着u昂坏事顶。
            武当山中国阿森纳的大大阿萨大大是大撒大撒我在想这倒是深为什么护着u昂坏事顶,武当山中国阿森纳的大大阿萨大大是大撒大撒我在想这倒是深为什么护着u昂坏事顶。
            ''',
            softWrap: true,
            style: TextStyle(
              fontSize: 15,
              color: Colors.grey[500]
            ),
          )
        ],
      ),
    );
  }

  //创建  按钮
  Widget buttonsContainer() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        buttonsContainerItem(Icons.call, "电话"),
        buttonsContainerItem(Icons.near_me, "附近"),
        buttonsContainerItem(Icons.share, "分享"),
      ],
    );
  }

  // 按钮部分
  Widget buttonsContainerItem(IconData iconData, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min, //垂直方向最小化
      mainAxisAlignment: MainAxisAlignment.center, //垂直方向剧中对齐
      children: <Widget>[
        Icon(
          iconData,
          color: Colors.blue[600],
        ),
        Container(
          margin: const EdgeInsets.only(top: 8),
          child: Text(
            label,
            style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: Colors.lightGreen[600]),
          ),
        )
      ],
    );
  }

  //地址部分----
  Widget addressContainer() {
    return Container(
      padding: EdgeInsets.all(32),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start, //顶部对齐
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(bottom: 8),
                  child: Text(
                    "风景区地址",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Text(
                  "湖北省十堰市丹江口市",
                  style: TextStyle(color: Colors.grey[500], fontSize: 12),
                ),
              ],
            ),
          ),
          Icon(
            Icons.star,
            color: Colors.blue[500],
          ),
          Text('66')
        ],
      ),
    );
  }
}
