import 'package:flutter/material.dart';
import 'package:flutter_cumtchat/home/tabBars/actExpand/actExpansion.dart';
import 'package:flutter_cumtchat/module/button.dart';
import 'package:flutter_cumtchat/module/cardCon.dart';
import 'package:flutter_cumtchat/module/colors.dart';
import 'package:flutter_cumtchat/module/function.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class activity extends StatefulWidget
{
  @override
  _activity createState() => _activity();
}

List<String> picture = ['images/swiper1.jpg','images/swiper2.jpg','images/swiper3.jpg'];

class _activity extends State<activity>
{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
        body:ScrollConfiguration(
          behavior: CusBehavior1(),
          child: CustomScrollView(
            slivers:<Widget> [
              SliverToBoxAdapter(
                child: Container(
                    margin: EdgeInsets.fromLTRB(0, 15.h, 0, 0),
                    width: 315.w,
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(0.h),
                        child:Container(
                          child: Column(
                            children: <Widget>[
                              Container(
                                width: 330.w,
                                child: AspectRatio(
                                  aspectRatio: 16/9,
                                  child: Swiper(
                                    itemBuilder: (BuildContext context,int index){
                                      return Image.asset('images/222.png',
                                        fit: BoxFit.cover,);
                                    },
                                    itemCount: 3,
                                    loop: true,
                                    autoplay: false,
                                    pagination: SwiperPagination(),
                                  ),
                                ),
                              ),
                              Container(
                                
                                alignment: Alignment.center,
                                margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                color: tabBar,
                                  height: 100.h,
                                  width: 330.w,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children:<Widget> [
                                        homeIcon('images/homeIcon/groupNew.png',
                                            70.h,78.75.w,"组队"),
                                      homeIcon('images/homeIcon/information.png',
                                          70.h,78.75.w,"信息"),
                                      homeIcon('images/homeIcon/find.png',
                                          70.h,78.75.w,"发现"),
                                      homeIcon('images/homeIcon/honor.png',
                                          70.h,78.75.w,"成就"),
                                    ],
                                  )
                              ),
                            ],
                          ),
                        )
                    )
                ),
              ),
              SliverList(delegate: SliverChildListDelegate(
                  [
                    Container(
                        width: 350.w,
                        /*constraints: BoxConstraints(maxWidth: scrWidth*0.9),//限制宽长高*/
                        child:
                            Container(
                                    padding: EdgeInsets.all(7.w),
                                    child: ScrollConfiguration(
                                      behavior: CusBehavior(),
                                      child:ListView.builder(
                                        shrinkWrap: true,
                                        physics: NeverScrollableScrollPhysics(),
                                        itemCount: 1,
                                        itemBuilder: (context,index){
                                          return
                                            actCard();
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
class CusBehavior1 extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}
