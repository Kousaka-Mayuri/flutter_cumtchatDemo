import 'package:flutter/material.dart';
import 'package:flutter_cumtchat/community/community_page.dart';
import 'package:flutter_cumtchat/globalKey/globalKey.dart';
import 'package:flutter_cumtchat/home/home_page.dart';
import 'package:flutter_cumtchat/module/colors.dart';
import 'package:flutter_cumtchat/user/user_page.dart';

class main_page extends StatefulWidget{
  @override
  _main_page createState() =>_main_page();
}

class _main_page extends State<main_page>
{
  List page = [
    home_page(),
    community_page(),
    user_page()
  ];

  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(


    bottomNavigationBar: BottomNavigationBar(
      currentIndex: currentIndex,
      selectedItemColor: black,
      onTap: (int index)
        {
          setState(() {
            currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            label: "主页",
            icon: Icon(Icons.home)
          ),
          BottomNavigationBarItem(
              label: "社区",
              icon:Icon(Icons.adjust)
          ),
          BottomNavigationBarItem(
            label: "我的",
            icon:Icon(Icons.account_box)
          )
        ]
        ,
    ),
    body: page[currentIndex]
    );
  }
}