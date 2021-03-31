import 'package:flutter/material.dart';
import 'package:flutter_cumtchat/module/colors.dart';
import 'package:flutter_cumtchat/module/textStyle.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class questionCard extends StatefulWidget{
  @override
  const questionCard({Key key});
  question_card createState() => question_card();
}

class question_card extends State<questionCard>{
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(10.w, 15.h, 10.w, 0),
      width: 300.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.w),
        color: tabBar
      ),
      child: Container(
          child: Column(
            children:<Widget> [
              Container(
                height: 10.h,
              ),
              Container(
                alignment: Alignment.center,
                child: Text("为什么梅苑不是一间宿舍一百多平方米啊？",maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: headline ,),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(15.w, 5.h, 0, 0),
                alignment: Alignment.centerLeft,
                child: Text("最佳回答：",style: TextStyle(color: HexColor("#86AF9B"),fontSize: 12.sp),),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(80.w, 5.h, 0, 0),
                alignment: Alignment.centerLeft,
                child: Text("因为你不是仌"),
              ),
              InkWell(
                onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>questionExpand()));
                },
                child: Container(
                  margin: EdgeInsets.fromLTRB(0.w, 5.h, 15.w, 0),
                  alignment: Alignment.centerRight,
                  child: Text("查看更多回答",style: questionText,),
                ),
              ),
              Container(
                height: 15.h,
              ),
            ],
          ),
      ),
    );
  }
}

class questionExpand extends StatefulWidget{
  @override
  question_expand createState() => question_expand();
}

class question_expand extends State<questionExpand>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(

      ),
    );
  }
}