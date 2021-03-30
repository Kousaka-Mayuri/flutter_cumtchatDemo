import 'package:flutter/material.dart';
import 'package:flutter_cumtchat/module/cardCon.dart';
import 'package:flutter_cumtchat/module/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class collect extends StatefulWidget{
  @override
  collect_page createState() => collect_page();
}

class collect_page extends State<collect>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(40.h),
        child: AppBar(
          iconTheme: IconThemeData(
            color: Colors.black
          ),
          backgroundColor: tabBar,
          title: Text("我的收藏",style: TextStyle(
            color: Colors.black,
            fontSize: 14.sp
          ),),
        ),
      ),
      body: Container(
        child: ListView.builder(
            itemCount: 1,
            itemBuilder: (BuildContext context,int index){
          return actCard();
        }),
      ),
    );
  }
}