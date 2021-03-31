import 'package:flutter/material.dart';
import 'package:flutter_cumtchat/module/colors.dart';
import 'package:flutter_cumtchat/module/textStyle.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:like_button/like_button.dart';
class commentCard extends StatefulWidget{
  @override
  comment_card createState()=> comment_card();
}

class comment_card extends State<commentCard>{
  @override
  Widget build(BuildContext context) {
    void comment() {
      final top = 12.h;
      final txBottom = 40.h;
      final txHeight = 100.h;
      showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (ctx) {
          return StatefulBuilder(builder: (ctx2, state) {
            return Container(
              height: MediaQuery.of(ctx2).viewInsets.bottom +
                  txHeight +
                  top +
                  txBottom,
              color: Colors.white,
              child: Stack(
                children: <Widget>[
                  Positioned(
                      left: 12.h,
                      bottom: (MediaQuery.of(ctx2).viewInsets.bottom < 0)
                          ? 0
                          : MediaQuery.of(ctx2).viewInsets.bottom,
                      right: 12.h,
                      top: top,
                      child: Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: <Widget>[
                                Expanded(
                                    child: Container(
                                      padding: EdgeInsets.all(8.w),
                                      height: txHeight,
                                      decoration: BoxDecoration(
                                          color: loginTFColor,
                                          borderRadius: BorderRadius.circular(10.w)
                                      ),
                                      child: TextField(
                                        // scrollPadding: EdgeInsets.zero,
                                        autofocus: true,
                                        maxLines: 4,
                                        style: TextStyle(
                                            fontSize: 15.sp, color: Colors.black),
                                        decoration: InputDecoration(
                                            contentPadding: EdgeInsets.zero,
                                            isDense: true,
                                            border: InputBorder.none),
                                      ),
                                    )),

                              ],
                            ),
                            Row(
                              children:<Widget> [
                                /*Container(
                                  height: txBottom,
                                  child: Image.asset(
                                    "images/pic.png",
                                    height: 30.h,
                                    width: 30.h,
                                  ),
                                ),*/
                                Expanded(
                                  child: GestureDetector(
                                    onTap: (){
                                      Navigator.of(context).pop();
                                    },
                                    child: Container(
                                      alignment: Alignment.bottomRight,
                                      margin: EdgeInsets.fromLTRB(0, 10.h, 0, 0),
                                      child: Text("发送",
                                          style: TextStyle(
                                              fontSize: 15.sp,
                                              color: Colors.orange)),
                                    ),),
                                )
                              ],
                            )
                          ],
                        ),
                      ))
                ],
              ),
            );
          });
        },
      );
    }//评论弹出窗口
    return Container(
      decoration: BoxDecoration(
        color: tabBar
      ),
      margin: EdgeInsets.fromLTRB(10.w, 0, 0, 0),
      child: GestureDetector(
        onTap: (){
          comment();
        },
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
                      ),

                    ],
                  ),
                ),

              ],
            ),
            Container(
              height: 40.h,
              width: 350.w,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children:<Widget> [
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 10.h, 20.w, 0),
                    child: LikeButton(
                      likeCount: 20,
                    ),
                  )
                ],
              ),
            ),
            Container(
              height: 30.h,
              width: 350.w,
              decoration: BoxDecoration(
                  color: tabBar
              ),
            )
          ],
        ),
      )
    );
  }
}