import 'package:flutter/material.dart';
import 'package:flutter_cumtchat/module/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

TextStyle userIdText = new TextStyle(
        fontSize: 12.sp,
        fontWeight: FontWeight.bold,
        letterSpacing: 2.w
);

TextStyle annotationText = new TextStyle(
    color: Colors.grey,
    fontSize: 10.sp
);

TextStyle attentionText = new TextStyle(
    fontSize: 12.sp,
    color: tabBar,
);

TextStyle talkExpandText = new TextStyle(
    letterSpacing: 1.w,
    fontSize: 13.sp
);

TextStyle tabText = new TextStyle(
    fontSize: 12.sp,
    color: HexColor("#7E7E7E")
);

TextStyle commentCardText = new TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeight.bold,
    letterSpacing: 2.w,
    color: HexColor('#61B593')
);

TextStyle headline = new TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.bold,
    color: Colors.black,
    letterSpacing: 1.w
);

TextStyle questionText = new TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeight.bold,
    color: HexColor("#B7DCF5"),

);

var actText = TextStyle(fontSize: 16);//活动页按钮
var loginText = TextStyle(color: Colors.white,fontSize: 18);//登录按钮样式
var skipText = TextStyle(color: Colors.white);//启动页跳过按钮样式