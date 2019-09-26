//联系人   联系类：
class ContactVo {
  //字母排列值
  String seationKey;

  String name;

  String avatarUrl;

  ContactVo(this.seationKey, this.name, this.avatarUrl);

  @override
  String toString() {
    return 'ContactVo{seationKey: $seationKey, name: $name, avatarUrl: $avatarUrl}';
  }
}
