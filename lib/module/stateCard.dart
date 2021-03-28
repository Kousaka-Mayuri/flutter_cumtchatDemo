import 'package:flutter/material.dart';
import 'package:flutter_cumtchat/module/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class stateCard extends StatefulWidget{
  final int num1;
  final int num2;
  final int num3;
  const stateCard(this.num1,this.num2,this.num3,{Key key});
  @override
  state_card createState() => state_card();
}

class state_card extends State<stateCard>{

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          state("动态", widget.num1),
          Container(
            height: 30.h,
            child: VerticalDivider(
              thickness: 1.w,
            ),
          ),
          state("关注", widget.num2),
          Container(
            height: 30.h,
            child: VerticalDivider(
              thickness: 1.w,
            ),
          ),
          state("粉丝", widget.num3)
        ],
      ),
    );
  }
}

class state extends StatelessWidget{
  final int number;
  final String text;
  const state(this.text,this.number,{Key key});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(number.toString(),style: TextStyle(
            fontSize: 14.sp
          ),),
          Text(text,
          style: TextStyle(
            fontSize: 14.sp,
            color: HexColor("#BDBDBD")
          ),)
        ],
      ),
    );
  }
}