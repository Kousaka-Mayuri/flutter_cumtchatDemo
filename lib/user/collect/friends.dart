import 'package:flutter/material.dart';
import 'package:flutter_cumtchat/module/colors.dart';
import 'package:flutter_cumtchat/module/textStyle.dart';
import 'package:flutter_cumtchat/user/collect/friendsPage/attention.dart';
import 'package:flutter_cumtchat/user/collect/friendsPage/fans.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class friends extends StatefulWidget{
  final int initIndex;
  @override
  const friends(this.initIndex,{Key key});
  friends_page createState() => friends_page();
}

class friends_page extends State<friends>
with SingleTickerProviderStateMixin{
  TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = new TabController(
        initialIndex: widget.initIndex,length: 2, vsync: this);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(40.h),
        child: AppBar(
          backgroundColor: tabBar,
          title: Container(
            child:Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: TabBar(
                    indicatorColor: HexColor("#F5729A"),
                    indicatorSize: TabBarIndicatorSize.label,
                    isScrollable: true,
                    labelColor: HexColor("#F5729A"),
                    unselectedLabelColor: lightGrey,
                    controller: _tabController,
                    tabs: [
                      Tab(text:"我的关注"),
                      Tab(text:"我的粉丝")
                    ],
                  ),
                )
              ],
            ) ,
          ),
          iconTheme: IconThemeData(
            color: HexColor("#747474")
          ),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          attention(),
          fans(),
        ],
      )
    );
  }
}