import 'package:flutter/material.dart';
import 'package:flutter_cumtchat/home/tabBars/module/talkModule.dart';

class talk extends StatefulWidget{
  @override
  _talk createState() => _talk();
}

class _talk extends State<talk>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          child: ScrollConfiguration(
            behavior: CusBehavior(),
            child: ListView.builder(
                itemCount: 5,
                itemBuilder: (BuildContext context,index){
              return talkCard();
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