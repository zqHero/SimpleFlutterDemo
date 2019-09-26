class MessageData {
  String avatar;
  String title;
  String subTitle;
  DateTime time;

  MessageType type;

  MessageData(this.avatar, this.title, this.subTitle, this.time, this.type);

  @override
  String toString() {
    return 'MessageData{avatar: $avatar, title: $title, subTitle: $subTitle, time: $time, type: $type}';
  }
}

enum MessageType { SYSTEM, PUBLIC, CHAT, GROUP }
