import 'package:flutter/services.dart';
import 'package:flutter_cumtchat/home/tabBars/actExpand/actExpansion.dart';
import 'package:flutter_cumtchat/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_cumtchat/module/button.dart';
import 'package:flutter_cumtchat/module/colors.dart';
import 'package:flutter_cumtchat/module/imageCon.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
List<String> pic =[
  'images/scr1.jpg','images/scr3.jpg','images/scr3.jpg'
];
String likeImg ='images/shoucang.png';
bool isLike = false;
class actCard extends StatefulWidget{
  const actCard({Key key});
  @override
  _act createState() => _act();
}
class _act extends State<actCard>{
  @override
  void initState() {
    super.initState();
     likeImg = 'images/shoucang.png';
     isLike = false;
  }
  @override
  Widget build(BuildContext context) {
    String likeImg ='images/shoucang.png';
    bool isLike = false;
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
                                      color: loginTFColor,
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
                                Container(
                                  height: txBottom,
                                  child: Image.asset(
                                    "images/pic.png",
                                    height: 30.h,
                                    width: 30.h,
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                  alignment: Alignment.bottomRight,
                                  padding: EdgeInsets.only(left: 12.w, right: 12.w),
                                  child: Text("发送",
                                      style: TextStyle(
                                          fontSize: 15.sp,
                                          color: Colors.orange)),
                                ),)
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
    void beLike(){
      setState(() {
        isLike = !isLike;
        print(isLike);
      });
      if(isLike) {
        setState(() {
          likeImg = 'images/fullshoucang.png';
        });
      }
      else{
        setState(() {
          likeImg = 'images/shoucang.png';
        });
      }
    }//点赞方法
    return InkWell(
      highlightColor: Colors.transparent,
      radius: 0,
      onTap: (){
          Navigator.of(context).push(
            PageRouteBuilder(
              pageBuilder: (BuildContext context, Animation<double> animation,
                  Animation<double> secondaryAnimation) {
                //目标页面
                return actExpansion();
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
        tag: "activity",
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
                      Container(
                        margin: EdgeInsets.fromLTRB(17.5.w, 0, 0, 0),
                        width: 52.5.w,
                        height:56.h,
                        child: Image.asset('images/touxiang.jpg'),
                      ),//头像处
                      Column(
                        children: <Widget>[
                          Text("大W的幻想"),
                          Divider(height: 10.h,),
                          Text("一个zz")
                        ],
                      )
                    ],
                  )
                  ,//头像信息处
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 17.5.h, 0, 0),
                    child: Text("今天看了好多风景，特别好看呀！！！！"),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(0,17.5.h, 0, 0),
                    height: 70.h,
                    child: Wrap(
                      alignment: WrapAlignment.spaceAround,
                      children: <Widget>[
                        imageCon("images/scr1.jpg"),
                        imageCon("images/scr2.jpg"),
                        imageCon("images/scr3.jpg")
                      ],
                    ),
                  )
                  ,//图片处

                  Container(
                    margin: EdgeInsets.fromLTRB(35.w, 7.h, 0, 0),
                    height: 70.h,
                    width: 297.5.w,
                    child: Row(
                      children: <Widget>[
                        homeClickButton("images/fenxiang.png",emptyFun),
                        homeClickButton("images/pinglun.png",comment),
                        homeClickButton(likeImg,beLike),
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
                                                                    width: 290.w,
                                                                    height: 40.h,
                                                                    child: ListTile(
                                                                      leading: Icon(Icons.perm_contact_cal_outlined),
                                                                      title: Text("天气不错啊"),
                                                                      subtitle: Text("我是zz"),
                                                                      onTap: (){
                                                                        comment();
                                                                      },
                                                                      onLongPress: (){
                                                                        ClipboardData data = new ClipboardData(text:"这是你复制的内容");
                                                                        Clipboard.setData(data);
                                                                        Fluttertoast.showToast(
                                                                          timeInSecForIosWeb: 1,
                                                                          msg: "已复制该内容",
                                                                          fontSize: 14.sp,
                                                                          gravity: ToastGravity.BOTTOM,
                                                                          textColor: Colors.black,);
                                                                      },
                                                                    ),
                                                                  ),
                                                                  Expanded(child:
                                                                  Container(
                                                                      alignment: Alignment.center,
                                                                      width: 15.w,
                                                                      height: 15.w,
                                                                      child:InkWell(
                                                                        onTap: (){

                                                                        },
                                                                        child: Image.asset('images/heart.png') ,
                                                                      )
                                                                  ),
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
                  /*Container(
                width: 315.w,
                height: 35.h,
                alignment: Alignment.bottomRight,
                margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                child: homeClickButton("images/zhankai.png",goExpansion),
              ),*/
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

/*goExpansion(){
  MyApp.navigator.currentState.push(
      MaterialPageRoute(builder: (context)=>actExpansion()));
}*/


emptyFun(){

}

class expandCard extends StatefulWidget{
  final double outWidth;
  final double outHeight;
  const expandCard(this.outHeight,this.outWidth,{Key key});
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
      content = new Row(
          children: tiles //重点在这里，因为用编辑器写Column生成的children后面会跟一个<Widget>[]，
        //此时如果我们直接把生成的tiles放在<Widget>[]中是会报一个类型不匹配的错误，把<Widget>[]删了就可以了
      );
      return content;
    }
    Widget buildPic(){
      List<Widget> picList = [];
      Widget content;
      for(var item in pic){
        picList.add(
          Container(
            margin: EdgeInsets.fromLTRB(0, 10.h, 0, 0),
            width: 80.w,
            height:80.w,
           decoration: BoxDecoration(
             image: DecorationImage(
               image: AssetImage(item),
               fit: BoxFit.cover
             )
           )
          )
        );
      }
      content = new Wrap(
        alignment: WrapAlignment.spaceAround,
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
                          Container(
                            alignment: Alignment.center,
                            child: Text("30人想去"),
                          ),
                          IconButton(
                            icon: Icon(Icons.grade),
                          ),
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
            child: Text("2021.02.07 09.00 - 02.07 16.00",
            style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
          ),
          Container(
            width:350.w,
            height:  30.h,
            alignment: Alignment.centerLeft,
            child: Text("梅苑二号楼 党工委办公室",
            style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
          ),
          Divider(color: Colors.black,),
          Container(
            child: Text("活动详情：这次的活动，我们会怎么怎么，然后怎么怎么，再然后怎么怎么，最后就好了！"),
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
            child: buildPic(),
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