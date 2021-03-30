import 'package:flutter/material.dart';
import 'package:flutter_cumtchat/user/collect/friendsPage/entry.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class attention extends StatefulWidget{
  @override
  _attention createState() => _attention();
}

class _attention extends State<attention>{
  List dataList = [
    {
      "imgsrc":'images/touxiang.jpg',
      "name":"我是菜鸡",
      "description":"音游彩笔，请见谅。让你看到废物真是不好意思，我会尽快爬走"
    }
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      child: entry(dataList),
    );
  }
}