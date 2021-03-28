import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cumtchat/data/userData.dart';
import 'package:flutter_cumtchat/module/button.dart';
import 'package:flutter_cumtchat/module/textField.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class register extends StatefulWidget{
  @override
  register_page createState() => register_page();
}

class register_page extends State<register>{
  TextEditingController usernameControl = new TextEditingController();
  TextEditingController passwordControl = new TextEditingController();
  getUsername(){
    user.username = usernameControl.text;
  }
  getPassword(){
    user.password = passwordControl.text;
  }
  registerHttp()async{
    Dio dio = new Dio();
    Response response = await dio.post('http://192.168.1.119:8080/register',
    data: {
      "username":user.username,
      "password":user.password
    }
    );
    print(response.data);
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250.h,
      width: 350.w,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
            loginTextField("请输入账号", false,usernameControl,getUsername),
            loginTextField("请输入密码", true,passwordControl,getPassword),
            clickButton("注册",registerHttp)
        ],
      ),
    );
  }
}