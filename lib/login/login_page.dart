import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_cumtchat/data/activity.dart';
import 'package:flutter_cumtchat/home/home_page.dart';
import 'package:flutter_cumtchat/login/enter/login.dart';
import 'package:flutter_cumtchat/login/register/register.dart';
import 'package:flutter_cumtchat/module/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class login extends StatefulWidget{
  @override
  login_page createState() => login_page();
}
class login_page extends State<login> with SingleTickerProviderStateMixin {
  @override
  TabController _tabController;

  void initState() {
    super.initState();
    _tabController = new TabController(length: 2, vsync: this);
    _tabController.addListener(() {
      print(_tabController.index);
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
          resizeToAvoidBottomPadding: false,
          body: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("images/login.jpg"),
                      fit: BoxFit.cover
                  )
              ),
              child: ClipRRect(
                child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaY: 5.w, sigmaX: 5.w),
                    child: Container(

                      color: Colors.grey.withOpacity(0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                              alignment: Alignment.center,
                              width: 350.w,
                              height: 200.h,
                              child: Container(
                                  margin: EdgeInsets.fromLTRB(40.w, 40.h, 0, 0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      Container(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            "??????", style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 35.sp
                                          ),
                                          )
                                      ),
                                      Container(
                                        margin: EdgeInsets.fromLTRB(
                                            0, 10.h, 0, 0),
                                        alignment: Alignment.centerLeft,
                                        child: Text("??????????????????APP",
                                          style: TextStyle(
                                            fontSize: 14.sp,
                                          ),
                                        ),
                                      )
                                    ],
                                  )
                              )
                          ),
                          Container(
                              height: 450.h,
                              width: 350.w,
                              child: Column(
                                children: [
                                  TabBar(
                                    controller: _tabController,
                                    indicatorColor: Colors.black,
                                    indicatorSize: TabBarIndicatorSize.tab,
                                    isScrollable: false,
                                    indicatorWeight: 0.0001.h,
                                    labelColor: black,
                                    unselectedLabelColor: lightGrey,
                                    labelStyle: TextStyle(
                                        fontSize: 13.sp,
                                        fontWeight: FontWeight.bold
                                    ),
                                    tabs: [
                                      Tab(text: "??????"),
                                      Tab(text: "??????",)
                                    ],
                                  ),
                                  Container(
                                    margin: EdgeInsets.fromLTRB(0, 10.h, 0, 0),
                                    height: 399.h,
                                    width: 350.w,
                                    child: TabBarView(
                                        controller: this._tabController,
                                        children: [
                                          enter(),
                                          register()
                                        ]),
                                  )
                                ],
                              )

                          ),
                        ],
                      ),
                    )
                ),
              )
          ),
        );

  }
  @override
  void dispose() {
    super.dispose();


  }
}