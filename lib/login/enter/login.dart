import 'dart:convert';

import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cumtchat/data/activity.dart';
import 'package:flutter_cumtchat/data/http.dart';
import 'package:flutter_cumtchat/data/user.dart';
import 'package:flutter_cumtchat/home/home_page.dart';
import 'package:flutter_cumtchat/home/tabBars/activity.dart';
import 'package:flutter_cumtchat/main_page.dart';
import 'package:flutter_cumtchat/module/button.dart';
import 'package:flutter_cumtchat/module/function.dart';
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
  bool isGetData = false;
  var activityUrl = 'https://moreover.atcumt.com/posts/post/1/1';

  Future getActivity() async{
    Dio dio = new Dio();
    Response response = await dio.get(
        'https://moreover.atcumt.com/posts/post/'+actInfo.page.toString()+'/1',
        options: Options(
            headers: {
              "token":user.token
            }
        ));
    actInfo.activityList= response.data['data']['content'];
    actInfo.thisCount = response.data['totalElements'];
    if(true){
      actInfo.allPage = 2;
    }
    else{
      actInfo.allPage = ((actInfo.thisCount/1) as int) + 1;
    }
  }
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
    Loading(){
      showDialog(
          context: context,
          builder: (context){
            return LoadingDialog();
          }
      );
    }
    goHome() {
      showToast("登录成功");
      Navigator.of(context).pushAndRemoveUntil(
          new MaterialPageRoute(builder: (context)=>main_page()),(route)=> route == null);
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
    loginHttp() async
    {
      Loading();
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
        getInfo().then((value) => getActivity().then((value) => goHome()));
      }
      else{
        Navigator.pop(context);
        showToast("用户名或密码错误");
      }
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

class LoadingDialog extends Dialog {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Material(
      type: MaterialType.transparency,
      child: new Center(
        child: new Container(
          decoration: new ShapeDecoration(
              color: Colors.white,
              shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.all(new Radius.circular(10)))),
          width: 100,
          height: 100,
          padding: EdgeInsets.all(10),
          child: new Column(children: <Widget>[
            CircularProgressIndicator(),
            new Text('正在加载...',style: TextStyle(fontSize: 12,color: Colors.grey),softWrap: false,)
          ],mainAxisAlignment: MainAxisAlignment.spaceEvenly,),
        ),
      ),
    );
  }

}

