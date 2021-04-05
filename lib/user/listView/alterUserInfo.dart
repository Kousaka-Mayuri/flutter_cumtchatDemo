import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cumtchat/data/http.dart';
import 'package:flutter_cumtchat/data/user.dart';
import 'package:flutter_cumtchat/module/colors.dart';
import 'package:flutter_cumtchat/module/function.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_cumtchat/module/textStyle.dart';

class alterPage extends StatefulWidget{
  @override
  alter_page createState() => alter_page();
}

class alter_page extends State<alterPage>{
  DateTime selectedData = new DateTime.now();
  String description;
  String name;
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
  var head = 'https://moreover.atcumt.com/userinfo//userinfo';
  putHead()async{
    Dio dio = new Dio();
    Response response = await dio.put(
        head,
        options: Options(
            headers: {
              'token':user.token
            }
        ),
        data: {
          'head':user.head
        }
    );
    print(response.data);
  }
  openGallery()async{
    var image = await ImagePicker.pickImage(source:ImageSource.gallery);
    setState(() {
      _imagePath = image;
    });
    user.head = await imageToBase64(image);
    user.getBytes();
    print("1111"+user.head);
    putHead();
  }
  @override
  Widget build(BuildContext context) {
    void alertName(){
      showDialog(
        context: context,
        builder: (context){
          return AlertDialog(
              title: Text("修改姓名"),
              content: TextField(
                onChanged: (String value){
                  setState(() {
                        user.willNickname = value;
                  });
                },
              ),
            actions:<Widget> [
              FlatButton(onPressed: (){Navigator.of(context).pop();}, child: Text("再想想")),
              FlatButton(onPressed: (){
                setState(() {
                  user.nickname = user.willNickname;
                  http.alertNickname();
                });
                Navigator.of(context).pop();
              }, child: Text("我确认"))
            ],
          );
        }
      );
    }
    void alertSex(){
      showDialog(
          context: context,
      builder: (context){
            return AlertDialog(
              title: Container(
                alignment: Alignment.center,
                child: Text("修改性别"),
              ),
              actions: [
                Container(

                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FlatButton(onPressed: (){
                        setState(() {
                          user.sex = "男";
                        });
                        Navigator.of(context).pop();}, child: Text("男")),
                      FlatButton(onPressed: (){
                        setState(() {
                          user.sex = "女";
                        });
                        Navigator.of(context).pop();
                      }, child: Text("女"))
                    ],
                  ),
                )
              ],
            );
      }
      );
    }
    void alertDescription(){
      showDialog(context: context,
      builder: (context){
        return AlertDialog(
          title: Container(
            alignment: Alignment.center,
            child: Text("修改个性签名"),
          ),
          content: TextField(
            onChanged: (String value){
              setState(() {
                description = value;
              });
            },
          ),
          actions: [
            FlatButton(onPressed: (){
              Navigator.of(context).pop();}, child: Text("再想想")),
            FlatButton(onPressed: (){
              setState(() {
                user.description = description;
              });
              Navigator.of(context).pop();
            }, child: Text("我确认"))
          ],
        );
      });
    }
    void selectBirthdayData()async{
      final DateTime data = await showDatePicker(
          context: context, initialDate: selectedData,
          firstDate: DateTime(1970,1,1),
          lastDate:DateTime(2030,12,31));
      if(data == null) return;
      setState(() {
        user.birthdayDate = data;
      });
    }
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(55.h),
        child: AppBar(
          iconTheme: IconThemeData(
            color: HexColor("#747474")
          ),
          elevation: 1.5,
          backgroundColor: Colors.white,
          title: Text("账号资料",style: TextStyle(color: HexColor("#1E1E1E")),),
        ),
      ),
      body: Container(
        color: HexColor("#F4F4F4"),
          child: Container(
            margin: EdgeInsets.fromLTRB(0, 15.h, 0, 0),
            child: ListView(
              children: [
                InkWell(
                  onTap: (){
                    openGallery();
                    setState(() {

                    });
                  },
                  child: Container(

                    alignment: Alignment.center,
                    width: 350.w,
                    height: 90.h,
                    color: Colors.white,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          margin: EdgeInsets.fromLTRB(8.w, 0, 0, 0),
                          child: Text("头像",style: alterText,),
                        ),
                        Container(
                          alignment: Alignment.centerRight,
                          width: 280.w,
                          height: 90.h,
                          child: Container(
                            width: 70.w,
                            height: 70.w,
                            decoration: BoxDecoration(

                                borderRadius: BorderRadius.circular(40.w)
                            ),

                            alignment: Alignment.center,
                              child: _imageView(_imagePath),
                          ),
                        ),
                        rightArrows()
                      ],
                    ),
                  ),
                ),
                listDivider(),
                InkWell(
                  onTap: (){
                    alertName();
                  },
                  child: Container(

                    alignment: Alignment.center,
                    width: 350.w,
                    height: 40.h,
                    color: Colors.white,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          margin: EdgeInsets.fromLTRB(10.w, 0, 0, 0),
                          child: Text("昵称",style: alterText,),
                        ),
                        Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [Container(
                                alignment: Alignment.centerRight,
                                width: 200.w,
                                child: Text(user.nickname,maxLines: 1,style: userDataText,),
                              ),
                                rightArrows(),],
                            ))
                      ],
                    ),
                  ),
                ),
                listDivider(),
                InkWell(
                  onTap: (){
                      alertSex();
                  },
                  child: Container(
                    alignment: Alignment.center,
                    width: 350.w,
                    height: 40.h,
                    color: Colors.white,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          margin: EdgeInsets.fromLTRB(10.w, 0, 0, 0),
                          child: Text("性别",style: alterText,),
                        ),
                        Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [Container(
                                alignment: Alignment.centerRight,
                                width: 200.w,
                                child: Text(user.sex,maxLines: 1,style: userDataText,),
                              ),
                                rightArrows(),],
                            ))
                      ],
                    ),
                  ),
                ),
                listDivider(),
                InkWell(
                  onTap: (){
                    selectBirthdayData();
                  },
                  child: Container(

                    alignment: Alignment.center,
                    width: 350.w,
                    height: 40.h,
                    color: Colors.white,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          margin: EdgeInsets.fromLTRB(10.w, 0, 0, 0),
                          child: Text("出生年月",style: alterText,),
                        ),
                        Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [Container(
                                alignment: Alignment.centerRight,
                                width: 200.w,
                                child: Text(user.birthdayDate.toString().substring(0,10),maxLines: 1,style: userDataText,),
                              ),
                                rightArrows(),],
                            ))
                      ],
                    ),
                  ),
                ),
                listDivider(),
                InkWell(
                  onTap: (){
                    alertDescription();
                  },
                  child: Container(

                    alignment: Alignment.center,
                    width: 350.w,
                    height: 40.h,
                    color: Colors.white,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          margin: EdgeInsets.fromLTRB(10.w, 0, 0, 0),
                          child: Text("个性签名",style: alterText,),
                        ),
                        Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                                  children: [Container(
                                    alignment: Alignment.centerRight,
                                    width: 200.w,
                                    child: Text(user.description,maxLines: 1,overflow: TextOverflow.ellipsis,style: userDataText,),
                                  ),
                              rightArrows(),],
                        ))
                      ],
                    ),
                  ),
                )
              ],
            ),
          )
      ),
    );
  }
}

Widget listDivider(){
  return Container(
    alignment: Alignment.center,
     child: Divider(
        color: HexColor("#E8E8E8"),
        height: 1.h,
        thickness: 1.5.w,
      )
  );
}
Widget rightArrows(){
  return Container(
    alignment: Alignment.center,
    width: 30.w,
    height: 30.w,
    child: Icon(Icons.arrow_forward_ios,color: Colors.grey,),
  );
}
