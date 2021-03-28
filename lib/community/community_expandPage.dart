import 'package:flutter/material.dart';
import 'package:flutter_cumtchat/community/module/communityIcon.dart';
import 'package:flutter_cumtchat/module/cardCon.dart';
import 'package:flutter_cumtchat/module/colors.dart';
import 'package:flutter_cumtchat/module/textStyle.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_cumtchat/community/module/communityIcon.dart';

class communityExPandCard extends StatefulWidget{
  final String text;
  @override
  const communityExPandCard(this.text,{Key key});
  community_page createState() => community_page();
}
class community_page extends State<communityExPandCard>{
  @override
  Widget build(BuildContext context) {

    return Scaffold(
         body:Hero(
           tag: widget.text,
           child: Material(
             child: CustomScrollView(
               slivers: [
                 SliverAppBar(
                   expandedHeight: 200.h,
                   title: Container(
                     child: Row(
                       children: [
                         Container(
                           child: Text("Bangdream"),
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
                             communityExpandIcon('images/bangdream.jpg',"Bangdream"),
                             Container(
                               margin: EdgeInsets.fromLTRB(15.w, 5.h, 15.w, 0),
                               child: Row(
                                 mainAxisAlignment: MainAxisAlignment.center,
                                 children: [
                                   Container(
                                     child: Text("总获赞数：10.4w",style: attentionText,),
                                   ),
                                   Container(
                                     margin: EdgeInsets.fromLTRB(30.w, 0, 0, 0),
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
             ),
           )
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