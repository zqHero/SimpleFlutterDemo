import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:flutterdemo/domain/message_data.dart';
import 'package:flutterdemo/routes.dart';
import 'package:flutterdemo/widgets/third_pages/search_widget/touch_callback.dart';

class MessagePage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new MessagePageState();
  }
}

class MessagePageState extends State<MessagePage> {

  List<MessageData> messageData = [
    MessageData("https://avatar.csdn.net/C/D/F/3_u013233097.jpg","王振","渠道。",DateTime(20192102),MessageType.CHAT),
    MessageData("https://img-blog.csdnimg.cn/20190902151922674.jpg","关语","1请问。。",DateTime(20192102),MessageType.CHAT),
    MessageData("https://img-blog.csdnimg.cn/20190902145240181.jpg","刘备","哈哈阿萨德。。",DateTime(20192102),MessageType.CHAT),
    MessageData("https://img-blog.csdnimg.cn/20190902144909300.jpg","司马相如","12313123。。",DateTime(20192102),MessageType.CHAT),
    MessageData("https://img-blog.csdnimg.cn/20190902145440630.jpg","孙尚香","123爱迪生。。",DateTime(20192102),MessageType.CHAT),
    MessageData("https://img-blog.csdnimg.cn/20190902145757666.jpg","张二麻辣子","爱迪生哈你说哈。。",DateTime(20192102),MessageType.CHAT),
    MessageData("https://img-blog.csdnimg.cn/20190915201117102.jpg","刘备2","哈说哈。。",DateTime(20192102),MessageType.CHAT),
  ];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: ListView.builder(
        itemCount: messageData.length,
          itemBuilder: (BuildContext context,int index){
          return new MessageItem(messageData[index]);
      }),
    );
  }
}

class MessageItem extends StatelessWidget{

  final MessageData _messageData;

  const MessageItem(this._messageData);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(
            width: 0.5,
            color: Color(0xffd9d9d9),
          ),
        ),
      ),
      height: 64,
      child: TouchCallBack(
        onPressed: () {
          ToastUtil.toast(context, _messageData.toString());
        },
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: const EdgeInsets.only(left: 13, right: 13),
              child: Image.network(
                _messageData.avatar,
                width: 48,
                height: 48,
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    _messageData.title,
                    style: TextStyle(
                      fontSize: 14,
                      color: Color(0xff3535335),
                    ),
                    maxLines: 1,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8),
                  ),
                  Text(
                    _messageData.subTitle,
                    style: TextStyle(fontSize: 14, color: Color(0xffa9a9a9)),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            Container(
              alignment: AlignmentDirectional.topStart,
              margin: const EdgeInsets.only(right: 12, top: 12),
              child: Text(
                formatDate(_messageData.time, [HH, ":", nn, ":", ss])
                    .toString(),
                style: TextStyle(fontSize: 14, color: Color(0xffa9a9a9)),
              ),
            )
          ],
        ),
      ),
    );
  }

}
