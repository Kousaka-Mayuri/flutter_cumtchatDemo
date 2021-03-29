import 'package:flutter/material.dart';
import 'package:flutter_cumtchat/home/tabBars/module/questionModule.dart';
import 'package:flutter_cumtchat/module/colors.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:oktoast/oktoast.dart';

class question extends StatefulWidget{
  @override
  _question createState() => _question();
}
List<String> picture = ['images/swiper1.jpg','images/swiper2.jpg','images/swiper3.jpg'];
class _question extends State<question>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Container(
        color: backgroundColor,
        child: ScrollConfiguration(
          behavior: CusBehavior(),
          child: ListView.builder(
            itemCount: 7,
              itemBuilder: (BuildContext context,int index){
                return questionCard();
              }),
        ),
      )
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