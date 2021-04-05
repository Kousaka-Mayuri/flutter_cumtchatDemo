import 'dart:convert';
import 'dart:typed_data';

import 'package:shared_preferences/shared_preferences.dart';

class User{
  String username;
  String password;
  String sex = "男";
  String description = "我是个zz，干啥啥不行，打啥啥不会，干饭第一名，小废物就是我";
  int exp;
  String willNickname;
  String nickname;
  DateTime birthdayDate = new DateTime.now();
  String token;
  SharedPreferences prefs;
  List attentionList;
  List fansList;
  String head;
  String base64Head;
  Uint8List bytes;
  getBytes(){
   bytes = Base64Decoder().convert(head);

  }
  saveToken(String value) async{
    prefs = await SharedPreferences.getInstance();
    prefs.setString('token', value);
  }
  saveUsername(String value)async{
    prefs = await SharedPreferences.getInstance();
    prefs.setString('username', value);
  }
}

User user = new User();