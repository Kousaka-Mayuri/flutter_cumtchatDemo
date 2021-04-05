import 'package:flutter/material.dart';
import 'package:flutter_cumtchat/data/user.dart';
import 'package:flutter_cumtchat/user/collect/friendsPage/entry.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class fans extends StatefulWidget{
  @override
  fans_page createState() => fans_page();
}

class fans_page extends State<fans>{
  List dataList = [
    {
      "imgsrc":'images/touxiang.jpg',
      "name":"我是菜鸡",
      "description":"音游彩笔，请见谅。让你看到废物真是不好意思，我会尽快爬走"
    },
    {
      "imgsrc":'images/touxiang.jpg',
      "name":"我是菜鸡",
      "description":"音游彩笔，请见谅。让你看到废物真是不好意思，我会尽快爬走"
    }
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      child: entry(user.fansList)
    );
  }
}