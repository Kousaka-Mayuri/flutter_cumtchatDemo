import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_cumtchat/globalKey/globalKey.dart';
import 'package:flutter_cumtchat/home/tabBars/activity.dart';
import 'package:flutter_cumtchat/home/tabBars/question.dart';
import 'package:flutter_cumtchat/home/tabBars/talk.dart';
import 'package:flutter_cumtchat/module/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dart:convert';
import 'package:path_provider/path_provider.dart';
class home_page extends StatefulWidget{
  @override
  homePage createState() => homePage();
}


class homePage extends State<home_page>
with SingleTickerProviderStateMixin{
  TabController _tabController;
  @override
  Future<File> getFile(String fileName) async {
    //获取应用文件目录类似于Ios的NSDocumentDirectory和Android上的 AppData目录
    final fileDirectory = await getApplicationDocumentsDirectory();
    print(fileDirectory);
    //获取存储路径
    final filePath = fileDirectory.path;
    print(filePath);
    //或者file对象（操作文件记得导入import 'dart:io'）
    print(filePath + "/"+fileName);
    return new File(filePath + "/"+fileName);
  }

  void initState() {
    super.initState();
    _tabController = new TabController(length: 3, vsync: this);
    _tabController.addListener(() {
      print(_tabController.index);
    });
    /*File file =  new File('images/huodong.png');
    List<int> imageBytes = file.readAsBytesSync();
    print(imageBytes);
    String baseImage = base64Encode(imageBytes);
    print(baseImage);*/
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: PreferredSize(
        preferredSize:  Size.fromHeight(40.h),//设置appBar高度,
        child:AppBar(
          elevation: 1,
          title: Container(
              width: 350.w,
              child: Row(
                children: [
                  Container(
                      key: searchIcon,
                      margin: EdgeInsets.fromLTRB(17.5.w, 0, 0, 0),
                      child: Icon(Icons.search,color: Colors.black,)),
                  /*Container(
                    alignment: Alignment.center,
                    width: 175.w,
                    key: FlyingText,
                    margin: EdgeInsets.fromLTRB(42.w,0, 0, 0),
                    child: Image.asset('images/FlyingText.png',fit: BoxFit.cover,),
                  )*/
                  Container(
                    width: 250.w,
                    alignment: Alignment.center,
                    child: TabBar(
                      controller: _tabController,
                      indicatorColor:tabBar,
                      indicatorSize: TabBarIndicatorSize.tab,
                      isScrollable: true,
                      indicatorWeight: 0.01,
                      labelColor: black,
                      unselectedLabelColor: lightGrey,
                      tabs: [
                        Tab(text:"活动"),
                        Tab(text: "闲聊",),
                        Tab(text: "答疑",)
                      ],
                    ),
                  )
                ],
              )
          ),
          backgroundColor: tabBar,
          /*bottom: ,*/
      ),
      ),
      body:TabBarView(
        controller: this._tabController,
        children: [
          activity(),
          talk(),
          question()
        ],
      )
    );
  }
}