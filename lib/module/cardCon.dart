import 'dart:typed_data';

import 'package:flutter_cumtchat/home/tabBars/actExpand/actExpansion.dart';
import 'package:flutter_cumtchat/user/collect/otherUserPage.dart';
import 'package:flutter_share_me/flutter_share_me.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_cumtchat/module/button.dart';
import 'package:flutter_cumtchat/module/colors.dart';
import 'package:flutter_cumtchat/module/imageCon.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:like_button/like_button.dart';
import 'package:flutter_cumtchat/data/user.dart';
import 'package:dio/dio.dart';
List<String> pic =[
  'images/scr1.jpg','images/scr3.jpg','images/scr3.jpg'
];
String likeImg ='images/shoucang.png';

class actCard extends StatefulWidget{
  final String description;
  final String publisher;
  final int star;
  final String id;
  final String detail;
  final String time;
  final String location;
  final List picList;
  final String title;
  final Uint8List head;
  const actCard({Key key,
    this.description,
    this.id,
    this.publisher,this.star,
  this.detail,this.time,this.location,
  this.picList,
    this.head,
  this.title});
  @override
  _act createState() => _act();
}
class _act extends State<actCard>{
  @override
  void initState() {
    super.initState();
     likeImg = 'images/shoucang.png';

  }
  @override
  Widget buildPic(List a){
    List<Widget> picList = [];
    Widget content;
    for(var item in a){
      picList.add(
          imageCon(item)
      );
    }
    content = new Wrap(
      children: picList,
    );
    return content;
  }
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
                                    child:Container(
                                      alignment: Alignment.bottomRight,
                                      margin: EdgeInsets.fromLTRB(0, 10.h, 0, 0),
                                      child: Text("发送",
                                          style: TextStyle(
                                              fontSize: 15.sp,
                                              color: Colors.orange)),
                                    ),)
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
    return InkWell(
      highlightColor: Colors.transparent,
      radius: 0,
      onTap: (){
          Navigator.of(context).push(
            PageRouteBuilder(
              pageBuilder: (BuildContext context, Animation<double> animation,
                  Animation<double> secondaryAnimation) {
                //目标页面
                return actExpansion(
                  publisher: widget.publisher,
                  title: widget.title,
                  location: widget.location,
                  time: widget.time,
                  star: widget.star,
                  detail: widget.detail,
                  id: widget.id,
                  picList: widget.picList,
                  exPicList: widget.picList,
                );
              },
              //打开新的页面用时
              transitionDuration: Duration(milliseconds: 800),
              //关半页岩用时
              reverseTransitionDuration: Duration(milliseconds: 800),
              //过渡动画构建
              transitionsBuilder: (
                  BuildContext context,
                  Animation<double> animation,
                  Animation<double> secondaryAnimation,
                  Widget child,
                  ) {
                //渐变过渡动画
                return FadeTransition(
                  // 透明度从 0.0-1.0
                  opacity: Tween(begin: 0.0, end: 1.0).animate(
                    CurvedAnimation(
                      parent: animation,
                      //动画曲线规则，这里使用的是先快后慢
                      curve: Curves.fastOutSlowIn,
                    ),
                  ),
                  child: child,
                );
              },
            ),
          );

      },
      child:Hero(
        tag: widget.id,
        child:  Material(
          child: Container(
              margin: EdgeInsets.fromLTRB(0,8.h, 0, 0),
              decoration: BoxDecoration(
                //boxShadow:[actConShadow],
                  color: HexColor("#FEFEFE"),
                  borderRadius: BorderRadius.circular(6.w)
              ),
              width: 280.w,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    height: 20.h,
                  ),
                  Row(
                    children: <Widget>[
                      GestureDetector(
                        onTap: (){
                          Navigator.of(context).push(CupertinoPageRoute(builder: (context)=>
                          other()
                          ));
                        },
                        child: Container(
                          margin: EdgeInsets.fromLTRB(17.5.w, 0, 0, 0),
                          width: 52.5.w,
                          height:56.h,
                          child: Image.memory(widget.head),
                        ),
                      ),
                      Column(
                        children: <Widget>[
                          Text(widget.publisher),
                          Divider(height: 10.h,),
                          Text("一个zz")
                        ],
                      )
                    ],
                  )
                  ,//头像信息处
                  Container(
                    alignment: Alignment.centerLeft,
                    margin: EdgeInsets.fromLTRB(45.w, 17.5.h, 0, 0),
                    child: Text(widget.description),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(0,17.5.h, 0, 0),
                    height: 70.h,
                    child:Container(
                      margin: EdgeInsets.fromLTRB(40.w, 0, 0, 40.w),
                      width: 350.w,
                      child:  buildPic(widget.picList),
                    )
                  ),//图片处
                  Container(
                    margin: EdgeInsets.fromLTRB(35.w, 7.h, 0, 0),
                    height: 70.h,
                    width: 300.w,
                    child: Row(
                      children: <Widget>[
                        homeClickButton("images/fenxiang.png",share),
                        homeClickButton("images/pinglun.png",comment),
                        Expanded(child: like(widget.star,widget.id))
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(50.w, 0, 0, 0),
                    alignment: Alignment.centerLeft,
                    child: InkWell(
                        onTap: (){
                          showModalBottomSheet(context: context,
                              builder: (ctx){
                                return StatefulBuilder(
                                    builder: (context,ctx2)=>
                                        Container(
                                          color: Colors.white,
                                          child:Stack(
                                            children: [
                                              Positioned(
                                                  child: Container(
                                                      margin: EdgeInsets.fromLTRB(20.w, 20.h, 20.w,20.h),
                                                      child: ScrollConfiguration(
                                                        behavior: CusBehavior(),
                                                        child: ListView.builder(
                                                            itemCount: 10,
                                                            itemBuilder:(BuildContext context,int index){
                                                              return Row(
                                                                children: [
                                                                  Container(
                                                                    alignment: Alignment.center,
                                                                    width: 260.w,

                                                                    child: GestureDetector(
                                                                      onTap: (){
                                                                        comment();
                                                                      },
                                                                      child: Row(
                                                                        children: [
                                                                          Container(
                                                                            alignment: Alignment.center,
                                                                            width: 30.h,
                                                                            height: 30.h,
                                                                            decoration: BoxDecoration(
                                                                              image: DecorationImage(
                                                                                image: AssetImage('images/touxiang.jpg'),
                                                                                fit: BoxFit.cover
                                                                              )
                                                                            ),
                                                                          ),
                                                                          Container(
                                                                            width: 200.w,
                                                                            margin: EdgeInsets.fromLTRB(10.w, 10.h, 0, 0),
                                                                            child: Column(
                                                                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                                              children: [
                                                                                Container(
                                                                                  alignment: Alignment.centerLeft,
                                                                                  child: Text("我是彩笔"),
                                                                                ),
                                                                                Container(
                                                                                  alignment: Alignment.centerLeft,
                                                                                  child: Text("今天天气不错",
                                                                                  style: TextStyle(
                                                                                    color: Colors.grey
                                                                                  ),),
                                                                                )
                                                                              ],
                                                                            ),
                                                                          )
                                                                        ],
                                                                      ),
                                                                    )
                                                                  ),
                                                                  Expanded(
                                                                      child:Container(
                                                                        margin: EdgeInsets.fromLTRB(0, 10.h, 0, 0),
                                                                        child: like(widget.star,widget.id),
                                                                      )
                                                                  )
                                                                ],
                                                              );
                                                            }),
                                                      )
                                                  )
                                              )
                                            ],
                                          ),
                                        )
                                );
                              }
                          );
                        },
                        child: InkWell(
                            highlightColor: Colors.transparent,
                            radius: 0,
                            child:Container(
                              width: 100.w,
                              height: 30.h,
                              child:  Text("点击查看评论",style: TextStyle(
                                  color: Colors.grey,fontSize:12.sp,
                                  fontWeight: FontWeight.bold ),),
                            )
                        )
                    ),
                  ),
                  Container(
                    height: 20.h,
                  ),
                ],

              )
          ),
        )
      )
    );
  }
}//主页活动卡片

