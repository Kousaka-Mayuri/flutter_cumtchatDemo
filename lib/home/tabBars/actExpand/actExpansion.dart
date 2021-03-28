import 'package:flutter/material.dart';
import 'package:flutter_cumtchat/module/cardCon.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class actExpansion extends StatefulWidget{
  @override
  _actExpand createState() => _actExpand();
}

class _actExpand extends State<actExpansion>
    with SingleTickerProviderStateMixin{
 /* TabController tabController;*/
  @override
  void initState() {
    super.initState();
    /*this.tabController = TabController(length: 2, vsync: this);*/
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                      width: 110.w,
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
/*
          SliverPersistentHeader(
            pinned: true,
              delegate: StickyTabBarDelegate(
                child: TabBar(
                  labelColor: Colors.black,
                  controller: this.tabController,
                  tabs: <Widget>[
                    Tab(text: 'Home'),
                    Tab(text: 'Profile'),
                  ],
                ),
              )
          ),
          SliverFillRemaining(
            child: TabBarView(
              controller: this.tabController,
              children: <Widget>[
                Center(child: Text('Content of Home')),
                Center(child: Text('Content of Profile')),
              ],
            ),
          ),
 */
          SliverList(
              delegate: SliverChildListDelegate(
            [
              Container(
                  width: 350.w,
                  height: 6000.h,
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
    );
  }
}
/*
class StickyTabBarDelegate extends SliverPersistentHeaderDelegate {
  final TabBar child;

  StickyTabBarDelegate({@required this.child});

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return this.child;
  }

  @override
  double get maxExtent => this.child.preferredSize.height;

  @override
  double get minExtent => this.child.preferredSize.height;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
 */