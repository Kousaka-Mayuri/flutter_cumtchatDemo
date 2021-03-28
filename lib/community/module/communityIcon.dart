import 'package:flutter/material.dart';
import 'package:flutter_cumtchat/module/colors.dart';
import 'package:flutter_cumtchat/module/textStyle.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class communityIcon extends StatelessWidget{
  final String imgSrc;
  final Function() click;
  final String text;
  const communityIcon(this.imgSrc,this.click,this.text,{Key key});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(15.w, 5.h, 15.w, 0),
      child: Column(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(

            ),
            width: 80.w,
            height: 80.w,
            child: Container(
              child: IconButton(
                icon: Image.asset(imgSrc),
                onPressed: (){
                  click();
                },
              ),
            ),
          ),
          Text(text)
        ],
      ),
    );
  }
}

class communityExpandIcon extends StatelessWidget{
  final String src;
  final String text;
  const communityExpandIcon(this.src,this.text,{Key key});
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 100.h,
      width: 350.w,
      child: Row(
        children:<Widget> [
          Container(
            margin: EdgeInsets.fromLTRB(15.w, 5.h, 15.w, 0),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(src),
                fit: BoxFit.cover
              ),
              borderRadius: BorderRadius.circular(20.w)
            ),
            height: 60.w,
            width: 60.w,
          ),
          Container(
            alignment: Alignment.centerLeft,
            height: 60.w,
            width: 260.w,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(text,style: attentionText,),

                Text("1.6w人关注",style: TextStyle(
                  fontSize: 12.sp,
                  color: HexColor("#B3B3B3")
                ),)
              ],
            ),
          )
        ],
      ),
    );
  }
}