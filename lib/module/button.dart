import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cumtchat/home/home_page.dart';
import 'package:flutter_cumtchat/module/colors.dart';
import 'package:flutter_cumtchat/module/textStyle.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class clickButton extends StatelessWidget{
  final String text;
  final Function() click;
  const clickButton(this.text,this.click,{Key key}):super(key:key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 60.h, 0, 20.h),
      width: 180.w,
      height: 35.h,
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18.w),
        ),
        child: Text(text,style: loginText),
        color: loginButtonColor,
        onPressed: (){
          click();
        },
      ),
    );
  }
}//登陆页面按钮

class textButton extends StatelessWidget{
  final String src;
  final String name;
  final Function() click;
  const textButton(this.src,{
    Key key,
    this.name,
    this.click
  }):super(key:key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70.w,
      height: 70.w,
      child:Column(
        children: <Widget>[
          IconButton(
            icon: Image.asset(src,fit: BoxFit.cover,),
            onPressed: (){
                click();
            },
          ),
          Text(name,style: userPageText)
        ],
      ),
      margin: EdgeInsets.fromLTRB(5.w, 10.h, 5.w, 0),
    );
  }
}//主页活动输入框下的按钮

class homeClickButton extends StatelessWidget{
  final String src;
  final Function() click;
  const homeClickButton(this.src,this.click,{Key key,}):super(key:key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      child: IconButton(
            icon: Image.asset(src),
            onPressed: (){

              click();
            },
          ),
      margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
    );
  }
}//主页上端点击按钮

class homeIcon extends StatelessWidget{
  final String src;
  final double height;
  final double width;
  final String text;
  const homeIcon(this.src,this.height,this.width,this.text,{Key key,}):super(key:key);
  @override
  Widget build(BuildContext context) {
    return Container(
        width: width,
      height: height,
      child: Column(
        children: <Widget>[
          Container(
            width: width*0.45,
            height: width*0.45,
            child: Image.asset(src,fit: BoxFit.cover,),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(0, height*0.05, 0, 0),
            child: Text(text,style: TextStyle(fontSize: 12.sp),),
          )
        ],
      )
    );
  }
}
