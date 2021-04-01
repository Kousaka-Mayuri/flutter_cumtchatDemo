import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cumtchat/data/http.dart';
import 'package:flutter_cumtchat/data/user.dart';
import 'package:flutter_cumtchat/main_page.dart';
import 'package:flutter_cumtchat/module/button.dart';
import 'package:flutter_cumtchat/module/textField.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
class enter extends StatefulWidget{
  @override
  enter_page createState() => enter_page();
}

showToast(String msg){
  Fluttertoast.showToast(msg: msg);
}
class enter_page extends State<enter>{
  TextEditingController usernameControl = new TextEditingController();
  TextEditingController passwordControl = new TextEditingController();

  getUsername(){
    user.username = usernameControl.text;
    print(user.username);
  }
  getPassword(){
    user.password = passwordControl.text;
    print(user.password);
  }
  @override
  Widget build(BuildContext context) {
    goHome() {
      Navigator.of(context).pushAndRemoveUntil(
          new MaterialPageRoute(builder: (context)=>main_page()),(route)=> route == null);
    }
    loginHttp() async{
      Dio dio = new Dio();
      (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate = (client){
        client.badCertificateCallback = (cert,host,port){
          return true;
        };
      };
      Response response = await dio.post('https://moreover.atcumt.com/user/login',
          data: {
            "username":user.username,
            "password":user.password
          }
      );
      if(response.data['code'] == 200){
        user.saveToken(response.data['data']['token']);
        user.saveUsername(user.username);
        user.token = response.data['data']['token'];
        print(user.username);
        print(user.token);
        print(response.data['data']['token']);
        goHome();
        showToast("登录成功");
      }
      else{
        showToast("用户名或密码错误");
      }
      print(response.data);
    }
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
        ],
      ),
    );
  }

}
