import 'package:flutter/material.dart';
import 'package:flutter_cumtchat/module/colors.dart';
import 'package:flutter_cumtchat/module/textStyle.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class commentCard extends StatefulWidget{
  @override
  comment_card createState()=> comment_card();
}

class comment_card extends State<commentCard>{
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: tabBar
      ),
      margin: EdgeInsets.fromLTRB(10.w, 0, 0, 0),
      child: Column(
        children: <Widget>[
          Container(
            height: 20.h,
            width: 350.w,
            decoration: BoxDecoration(
                color: tabBar
            ),
          ),
          Row(
            children:<Widget> [
              Container(
                width: 40.w,
                height: 40.w,
                decoration: BoxDecoration(
                    border: new Border.all(width: 0.5,color: Colors.white),
                    borderRadius: BorderRadius.circular(80.w),
                    image: DecorationImage(
                        image:AssetImage('images/touxiang2.jpg'),
                        fit: BoxFit.cover
                    )
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(10.w, 0, 10.w, 0),
                width: 280.w,
                child: Column(

                  children:<Widget> [
                    Container(

                      alignment: Alignment.centerLeft,
                      child: Text("我是彩笔",style: commentCardText,),
                    ),
                    Container(
                      child: Text("建议多多练习，不要发这些无意义的话。加油，终有一天你可以fc六兆年的"),
                    )
                  ],
                ),
              ),

            ],
          ),
          Container(
            height: 30.h,
            width: 350.w,
            child: Row(
              children:<Widget> [
                Container()
              ],
            ),
          ),
          Container(
            height: 50.h,
            width: 350.w,
            decoration: BoxDecoration(
              color: tabBar
            ),
          )
        ],
      )
    );
  }
}