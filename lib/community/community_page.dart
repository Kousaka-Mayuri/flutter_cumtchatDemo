import 'package:flutter/material.dart';
import 'package:flutter_cumtchat/community/community_expandPage.dart';
import 'package:flutter_cumtchat/community/module/communityIcon.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class community_page extends StatefulWidget{
  @override
  communityPage createState() => communityPage();
}

class communityPage extends State<community_page>{
  @override
  click1(String community){
    /*Navigator.push(context,MaterialPageRoute(builder: (_)=>communityExPandCard("Bangdream")));*/
      Navigator.of(context).push(
        PageRouteBuilder(
          pageBuilder: (BuildContext context, Animation<double> animation,
              Animation<double> secondaryAnimation) {
            //目标页面
            return communityExPandCard(community: community,);
          },
          //打开新的页面用时
          transitionDuration: Duration(milliseconds: 400),
          //关半页岩用时
          reverseTransitionDuration: Duration(milliseconds: 400),
          //过渡动画构建
          transitionsBuilder: (
              BuildContext context,
              Animation<double> animation,
              Animation<double> secondaryAnimation,
              Widget child,
              ) {
            //渐变过渡动画
            return FadeTransition(
              // 透明度从 0.0-1.0
              opacity: Tween(begin: 0.0, end: 1.0).animate(
                CurvedAnimation(
                  parent: animation,
                  //动画曲线规则，这里使用的是先快后慢
                  curve: Curves.fastOutSlowIn,
                ),
              ),
              child: child,
            );
          },
        ),
      );

  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(40.h),
        child: AppBar(
          backgroundColor: Colors.white,
          title: Container(
            margin: EdgeInsets.fromLTRB(20.w, 0, 0, 20.w),
            child: Text("社区",style: TextStyle(fontSize:20.sp,color: Colors.black),),
          )
        ),
      ),
      body: SingleChildScrollView(
          child: Column(
            children:<Widget> [
                Container(

                  child: Column(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.fromLTRB(20.w, 20.h, 0, 0),
                        alignment: Alignment.centerLeft,
                        child: Text("官方社区",style: TextStyle(fontSize: 14.sp,
                            fontWeight: FontWeight.bold),),
                      ),
                      Divider(
                          indent: 20.w,
                          endIndent: 250.w,
                          height: 10.h,
                          thickness: 2.h,
                      ),
                      Container(
                          margin: EdgeInsets.fromLTRB(20.w, 20.h, 0, 0),
                        width: 350.w,
                           child: Wrap(

                              children:<Widget> [
                                communityIcon('images/bangdream.jpg',click1 , "Bangdream"),
                                /*communityIcon('images/yuanshen.jpg', click1, " 原神"),
                                communityIcon('images/steam.jpg', click1, " Steam"),
                                communityIcon('images/steam.jpg', click1, " Steam"),*/
                              ],
                            )
                      ),
                    ],
                  ),
                ),//官方社区
                Container(
                  child: Column(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.fromLTRB(20.w, 20.h, 0, 0),
                        alignment: Alignment.centerLeft,
                        child: Text("用户社区",style: TextStyle(fontSize: 14.sp,
                            fontWeight: FontWeight.bold),),
                      ),
                      Divider(
                        indent: 20.w,
                        endIndent: 250.w,
                        height: 10.h,
                        thickness: 2.h,
                      ),
                      Container(
                        alignment: Alignment.center,
                        width: 350.w,
                        child: Wrap(
                          children: <Widget>[
                          ],
                        ),
                      ),
                    ],
                  ),
                )
            ],
          ),
      ),
    );
  }
}