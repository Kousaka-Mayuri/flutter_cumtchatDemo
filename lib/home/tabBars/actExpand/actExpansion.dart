import 'package:flutter/material.dart';
import 'package:flutter_cumtchat/module/cardCon.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class actExpansion extends StatefulWidget{
  @override
  _actExpand createState() => _actExpand();
}

class _actExpand extends State<actExpansion>
    with SingleTickerProviderStateMixin{
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Hero(tag: 'activity',
        child: Material(
        child: Scaffold(
          body: CustomScrollView(
            slivers: [
            SliverAppBar(
                snap: true,
                floating: true,
                pinned:false,
                leading: IconButton(
                    color: Colors.black,
                    icon: Icon(Icons.arrow_back),
                    onPressed:() {
                      Navigator.of(context).pop();
                    }
                ),
                actions: [
                  IconButton(
                      color: Colors.black,
                      icon: Icon(Icons.share),
                      onPressed:() {

                      })
                ],
                backgroundColor: Color.fromARGB(255, 119, 52, 96),
                automaticallyImplyLeading: false,
                expandedHeight: 230.h,
                elevation: 1,
                title: Text("活动"),
                flexibleSpace: FlexibleSpaceBar(
                  title: Container(
                    height: 100.h,
                    child: Row(
                      children:<Widget> [
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                          height: 100.h,
                          width: 70.w,
                          child: Image.asset('images/touxiang.jpg',
                            fit: BoxFit.cover,),
                        ),
                        Container(
                            width: 100.w,
                            alignment: Alignment.center,
                            margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                            child: Column(
                              children:<Widget> [
                                Text("活动：欣赏风景",style: TextStyle(color: Colors.white,fontSize: 12.sp),),
                                Divider(),
                                Text("发布者：王逸鸣",style: TextStyle(color: Colors.black,fontSize: 10.sp),)
                              ],
                            )
                        )
                      ],
                    ),
                  ),
                )
            ),
            SliverList(
                delegate: SliverChildListDelegate(
                    [
                      Container(
                          width: 350.w,
                          /*constraints: BoxConstraints(maxWidth: scrWidth*0.9),//限制宽长高*/
                          child: Column(
                            children: [
                              Container(
                                  padding: EdgeInsets.all(20.w),
                                  child:expandCard(700.h,350.w)
                              )
                            ],
                          )
                      )
                    ]
                )
            )
          ],
        ),
      ),
    ));
  }
}