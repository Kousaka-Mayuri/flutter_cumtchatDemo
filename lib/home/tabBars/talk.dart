import 'package:flutter/material.dart';
import 'package:flutter_cumtchat/home/tabBars/module/talkModule.dart';
import 'package:flutter_cumtchat/module/colors.dart';

class talk extends StatefulWidget{
  @override
  _talk createState() => _talk();
}

class _talk extends State<talk>{
  @override
  click(){
    Navigator.of(context).push(
      PageRouteBuilder(
        pageBuilder: (BuildContext context, Animation<double> animation,
            Animation<double> secondaryAnimation) {
          //目标页面
          return talkExpand();
        },
        //打开新的页面用时
        transitionDuration: Duration(milliseconds: 500),
        //关半页岩用时
        reverseTransitionDuration: Duration(milliseconds: 500),
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
        body: Container(
          color: backgroundColor,
          child: ScrollConfiguration(
            behavior: CusBehavior(),
            child: ListView.builder(
                itemCount: 1,
                itemBuilder: (BuildContext context,index){
              return talkCard(click);
            }),
          ),
        ),
    );
  }
}

class CusBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return super.buildViewportChrome(context, child, axisDirection);
  }
}