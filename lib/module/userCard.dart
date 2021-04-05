import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cumtchat/data/user.dart';
import 'package:flutter_cumtchat/module/colors.dart';
import 'package:flutter_cumtchat/module/conShadow.dart';
import 'package:flutter_cumtchat/module/stateCard.dart';
import 'package:flutter_cumtchat/user/ListView/userInfo_page.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
class userCard extends StatefulWidget{
  @override
  _user createState() => _user();
}

class _user extends State<userCard>{
  @override
  var _imagePath;
  Widget _imageView(imagePath){
    if(user.head == null){
      return Container(
        width: 70.w,
        height: 70.w,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(60.w),
              image: DecorationImage(
                image: AssetImage('images/user.jpg'),
                fit: BoxFit.cover
              )
          ),
      );
    }
    else{
      return Container(
        width: 70.w,
        height: 70.w,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(60.w),
            image: DecorationImage(
                image: MemoryImage(user.bytes),
                fit: BoxFit.cover
            )
        ),
      );
    }
  }

  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          //boxShadow:[actConShadow],
          color: Colors.white
      ),
      alignment: Alignment.center,
      child: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.fromLTRB(10.w, 40.h, 10.w, 0),
        child:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 0, 10.w, 0),
                    alignment: Alignment.center,
                    width: 70.w,
                    height: 70.w,
                    child: InkWell(
                      child: _imageView(_imagePath),
                      onTap: (){

                      },
                    ),
                  ),
                  Container(
                    height: 70.w,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(user.nickname,style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                              Container(
                                width: 10.w,
                              ),
                              /*Text("LV 5",style: TextStyle(
                                fontSize: 11.sp,
                              ),),*/
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(1.5.w),
                          decoration: BoxDecoration(
                              border:Border.all(
                                  width: 1.w,
                                  color: HexColor("#E18BA8")
                              )
                          ),
                          child: Text("正式会员",style: TextStyle(
                              fontSize: 10.sp,
                              fontWeight: FontWeight.bold,
                              color: HexColor("#E18BA8")
                          ),),
                        ),
                        Container(
                          child: Text(user.exp.toString()+" 经验",style: TextStyle(fontSize: 11.sp,
                              color: HexColor("#A8A8A8")),),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                      child:InkWell(
                        onTap: (){
                          Navigator.of(context).push(CupertinoPageRoute(builder:
                              (context)=>info_page()));
                        },
                        child: Container(
                            margin: EdgeInsets.fromLTRB(0, 0, 10.w, 0),
                            alignment: Alignment.centerRight,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  "空间",style: TextStyle(
                                    fontSize: 12.sp,
                                    color: HexColor("#B2B2B2")
                                ),
                                ),
                                Icon(Icons.arrow_forward_ios,
                                  size: 12.sp,
                                  color: HexColor("#B2B2B2"),),
                              ],
                            )
                        ),
                      )
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0, 20.h, 0, 0),
              height: 60.h,
              width: 300.w,
              child: stateCard("110000","23","153")
            )
          ],
        )
      ),
    );
  }
}

