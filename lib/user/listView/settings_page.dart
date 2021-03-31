import 'package:flutter/material.dart';
import 'package:flutter_cumtchat/module/textStyle.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_cumtchat/main.dart';
class settings_page extends StatefulWidget{
  @override
  _settings createState() => _settings();
}

class _settings extends State<settings_page>{
  @override
  Widget build(BuildContext context) {
    return Hero(tag: "settings", child: Material(
      child: Scaffold(
          appBar: AppBar(
            elevation: 1,
            iconTheme: IconThemeData(
                color: Colors.black
            ),
            backgroundColor: Colors.white,
            title: Text("设置",style: TextStyle(color: Colors.black),
            ),
          ),
          body: Container(
            color: Colors.white,
            child:ListView(
              children: [
                ListTile(
                  leading: Container(
                    width: 20.w,
                    height: 20.w,
                    child: Image.asset("images/userPage/night.png",fit: BoxFit.cover,),
                  ),
                  title: Text("夜间模式",style: userPageText,),
                ),
                ListTile(
                  leading: Container(
                    width: 20.w,
                    height: 20.w,
                    child: Image.asset("images/userPage/logout.png",fit: BoxFit.cover,),
                  ),
                  onTap: (){
                    Navigator.pushNamedAndRemoveUntil(context, '/', (route) => route == null);
                  },
                  title: Text("退出登录",style: userPageText,),
                )
              ],
            ),
          )
      ),
    ));
  }
}