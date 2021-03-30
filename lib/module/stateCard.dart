import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cumtchat/module/colors.dart';
import 'package:flutter_cumtchat/user/collect/friends.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class stateCard extends StatefulWidget{
  final String num1;
  final String num2;
  final String num3;
  const stateCard(this.num1,this.num2,this.num3,{Key key});
  @override
  state_card createState() => state_card();
}

class state_card extends State<stateCard>{

  processInt(String num){
    if(double.parse(num)<10000){
      return num;
    }
    else{
      return (double.parse(num)/10000).toString() + "万";
    }
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          state(
              text:"获赞",
              number:processInt(widget.num1),
              code: 2,
          ),
          Container(
            height: 30.h,
            child: VerticalDivider(
              thickness: 1.w,
            ),
          ),
          state(
              text:"关注",
              number:processInt(widget.num2),
              code: 0,
          ),
          Container(
            height: 30.h,
            child: VerticalDivider(
              thickness: 1.w,
            ),
          ),
          state(
              text:"粉丝",
              number:processInt(widget.num3),
              code: 1,
          )
        ],
      ),
    );
  }
}


class state extends StatelessWidget{
  final String number;
  final String text;
  final int code;
  const state({Key key,this.text,this.number,this.code});
  @override
  Widget build(BuildContext context) {
    showAgree(){
      showDialog(context: context,
      builder: (context){
        return AlertDialog(
          content: Container(
            height: 70.h,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text("累计获赞次数",
                  style: TextStyle(
                      color: HexColor("#C4C4C4"),
                      fontSize: 12.sp
                  ),),
                Text(number,
                  style: TextStyle(
                      color: HexColor("#202020"),
                      fontSize: 16.sp
                  ),)
              ],
            ),
          )

        );
      });
    }
    return GestureDetector(
      onTap: (){
        if(code==2) showAgree();
        else Navigator.push(
            context, CupertinoPageRoute(builder: (context)=>
            friends(code)
        ));
      },
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(number,style: TextStyle(
                fontSize: 14.sp
            ),),
            Text(text,
              style: TextStyle(
                  fontSize: 14.sp,
                  color: HexColor("#BDBDBD")
              ),)
          ],
        ),
      ),
    );
  }
}