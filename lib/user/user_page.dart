import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cumtchat/login/login_page.dart';
import 'package:flutter_cumtchat/module/colors.dart';
import 'package:flutter_cumtchat/module/userCard.dart';
import 'package:flutter_cumtchat/user/ListView/settings_page.dart';
import 'package:flutter_cumtchat/user/collect/collectPage.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_cumtchat/module/button.dart';
class user_page extends StatefulWidget{
  @override
  _user_page createState() => _user_page();
}

class _user_page extends State<user_page>
{
  @override
  var _imagePath;
  pushImage(image)async{
    Dio dio = new Dio(
        BaseOptions(
            headers: {
              "Authorization":"161Y807CJQzcWP8vsmtBhfo8Q9sAUp4x",
              "Content-Type":"multipart/form-data"
            }
        )
    );
    Response response = await dio.post('https://sm.ms/api/v2/upload',
        data: {
          "smfile":image,
          "format":"json"
        }
        );
    print("2"+_imagePath.toString());
    print(response.data);
  }
  Future openGallery()async{
    // ignore: deprecated_member_use
    var image = await ImagePicker.pickImage(source:ImageSource.gallery);
    setState(() {
      _imagePath = image;
    });
    print(_imagePath.toString());
  }
  goSetting(){
    Navigator.of(context).push(MaterialPageRoute(builder: (context)=> settings_page()));
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize:  Size.fromHeight(250.h),//设置appBar高度,
        child:Container(
                  width: 350.w,
                  height: 250.h,
                  child: userCard(),
            )
      ),
      body:Container(
        width: 350.w,
        color: Colors.white,
        child: Column(
          children: [
            Divider(
              color: Colors.grey,
              height: 1.w,
              thickness: 0.2.w,
            ),
            Container(
              margin: EdgeInsets.fromLTRB(30.w, 15.h, 0, 10.h),
              alignment: Alignment.centerLeft,
              child: Text("服务"
              ,style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold
                ),),
            ),
            Container(
              alignment: Alignment.center,
              child: Wrap(
                children:<Widget> [
                  textButton("images/userPage/issue.png",
                  name: "发布",),
                  textButton("images/userPage/sign.png",
                  name: "签到",),
                  GestureDetector(
                    onTap: (){
                      Navigator.push(context,
                          CupertinoPageRoute(builder: (context)=>collect()));
                    },
                    child: textButton("images/userPage/collect.png",
                      name: "收藏",),
                  ),

                  GestureDetector(
                    onTap: (){
                      goSetting();
                    },
                    child:Hero(
                      tag: 'settings',
                      child: Material(
                        color: Colors.white,
                        child: textButton("images/userPage/setting.png",
                          name: "设置",
                        ),
                      ),
                    ),
                  ),
                  textButton('images/userPage/invite.png',
                  name: "邀请",)
                ],
              ),
            ),
          ],
        ),
      )
     /* Container(
        alignment: Alignment.center,
        child: Column(
          children: [
              Container(
                margin: EdgeInsets.fromLTRB(0, 70.h, 0, 0),
                width: 315.w,
                  height: 280.h,
                  decoration: BoxDecoration(
                    //boxShadow: [actConShadow],
                    color: tabBar,
                    borderRadius: BorderRadius.circular(20)
                  ),
                  child: Container(
                    margin: EdgeInsets.fromLTRB(17.5.w, 35.h, 0, 0),
                    child: ScrollConfiguration(
                      behavior: user_CusBehavior(),
                      child: ListView(
                       /* physics: NeverScrollableScrollPhysics(),*/
                        children: [
                          ListTile(
                            leading: Icon(Icons.account_box_outlined),
                            title: Text("个人信息"),
                            onTap: (){
                              Navigator.of(context).push(MaterialPageRoute(builder:
                                  (context)=>info_page()));
                            },
                          ),
                          ListTile(
                            leading: Icon(Icons.settings),
                            title: Text("设置"),
                            onTap: (){
                              Navigator.of(context).push(MaterialPageRoute(builder:
                                  (context)=>settings_page()));
                            },
                          ),
                          ListTile(
                            leading: Icon(Icons.info),
                            title: Text("关于"),
                          ),
                          ListTile(
                            onTap: (){
                              Navigator.of(context).pushAndRemoveUntil(new MaterialPageRoute
                                (builder: (context)=>login()),(route)=> route == null);
                            },
                            leading: Icon(Icons.login),
                            title: Text("退出登录"),
                          ),
                          ListTile(
                            title: Text("上传图片"),
                            onTap: (){
                                openGallery().then((value) =>pushImage(_imagePath));
                            },

                          ),
                          ListTile(
                            title: Text("登录图床"),
                            onTap: (){
                              loginSM();
                              print("object");
                            },
                          )
                        ],
                      ),
                    ),
                  )
              )
          ],
        ),
      ),*/
    );
  }
}

class user_CusBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}
loginSM() async{
  try{
    BaseOptions options = new BaseOptions(
      headers: {
          "Authorization":"161Y807CJQzcWP8vsmtBhfo8Q9sAUp4x"
      }
    );
    Dio dio = new Dio();
    Response response = await dio.post('https://sm.ms/api/v2/token',
        data: {
          'username':"SkyrocketCai",
          'password':"wj85990268"
        },
    );
    print(response.data);
  }catch(e){
    print(e.toString());
  }
}