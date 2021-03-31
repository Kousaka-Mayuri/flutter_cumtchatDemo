import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cumtchat/data/user.dart';
import 'package:flutter_cumtchat/main_page.dart';
import 'package:flutter_cumtchat/module/button.dart';
import 'package:flutter_cumtchat/module/textField.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class enter extends StatefulWidget{
  @override
  enter_page createState() => enter_page();
}

class enter_page extends State<enter>{
  TextEditingController usernameControl = new TextEditingController();
  TextEditingController passwordControl = new TextEditingController();
  getUsername(){
    user.username = usernameControl.text;
  }
  getPassword(){
    user.password = passwordControl.text;
  }
  loginHttp() async{
    Dio dio = new Dio();
    Response response = await dio.post('http://192.168.1.119:8080/login',
        data: {
          "username":user.username,
          "password":user.password
        }
    );
    print(response.data);
  }
  goHome() {
    Navigator.of(context).pushAndRemoveUntil(
        new MaterialPageRoute(builder: (context)=>main_page()),(route)=> route == null);
  }
  @override
  Widget build(BuildContext context) {

    return Container(
      alignment: Alignment.center,
      width: 350.w,
      height: 250.h,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          loginTextField("请输入账号",false,usernameControl,getUsername),
          loginTextField("请输入密码",true,passwordControl,getPassword),
          clickButton("登录",loginHttp),
          clickButton("试用",goHome)
        ],
      ),
    );
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();

  }
}
