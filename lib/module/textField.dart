import 'package:flutter/material.dart';
import 'package:flutter_cumtchat/module/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class loginTextField extends StatefulWidget{
  final String text;
  final bool isPassword;
  final TextEditingController controller;
  final Function() input;
  const loginTextField(this.text,this.isPassword,this.controller,this.input,{Key key}):super(key:key);
  @override
  login_textfield createState() => login_textfield();
}

class login_textfield extends State<loginTextField>{
  @override
  Widget build(BuildContext context) {
    return Opacity(
        opacity: 0.5,
    child:  Container(
      margin: EdgeInsets.fromLTRB(0, 10.h, 0, 10.h),
      width: 260.w,
      height: 40.h,
      decoration: BoxDecoration(
        color: Colors.white54,
          borderRadius: BorderRadius.all(Radius.circular(40.w)),
      ),
      child: TextField(
        onChanged: (String value){
          setState(() {
            widget.input();
          });

        },
        obscureText: widget.isPassword,
        textAlign: TextAlign.center,
        controller: widget.controller,
        decoration: InputDecoration(
          hintStyle: TextStyle(
            color: Colors.black
          ),
          border: InputBorder.none,
          hintText: widget.text,
        ),
      ),
    ));
  }
}//登录页面输入框

class searchTextField extends StatelessWidget{
  final String hinText;
  const searchTextField(this.hinText,{Key key}):super(key:key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 320.w,
      height: 40.h,
      decoration: BoxDecoration(
          color: loginTFColor,
          borderRadius: BorderRadius.all(Radius.circular(40.w)),
          border: new Border.all(color: Colors.white)
      ),
      child: TextField(

        textAlign: TextAlign.center,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText:hinText,
        ),
      ),
    );
  }
}//活动搜索输入框

