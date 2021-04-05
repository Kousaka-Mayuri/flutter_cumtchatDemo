import 'dart:typed_data';

class Other{
  String username;
  String password;
  String nickname;
  DateTime birthdayDate = new DateTime.now();
  String token;
  List attentionList;
  List fansList;
  String head;
  String base64Head;
  Uint8List bytes;
  int exp;
  String sex = "男";
  String description = "我是个zz，干啥啥不行，打啥啥不会，干饭第一名，小废物就是我";
}

Other otherUser = new Other();