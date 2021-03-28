import 'package:flutter/material.dart';
import 'package:flutter_cumtchat/module/button.dart';
import 'package:flutter_cumtchat/module/cardCon.dart';
import 'package:flutter_cumtchat/module/colors.dart';
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
        body:ScrollConfiguration(
          behavior: CusBehavior1(),
          child: CustomScrollView(
            slivers:<Widget> [
              SliverToBoxAdapter(
                child: Container(
                  decoration: BoxDecoration(
                  ),
                    margin: EdgeInsets.fromLTRB(0, 35.h, 0, 0),
                    padding: EdgeInsets.all(3.5.h),
                    width: 315.w,
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(35.h),
                        child:Container(
                          child: Column(
                            children: <Widget>[
                              Container(
                                width: 315.w,
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
                                margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                color: tabBar,
                                  height: 100.h,
                                  width: 315.w,
                                  child: Row(
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
