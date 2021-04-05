import 'package:flutter/material.dart';
import 'package:flutter_cumtchat/module/cardCon.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class actExpansion extends StatefulWidget{
  final String id;
  final String time;
  final String location;
  final int star;
  final String detail;
  final List picList;
  final String title;
  final String publisher;
  final List exPicList;
  @override
  const actExpansion({Key key,this.id,this.time,this.location,this.star,this.detail,this.picList,this.title,this.publisher,this.exPicList});
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
    return Hero(tag: widget.id,
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
                        share();
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
                                Text("活动："+widget.title,style: TextStyle(color: Colors.white,fontSize: 12.sp),),
                                Text("发布者："+widget.publisher,style: TextStyle(color: Colors.black,fontSize: 10.sp),)
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
                                  child:expandCard(
                                      700.h,350.w,
                                      time: widget.time,
                                      location: widget.location,
                                      star: widget.star,
                                      description: widget.detail,
                                      picList: widget.picList,
                                  )
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