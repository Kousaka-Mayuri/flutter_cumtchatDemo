import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cumtchat/data/http.dart';
import 'package:flutter_cumtchat/data/user.dart';
import 'package:flutter_cumtchat/login/enter/login.dart';
import 'package:flutter_cumtchat/main_page.dart';
import 'package:flutter_cumtchat/module/button.dart';
import 'package:flutter_cumtchat/module/textField.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_cumtchat/data/activity.dart';
class register extends StatefulWidget{
  @override
  register_page createState() => register_page();
}

class register_page extends State<register> {
  var resgister = 'https://moreover.atcumt.com/user/register';
  TextEditingController usernameControl = new TextEditingController();
  TextEditingController passwordControl = new TextEditingController();
  var activityUrl = 'https://moreover.atcumt.com/posts/post/1/3';
  bool isGetData = false;
  Loading(){
    showDialog(
        context: context,
        builder: (context){
          return LoadingDialog();
        }
    );
  }
  goHome() {
    showToast("注册成功");
    Navigator.of(context).pushAndRemoveUntil(
        new MaterialPageRoute(builder: (context)=>main_page()),(route)=> route == null);
  }
  Future getActivity() async{
    Dio dio = new Dio();
    Response response = await dio.get(
        activityUrl,
        options: Options(
            headers: {
              "token":user.token
            }
        ));
    actInfo.activityList = response.data['data']['content'];
    actInfo.thisCount = response.data['totalElements'];

  }

  getUsername() {
    user.username = usernameControl.text;
  }
  getPassword() {
    user.password = passwordControl.text;
  }
  var fans = 'https://moreover.atcumt.com/userinfo/followers/'+(user.username = user.username ?? "");
  var attentions = 'https://moreover.atcumt.com/userinfo/follow/'+(user.username = user.username ?? "");
  getFans()async{
    Dio dio = new Dio();
    Response response = await dio.get(fans,
        options: Options(
            headers: {
              'token':user.token
            }
        )
    );
    print(response.data);
    user.fansList = response.data['data'];
    print("获取粉丝列表");
  }
  getAttention()async{
    Dio dio = new Dio();
    Response response = await dio.get(
        attentions,
        options: Options(
            headers: {
              'token':user.token
            }
        )
    );
    print(response.data);
    user.attentionList = response.data['data'];
    print("获取关注列表");
  }

  Future getInfo()async
  {
    Dio dio = new Dio();
    Response response = await dio.get(
        info,
        options:Options(
            headers: {
              'token':user.token
            }
        )
    );

    user.head = response.data['data']['head'];
    user.getBytes();
    user.exp = response.data['data']['exp'];
    user.nickname = response.data['data']['nickname'];
    getAttention();
    getFans();
  }
  registerHttp() async {
    Loading();
    Dio dio = new Dio();
    Response response = await dio.post(
        resgister,
        data: {
          "username": user.username,
          "password": user.password
        }
    );
    if (response.data['code'] == 400) {
      showToast("已注册过同名账号");
      Navigator.pop(context);
    }
    else {
      user.saveToken(response.data['data']['token']);
      user.saveUsername(user.username);
      user.token = response.data['data']['token'];
      print(user.username);
      print(user.token);
      print(response.data['data']['token']);
      getInfo().then((value) => getActivity().then((value) => goHome()));
      showToast("注册成功");
    }
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
          loginTextField("请输入账号", false, usernameControl, getUsername),
          loginTextField("请输入密码", true, passwordControl, getPassword),
          clickButton("注册", registerHttp)
        ],
      ),
    );
  }
}