emptyFun(){

}

share(){
  FlutterShareMe().shareToSystem(
    msg: "分享内容还没写好呢"
  );
}

class expandCard extends StatefulWidget{
  final double outWidth;
  final double outHeight;
  final String time;
  final String location;
  final String description;
  final int star;
  final List picList;
  final String id;
  const expandCard(this.outHeight,this.outWidth,{Key key,this.id,this.time,this.location,this.description,this.star,this.picList});
  @override
  _expan createState() => _expan();
}

class _expan extends State<expandCard>{
  @override
  Widget build(BuildContext context) {
    Widget buildEX() {
      List<Widget> tiles = [];//先建一个数组用于存放循环生成的widget
      Widget content; //单独一个widget组件，用于返回需要生成的内容widget
      for(var item in pic) {
        tiles.add(
            Container(
              width: 30.w,
              height: 30.w,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(item,
                    ),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(40.w),
                border: new Border.all(width: 1.w,color: Colors.black)
              ),
              margin: EdgeInsets.fromLTRB(3.5.w, 0,
                  3.5.w,0),
            )
        );
      }
      content = new Wrap(
          children: tiles //重点在这里，因为用编辑器写Column生成的children后面会跟一个<Widget>[]，
        //此时如果我们直接把生成的tiles放在<Widget>[]中是会报一个类型不匹配的错误，把<Widget>[]删了就可以了
      );
      return content;
    }
    Widget buildPic(List a){
      List<Widget> picList = [];
      Widget content;
      for(var item in a){
        picList.add(
          Container(
            margin: EdgeInsets.fromLTRB(15.w, 10.h, 0, 0),
            width: 80.w,
            height:80.w,
           decoration: BoxDecoration(
             image: DecorationImage(
               image: NetworkImage(item),
               fit: BoxFit.cover
             )
           )
          )
        );
      }
      content = new Wrap(
        children: picList,
      );
      return content;
    }
    return Container(
      width: 350.w,
      height: 700.h,
      child: Column(
        children: <Widget>[
          Container(
            width: 350.w,
            height: 30.h,
            child: Row(
              children:<Widget> [
                Container(
                  child: buildEX(),
                ),
                Expanded(
                    child:Container(
                      alignment: Alignment.centerRight,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children:<Widget> [
                          like(widget.star,widget.id)
                        ],
                      )
                    )
                )
              ],
            )
            ),
          Divider(color: Colors.black,),
          Container(
            width: 350.w,
            height: 30.h,
            alignment: Alignment.centerLeft,
            child: Text(widget.time,
            style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
          ),
          Container(
            width:350.w,
            height:  30.h,
            alignment: Alignment.centerLeft,
            child: Text(widget.location,
            style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
          ),
          Divider(color: Colors.black,),
          Container(
            child: Text("活动详情："+widget.description),
          ),
          Divider(color: Colors.black,),
          Container(
            width: 350.w,
            height:  30.h,
            alignment: Alignment.centerLeft,
            child: Text("图片详情",
              style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
          ),
          Container(
            width: 350.w,
            height:  70.h,
            child: buildPic(widget.picList),
          ),
        ],
      ),
    );
  }
}

class CusBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return super.buildViewportChrome(context, child, axisDirection);
  }
}

tags(String id)async{
  var tagsUrl = 'https://moreover.atcumt.com/comments/star/'+id;
  Dio dio = new Dio();
  Response response = await dio.get(
      tagsUrl,
      options:Options(
          headers: {
            'token':user.token
          }
      )
  );
  print("点赞");
}
Widget like(number,id){
  return GestureDetector(
    onTap: (){
      tags(id);
    },
    child: LikeButton(
      bubblesColor: BubblesColor(
          dotPrimaryColor: Colors.white,
          dotSecondaryColor: Colors.pink,
          dotThirdColor: Colors.black,
          dotLastColor: Colors.blueAccent
      ),
      size: 27.w,
      likeCount: number,
    ),
  );
}