import 'package:flutter/material.dart';
import 'package:flutter_cumtchat/data/user.dart';
import 'package:flutter_cumtchat/user/collect/friendsPage/entry.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class attention extends StatefulWidget{
  @override
  _attention createState() => _attention();
}

class _attention extends State<attention>{
  @override
  Widget build(BuildContext context) {
    return Container(
      child: entry(user.attentionList),
    );
  }
}