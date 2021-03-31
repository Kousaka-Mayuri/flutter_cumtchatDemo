import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cumtchat/module/colors.dart';
import 'package:flutter_cumtchat/user/collect/otherUserPage.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class entry extends StatefulWidget{
  final List dataList;
  @override
  const entry(this.dataList,{Key key});
  _entry createState() => _entry();
}

class _entry extends State<entry>{
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: HexColor("#FFFFFF")
      ),
        child: ListView.builder(
          itemCount: widget.dataList.length,
          itemBuilder: (BuildContext context,int index){
            return GestureDetector(
                onTap: (){
                  Navigator.push(context,
                    CupertinoPageRoute(builder: (context)=>
                      other()
                    )
                );
                },
                child:  Container(
                  margin: EdgeInsets.fromLTRB(0, 10.h, 0, 0),
                    height: 70.h,
                    width: 350.w,
                    child:Column(
                      children: [
                        Row(
                          children: [
                            Container(
                              margin: EdgeInsets.fromLTRB(10.w, 0, 0, 0),
                              width: 50.w,
                              height: 50.w,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(40.w),
                                  image: DecorationImage(
                                      image: AssetImage(widget.dataList[index]['imgsrc'])
                                  )
                              ),
                            ),
                            Container(
                              height: 40.w,
                              width: 200.w,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Container(
                                    alignment: Alignment.centerLeft,
                                    child: Text(widget.dataList[index]['name'],
                                    style: TextStyle(
                                      color: HexColor("#3A3A3A"),
                                      fontSize: 12.sp
                                    ),
                                    ),
                                  ),
                                  Container(
                                    alignment: Alignment.centerLeft,
                                    child: Text(widget.dataList[index]['description'],
                                      style: TextStyle(
                                        color: HexColor("#ACACAC"),
                                        fontSize: 12.sp
                                      ),
                                      maxLines: 1,overflow: TextOverflow.ellipsis,
                                    ),
                                  )
                                ],
                              )
                            ),
                            Expanded(
                                child: Container(
                                  height: 28.h,
                                  margin: EdgeInsets.fromLTRB(0, 0, 8.w, 0),
                                  alignment: Alignment.centerRight,
                                  child:GestureDetector(
                                    onTap: (){

                                    },
                                    child: Container(
                                      alignment: Alignment.center,
                                      width: 70.w,
                                      height: 25.h,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5.w),
                                        color: HexColor("#E7E7E7")
                                      ),
                                      child: Text("已关注",
                                        style: TextStyle(
                                          color: HexColor("#999999")
                                        ),),
                                    ),
                                  )
                                )
                            )
                          ],
                        ),
                        Divider(
                          height: 10.h,
                          thickness: 3.h,
                          color: HexColor("#F3F3F3"),
                        ),
                      ],
                    )
                )
            );
          })
    );
  }
}