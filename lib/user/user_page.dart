import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cumtchat/data/http.dart';
import 'package:flutter_cumtchat/login/login_page.dart';
import 'package:flutter_cumtchat/module/cardCon.dart';
import 'package:flutter_cumtchat/module/colors.dart';
import 'package:flutter_cumtchat/module/userCard.dart';
import 'package:flutter_cumtchat/user/ListView/settings_page.dart';
import 'package:flutter_cumtchat/user/collect/collectPage.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_cumtchat/module/button.dart';

class user_page extends StatefulWidget{
  @override
  _user_page createState() => _user_page();
}

class _user_page extends State<user_page>
{
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  showFeedback(){
    showDialog(context: context,builder: (context){
      return AlertDialog(
        title: Text("请给予我们意见"),
        content: Container(
          decoration: BoxDecoration(
            color: loginTFColor,
            borderRadius: BorderRadius.circular(10.w)
          ),
          child: TextField(
            maxLines: 4,
            decoration: InputDecoration(
              border: InputBorder.none
            ),
          ),
        ),
        actions: [
          FlatButton(onPressed: (){
            Navigator.of(context).pop();
          }, child: Text("确定")),
          FlatButton(onPressed: (){
            Navigator.of(context).pop();
          }, child: Text("不了")),
        ],
      );
    });
  }
  bool isSigned = false;
  showToast(String text){
    Fluttertoast.showToast(msg: text);
  }
  judgeSign(BuildContext context){
    if(isSigned == false){
      return RaisedButton(
        shape: StadiumBorder(),
        onPressed:(){
          setState(() {
            isSigned = true;
          });

          showToast("您已签到成功，经验+100");
          Navigator.of(context).pop();
        },
        child: Text("未签到"),
      );
    }
    else {
      return RaisedButton(
        shape: StadiumBorder(),
        onPressed: null,
        child: Text('已签到'),
      );
    }
  }
  showSignDialog(){
    showDialog(
        context: context,
        builder: (context){
          return AlertDialog(
            title: Text("每日签到"),
            actions: [
              judgeSign(context)
            ],
          );
    });
  }

  goSetting(){
    Navigator.of(context).push(MaterialPageRoute(builder: (context)=> settings_page()));
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize:  Size.fromHeight(250.h),//设置appBar高度,
        child:Container(
                  width: 350.w,
                  height: 250.h,
                  child: userCard(),
            )
      ),
      body:Container(
        width: 350.w,
        color: Colors.white,
        child: Column(
          children: [
            Divider(
              color: Colors.grey,
              height: 1.w,
              thickness: 0.2.w,
            ),
            Container(
              margin: EdgeInsets.fromLTRB(30.w, 15.h, 0, 10.h),
              alignment: Alignment.centerLeft,
              child: Text("服务"
              ,style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold
                ),),
            ),
            Container(
              alignment: Alignment.center,
              child: Wrap(
                children:<Widget> [

                  GestureDetector(
                    onTap: (){
                      showSignDialog();
                    },
                    child: textButton("images/userPage/sign.png",
                      name: "签到",),
                  ),
                  GestureDetector(
                    onTap: (){
                      Navigator.push(context,
                          CupertinoPageRoute(builder: (context)=>collect()));
                    },
                    child: textButton("images/userPage/collect.png",
                      name: "收藏",),
                  ),

                  GestureDetector(
                    onTap: (){
                      goSetting();
                    },
                    child:Hero(
                      tag: 'settings',
                      child: Material(
                        color: Colors.white,
                        child: textButton("images/userPage/setting.png",
                          name: "设置",
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      share();
                    },
                    child: textButton('images/userPage/invite.png',
                      name: "邀请",),
                  ),
                  GestureDetector(
                    onTap: (){
                      showFeedback();
                    },
                    child: textButton('images/userPage/back.png',
                    name: "反馈",)
                  )
                ],
              ),
            ),
          ],
        ),
      )
    );
  }
}

class user_CusBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}