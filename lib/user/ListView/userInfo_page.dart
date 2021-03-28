import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cumtchat/module/colors.dart';
import 'package:flutter_cumtchat/module/stateCard.dart';
import 'dart:ui';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_cumtchat/module/cardCon.dart';
class info_page extends StatefulWidget{
  @override
  _info createState() => _info();
}

class _info extends State<info_page>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            elevation: 1,
            iconTheme: IconThemeData(
              color: Colors.black
            ),
            expandedHeight:240.h,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                child: Stack(
                  children: [
                      Container(
                        width: 350.w,
                        height: 150.h,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("images/screen.jpg"),
                            fit: BoxFit.cover
                          )
                        ),
                      ),
                   Container(
                     margin: EdgeInsets.fromLTRB(10.w, 125.h, 0, 0),
                     child: Column(
                       children: [
                         Container(
                           height: 120.h,
                           width: 350.w,
                           child: Row(
                             children: [
                               Container(
                                 margin: EdgeInsets.fromLTRB(0, 5.h, 0, 0),
                                 width: 85.h,
                                 height: 85.h,
                                 decoration: BoxDecoration(
                                     border: Border.all(
                                         width: 1.w,
                                         color: tabBar
                                     ),
                                     borderRadius: BorderRadius.circular(60.w),
                                     image: DecorationImage(
                                         image: AssetImage("images/touxiang.jpg"),
                                         fit: BoxFit.cover
                                     )
                                 ),
                               ),
                               Container(
                                   margin: EdgeInsets.fromLTRB(10.w, 40.h, 0, 0),
                                   width: 240.w,
                                   child: Column(
                                     children: [
                                       stateCard(11, 22, 153),
                                       InkWell(
                                         highlightColor: Colors.transparent, // 透明色
                                         splashColor: Colors.transparent,
                                         onTap: (){

                                         },
                                         child: Container(
                                           margin: EdgeInsets.fromLTRB(0, 5.h, 0, 0),
                                           padding: EdgeInsets.all(5.w),
                                           alignment: Alignment.center,
                                           width: 235.w,
                                           decoration: BoxDecoration(
                                               borderRadius: BorderRadius.circular(5.w),
                                               border: Border.all(
                                                   width: 1.5.w,
                                                   color: HexColor("#F4729E")
                                               )
                                           ),
                                           child: Text("编辑资料",
                                             style: TextStyle(
                                                 fontSize: 14.sp,
                                                 color: HexColor("#DD7598")
                                             ),),
                                         ),
                                       ),

                                     ],
                                   )
                               ),

                             ],
                           ),
                         ),
                         Container(
                           width: 350.w,
                           child: Row(
                             children: [
                               Container(
                                 width: 280.w,
                                 child: Text(
                                   "我是一个大彩笔，做啥啥不行，玩啥啥不会，睡觉还是第一名，请叫我大废物，嘿嘿嘿嘿嘿"
                                   ,maxLines: 1,
                                   overflow: TextOverflow.ellipsis,
                                 ),
                               ),
                               Expanded(
                                   child:Container(
                                     margin: EdgeInsets.fromLTRB(0, 0, 10.w, 0),
                                     alignment: Alignment.centerRight,
                                     child: InkWell(
                                       highlightColor: Colors.transparent, // 透明色
                                       splashColor: Colors.transparent,
                                       onTap: (){
                                          
                                       },
                                       child: Text("详情",style: TextStyle(
                                           color: HexColor("#2481C2")
                                       ),),
                                     ),
                                   )
                               )
                             ],
                           )
                         )
                       ],
                     ),
                   )
                  ],
                ),
              )
              /*Container(
                height: 100.h,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('images/screen.jpg'
                      ,),
                    fit: BoxFit.cover
                  )
                ),
                child:Container(
                  child: ,
                )
                Stack(
                  alignment: AlignmentDirectional.center,
                  children: [
                    /*Container(
                      height: 30.h,
                      alignment: Alignment.center,
                      margin: EdgeInsets.fromLTRB(0, 200.h, 0, 0),
                      decoration: BoxDecoration(
                        color: HexColor("#B3DDEC"),
                        borderRadius: BorderRadius.circular(10.w),
                      ),
                      width: 280.w,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children:<Widget> [
                          InkWell(
                            onTap: (){

                            },
                            child: Container(
                              margin: EdgeInsets.fromLTRB(15.w, 0, 0, 0),
                              child: Text("获赞 2"),
                            ),
                          ),
                          Container(
                            alignment: Alignment.center,
                            height: 40.h,
                            child: VerticalDivider(
                              thickness: 0.6.w,
                              width: 1.w,
                            ),
                          ),
                          InkWell(
                            onTap: (){

                            },
                            child: Container(
                              child: Text("粉丝 2"),
                            ),
                          ),
                          Container(
                            alignment: Alignment.center,
                            height: 40.h,
                            child: VerticalDivider(
                              thickness: 0.6.w,
                              width: 1.w,
                            ),
                          ),
                          InkWell(
                            onTap: (){

                            },
                            child: Container(
                              margin: EdgeInsets.fromLTRB(0, 0, 15.w, 0),
                              child: Text("关注 2"),
                            ),
                          ),
                        ],
                      ),
                    ),*/
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 0.h, 0, 0),
                      width: 70.w,
                      height: 70.w,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('images/touxiang.jpg'),
                              fit: BoxFit.cover
                          ),
                          color: Colors.black,
                          border: Border.all(width: 2.w,color: Colors.white),
                          borderRadius: BorderRadius.circular(40.w)
                      ),
                    ),
                  ],
                ),
              )*/
            ),
            title: Container(
              child: Text("王逸鸣的主页",style: TextStyle(color: Colors.black),),
            ),
            backgroundColor: Colors.white,
            floating: true,
            snap: true,
            pinned: true,
          ),
         /* SliverToBoxAdapter(
            child: Container(
              alignment: Alignment.center,
              width: 350.w,
              height: 180.h,
              child: Stack(
                alignment: AlignmentDirectional.center,
                children: [
                  Container(
                    alignment: Alignment.center,
                        margin: EdgeInsets.fromLTRB(0, 100.h, 0, 0),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10.w),
                          border: Border.all(width: 4.w,color: Colors.white),
                        ),
                        width: 280.w,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children:<Widget> [
                            InkWell(
                              onTap: (){

                              },
                              child: Container(
                                margin: EdgeInsets.fromLTRB(15.w, 0, 0, 0),
                                child: Text("获赞 2"),
                              ),
                            ),
                            Container(
                              alignment: Alignment.center,
                              height: 40.h,
                              child: VerticalDivider(
                                thickness: 0.6.w,
                                width: 1.w,
                              ),
                            ),
                            InkWell(
                              onTap: (){

                              },
                              child: Container(
                                child: Text("粉丝 2"),
                              ),
                            ),
                            Container(
                              alignment: Alignment.center,
                              height: 40.h,
                              child: VerticalDivider(
                                thickness: 0.6.w,
                                width: 1.w,
                              ),
                            ),
                            InkWell(
                              onTap: (){

                              },
                              child: Container(
                                margin: EdgeInsets.fromLTRB(0, 0, 15.w, 0),
                                child: Text("关注 2"),
                              ),
                            ),
                          ],
                        ),
                      ),
                    Container(
                      width: 70.w,
                      height: 70.h,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('images/touxiang.jpg'),
                          fit: BoxFit.cover
                        ),
                          color: Colors.black,
                          border: Border.all(width: 4.w,color: Colors.white),
                          borderRadius: BorderRadius.circular(40.w)
                      ),
                  ),
                ],
              ),
            )
          ),*/
          SliverList(
              delegate: SliverChildListDelegate(
            [
              Container(
                  width: 350.w,
                  /*constraints: BoxConstraints(maxWidth: scrWidth*0.9),//限制宽长高*/
                  child:
                  Container(
                      padding: EdgeInsets.all(10.w),
                      child: ScrollConfiguration(
                        behavior: CusBehavior(),
                        child:ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: 20,
                          itemBuilder: (context,index){
                            return
                              actCard(

                              );
                          },
                        ),
                      )

                  )
              )
            ]
          ))
        ],
      )
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