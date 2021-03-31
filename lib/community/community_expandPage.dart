import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cumtchat/community/module/communityIcon.dart';
import 'package:flutter_cumtchat/community/releasePage.dart';
import 'package:flutter_cumtchat/home/tabBars/module/talkModule.dart';
import 'package:flutter_cumtchat/home/tabBars/talk.dart';
import 'package:flutter_cumtchat/module/cardCon.dart';
import 'package:flutter_cumtchat/module/colors.dart';
import 'package:flutter_cumtchat/module/function.dart';
import 'package:flutter_cumtchat/module/textStyle.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_cumtchat/community/module/communityIcon.dart';

class communityExPandCard extends StatefulWidget{
  final String community;
  @override
  const communityExPandCard({this.community,Key key});
  community_page createState() => community_page();
}
class community_page extends State<communityExPandCard>{
  click(){
    Navigator.of(context).push(
      PageRouteBuilder(
        pageBuilder: (BuildContext context, Animation<double> animation,
            Animation<double> secondaryAnimation) {
          //目标页面
          return talkExpand();
        },
        //打开新的页面用时
        transitionDuration: Duration(milliseconds: 500),
        //关半页岩用时
        reverseTransitionDuration: Duration(milliseconds: 500),
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
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      floatingActionButton: FloatingActionButton(
          child: Icon(
            Icons.add,
          ),
          backgroundColor: HexColor("#109D58"),
          onPressed: (){
              Navigator.push(
                  context, CupertinoPageRoute(builder: (context)=>release(community: widget.community,)
              ));
          }),
         body:CustomScrollView(
               slivers: [
                 SliverAppBar(
                   expandedHeight: 200.h,
                   title: Container(
                     child: Row(
                       children: [
                         Container(
                           child: Text(widget.community),
                         ),
                         Expanded(
                             child: Container(
                               alignment: Alignment.centerRight,
                               child: RaisedButton(
                                 onPressed: (){

                                 },
                                 color: HexColor("#494949"),
                                 shape: StadiumBorder(
                                     side: BorderSide(
                                         color: HexColor("#B1B1B1")
                                     )
                                 ),
                                 child: Text("关注",style: TextStyle(
                                     color: HexColor("#B1B1B1")
                                 ),),
                               ),
                             ))
                       ],
                     ),
                   ),
                   backgroundColor: HexColor("#494949"),
                   flexibleSpace: FlexibleSpaceBar(
                     background: Container(
                         margin: EdgeInsets.fromLTRB(0, 30.h, 0, 0),
                         decoration: BoxDecoration(
                             color: HexColor("#494949")
                         ),
                         child: Column(
                           mainAxisAlignment: MainAxisAlignment.center,
                           children: [
                             Container(
                               width: 350.w,
                               child: communityExpandIcon('images/bangdream.jpg',widget.community),
                             ),
                             Container(
                               margin: EdgeInsets.fromLTRB(15.w, 5.h, 15.w, 0),
                               child: Wrap(
                                 alignment: WrapAlignment.spaceAround,
                                 children: [
                                   Container(
                                     child: Text("总获赞数：10.4w",style: attentionText,),
                                   ),
                                   Container(
                                     margin: EdgeInsets.fromLTRB(20.w, 0, 0, 0),
                                     child: Text("总评论数：4.4w",style: attentionText,),
                                   )
                                 ],
                               ),
                             )
                           ],
                         )
                     ),
                   ),
                   floating: true,
                   snap: true,
                   pinned: true,
                 ),
                 SliverList(delegate: SliverChildListDelegate(
                     [
                       Container(
                           decoration: BoxDecoration(
                               borderRadius: BorderRadius.only(
                                   topLeft: Radius.circular(20.w),
                                   topRight: Radius.circular(20.w)
                               )
                           ),
                           width: 350.w,
                               child: ScrollConfiguration(
                                 behavior: CusBehavior(),
                                 child:ListView.builder(
                                   shrinkWrap: true,
                                   physics: NeverScrollableScrollPhysics(),
                                   itemCount: 1,
                                   itemBuilder: (context,index){
                                     return talkCard(click);
                                   },
                                 ),
                               )
                       ),
                     ]
                 ))
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