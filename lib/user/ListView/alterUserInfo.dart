import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cumtchat/module/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_cumtchat/module/textStyle.dart';
class alterPage extends StatefulWidget{
  @override
  alter_page createState() => alter_page();
}

class alter_page extends State<alterPage>{
  var _imagePath;
  Widget _imageView(imagePath){
    if(imagePath == null){
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
                image: FileImage(imagePath),
                fit: BoxFit.cover
            )
        ),
      );
    }
  }
  openGallery()async{
    var image = await ImagePicker.pickImage(source:ImageSource.gallery);
    setState(() {
      _imagePath = image;
    });
  }
  @override
  Widget build(BuildContext context) {
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
                                child: Text("我是彩笔",maxLines: 1,style: userDataText,),
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
                                child: Text("男",maxLines: 1,style: userDataText,),
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
                                child: Text("2001-01-11",maxLines: 1,style: userDataText,),
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
                                    child: Text("我是个zz，干啥啥不行，打啥啥不会，干饭第一名，小废物就是我",maxLines: 1,overflow: TextOverflow.ellipsis,style: userDataText,),
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