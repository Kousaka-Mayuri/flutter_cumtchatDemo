import 'package:flutter/material.dart';
import 'package:flutter_cumtchat/home/tabBars/actExpand/actExpansion.dart';
jumpActivityHero(BuildContext context){
  Navigator.of(context).push(
    PageRouteBuilder(
      pageBuilder: (BuildContext context, Animation<double> animation,
          Animation<double> secondaryAnimation) {
        //目标页面
        return actExpansion();
      },
      //打开新的页面用时
      transitionDuration: Duration(milliseconds: 800),
      //关半页岩用时
      reverseTransitionDuration: Duration(milliseconds: 800),
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