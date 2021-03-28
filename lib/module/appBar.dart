import 'package:flutter/material.dart';
import 'package:flutter_cumtchat/module/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

PreferredSize appBarWYM(BuildContext context)
{
    return PreferredSize(
            child: AppBar(
              title: Container(
                  width: 350.w,
                        alignment: Alignment.center,
                        margin: EdgeInsets.fromLTRB(0,0, 0, 0),
                        child: Image.asset('images/FlyingText.png',fit: BoxFit.cover,),
              ),
              backgroundColor: tabBar,
              elevation: 0,
            ),
            preferredSize: Size.fromHeight(21.h)
        );
}
