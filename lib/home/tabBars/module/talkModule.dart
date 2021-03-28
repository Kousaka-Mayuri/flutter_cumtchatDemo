import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cumtchat/module/button.dart';
import 'package:flutter_cumtchat/module/colors.dart';
import 'package:flutter_cumtchat/module/commentCard.dart';
import 'package:flutter_cumtchat/module/imageCon.dart';
import 'package:flutter_cumtchat/module/textStyle.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class talkCard extends StatefulWidget{
  @override
  const talkCard({Key key});
  talk_card createState() => talk_card();
}

class talk_card extends State<talkCard>{
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.w)
      ),
      margin: EdgeInsets.fromLTRB(10.w, 10.w, 10.w, 0),
        child: Container(
          margin: EdgeInsets.fromLTRB(20.w, 20.w, 20.w, 0),
          child: Column(
            children:<Widget> [
              Container(

                child: Row(
                  children:<Widget> [
                    Container(
                      decoration: BoxDecoration(
                          border: new Border.all(width: 0.5,color: Colors.white),
                          borderRadius: BorderRadius.circular(80.w),
                          image: DecorationImage(
                              image:AssetImage('images/touxiang.jpg'),
                              fit: BoxFit.cover
                          )
                      ),
                      width: 50.w,
                      height: 50.w,
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(10.w, 0, 0, 0),
                      alignment: Alignment.topLeft,
                      width: 200.w,
                      height: 50.w,
                      child: Column(
                        children:<Widget> [
                          Container(
                            alignment: Alignment.topLeft,
                            width: 200.w,
                            height: 25.w,
                            child:Text("我是彩黑",style: userIdText),
                          ),
                          Container(
                            alignment: Alignment.bottomLeft,
                            width: 200.w,
                            height: 25.w,
                            child: Text("来自编辑推荐",style: annotationText),
                          )
                        ],
                      ),
                    ),
                    Container(
                      height: 50.w,
                      width: 20.w,
                      alignment: Alignment.center,
                      child: InkWell(
                        child: Icon(Icons.arrow_drop_down_outlined),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                alignment: Alignment.topLeft,
                margin: EdgeInsets.fromLTRB(0, 20.w, 0, 0),
                width: 280.w,
                child: Text("大家为什么要黑彩彩？",style: TextStyle(fontSize: 14.sp,
                    fontWeight: FontWeight.bold),),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(0, 10.w, 0, 0),
                child: Text("求你了别发了我音游打得再菜我都不会觉得难过只有你们发这种成绩图的时候我的心里像刀割一样地痛着打着字泪水就忍不住地往下流而且怎么也达不到你们这样的水平的我真是自愧不如还要看着你们天天开开心心快快乐乐地收这歌收那歌感觉收歌就是家常便饭的事一样我真的看不下去就不能让我这个萌新好好在这里聊音游玩音游梗给那些和我一样菜的音游玩家鼓劲加油争取打到他们想要的成绩就这样真的不行吗我也是醉了现在的大佬怎么都这个样子还在为收没收歌而苦恼关键是还装个萌新说不会玩wdnmd这叫不会玩那会玩的是有多神仙自己也不想想好好打歌原本很开心的事被你们这些大佬弄得都不开心有什么意义真是的我也无力吐槽了看来我还是不适合玩音游不适合和你们这些自称不会玩的大佬正常交流不适合这个圈子所以我只能乖巧地看着你们随意发这样的成绩图我自己心里很过意不去的你们知道吗各位大佬们求求你们别再卖鶸了自己也不想想在这里的地位有多高说的话对得起音游圈吗还在这里发太菜能不能收敛点啊我去",
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 12.sp),),
              ),
              Container(
                alignment: Alignment.bottomRight,
                height: 40.h,
                width: 300.w,
                child: InkWell(
                  onTap: (){
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context)=>
                        talkExpand()
                      ));
                  },
                  child: Text("查看更多",style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.green
                  ),),
                )
              ),
              Container(
                margin: EdgeInsets.fromLTRB(0, 10.w, 0, 10.w),
                child: Wrap(
                  children:<Widget >[
                    imageCon('images/cai.jpg'),
                    imageCon('images/cai2.jpg'),
                    imageCon('images/cai3.jpg')
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(10.w, 10.w, 0, 10.w),
                width: 300.w,
                child: Container(
                  alignment: Alignment.bottomLeft,
                  child: Container(
                    decoration: BoxDecoration(
                        color:loginTFColor
                    ),
                    padding: EdgeInsets.all(5.w),
                    child: Text("bangdream社区",style: TextStyle(fontSize: 10.sp),),
                  )
                ),
              ),
              Column(
                children: <Widget>[
                  Container(
                    alignment: Alignment.center,
                    width: 300.w,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children:<Widget> [
                        Container(
                          width: 95.w,
                          child:homeClickButton('images/talk_dianzan.png', empty),
                        ),
                        Container(
                          width: 95.w,
                          child: homeClickButton('images/talk_pinglun.png', empty),)
                        ,
                        Container(
                          width: 95.w,
                          child: homeClickButton('images/talk_fenxiang.png', empty),
                        )
                      ],
                    ),
                  ),
                  Container(
                    height: 15.h,
                  )
                ],
              )
            ],
          ),
        )
    );
  }
}

void empty(){

}

class talkExpand extends StatefulWidget{
  @override
  talk_expand createState() => talk_expand();
}

class talk_expand extends State<talkExpand>
{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(40.h),
        child: AppBar(
          actions: [
            IconButton(icon: Image.asset('images/dot.png'),onPressed: (){
            },)
          ],
          iconTheme: IconThemeData(
            color: Colors.black
          ),
          backgroundColor: tabBar,
          elevation: 0.8.h,
          title: Text("动态",style: TextStyle(color: Colors.black),),
        ),
      ),
        body: Container(
          child:  SingleChildScrollView(
            scrollDirection: Axis.vertical,
            physics: BouncingScrollPhysics(),
            child:ScrollConfiguration(
            behavior: CusBehavior(),
              child: Column(
                children:<Widget> [
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 0, 0, 10.h),
                    decoration: BoxDecoration(
                        color: tabBar
                    ),
                    width: 350.w,
                    height: 60.h,
                    child: Row(
                      children:<Widget> [
                        Container(
                          margin: EdgeInsets.fromLTRB(20.h, 0, 10.h, 0),
                          alignment: Alignment.center,
                          width: 40.h,
                          height: 40.h,
                          child: Image.asset('images/bangdream.jpg'),
                        ),
                        Container(
                          child: Text("Bangdream",style: TextStyle(fontSize: 16.sp),),
                        ),
                        Expanded(
                            child: Container(
                              width: 40.h,
                              alignment: Alignment.centerRight,
                              child: IconButton(
                                onPressed: (){

                                },
                                color: Colors.grey,
                                icon: Icon(Icons.arrow_forward_ios),
                              ),
                            ))
                      ],
                    ),
                  ),
                  Container(
                      decoration: BoxDecoration(
                          color: tabBar
                      ),
                      width: 350.w,
                      child: Container(

                        child: Column(
                          children:<Widget> [
                            Container(
                              alignment: Alignment.center,
                              height: 60.h,
                              width:350.w,
                              child: Row(
                                children:<Widget> [
                                  Container(
                                    margin:EdgeInsets.fromLTRB(10.w, 0, 10.w, 0),
                                    decoration: BoxDecoration(
                                        border: new Border.all(width: 0.5,color: Colors.white),
                                        borderRadius: BorderRadius.circular(80.w),
                                        image: DecorationImage(
                                            image:AssetImage('images/touxiang.jpg'),
                                            fit: BoxFit.cover
                                        )
                                    ),
                                    width: 40.w,
                                    height: 40.w,
                                  ),
                                  Container(
                                    alignment: Alignment.centerLeft,
                                    height: 40.w,
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children:<Widget> [
                                        Text("我是彩黑",style: userIdText,),
                                        Text("9小时前发的",style: annotationText,)
                                      ],
                                    ),
                                  ),
                                  Expanded(child: Container(
                                    margin: EdgeInsets.fromLTRB(0, 0, 10.w, 0),
                                    alignment: Alignment.centerRight,
                                    child: RaisedButton(
                                      color: attentionColor,
                                      onPressed: (){
                                      },
                                      shape: StadiumBorder(),
                                      child: Text("关注",style: attentionText,),
                                    ),
                                  )
                                  )
                                ],
                              ),
                            ),
                            Container(
                              child: Container(
                                margin:EdgeInsets.fromLTRB(20.w, 0, 10.w, 0),
                                child: Text(
                                  '求你了别发了我音游打得再菜我都不会觉得难过只有你们发这种成绩图的时候我的心里像刀割一样地痛着打着字泪水就忍不住地往下流而且怎么也达不到你们这样的水平的我真是自愧不如还要看着你们天天开开心心快快乐乐地收这歌收那歌感觉收歌就是家常便饭的事一样我真的看不下去就不能让我这个萌新好好在这里聊音游玩音游梗给那些和我一样菜的音游玩家鼓劲加油争取打到他们想要的成绩就这样真的不行吗我也是醉了现在的大佬怎么都这个样子还在为收没收歌而苦恼关键是还装个萌新说不会玩wdnmd这叫不会玩那会玩的是有多神仙自己也不想想好好打歌原本很开心的事被你们这些大佬弄得都不开心有什么意义真是的我也无力吐槽了看来我还是不适合玩音游不适合和你们这些自称不会玩的大佬正常交流不适合这个圈子所以我只能乖巧地看着你们随意发这样的成绩图我自己心里很过意不去的你们知道吗各位大佬们求求你们别再卖鶸了自己也不想想在这里的地位有多高说的话对得起音游圈吗还在这里发太菜能不能收敛点啊我去。'
                                  ,style: talkExpandText,
                                ),
                              ),
                            ),
                            Container(
                              width: 350.w,
                              height: 100.h,
                              alignment: Alignment.center,
                              margin: EdgeInsets.fromLTRB(10.w, 10.h, 20.w, 10.h),
                              child: Wrap(
                                spacing: 20.w,
                                children:<Widget> [
                                  imageCon('images/cai.jpg'),
                                  imageCon('images/cai2.jpg'),
                                  imageCon('images/cai3.jpg')
                                ],
                              ),
                            ),
                            Container(
                              height: 20.h,
                            )
                          ],
                        ),
                      )
                  ),
                  Container(
                    width: 350.w,
                    height: 40.h,
                    decoration: BoxDecoration(
                        color: tabBar
                    ),
                    margin: EdgeInsets.fromLTRB(0, 10.h, 0, 10.h),
                    child: Row(
                      children:<Widget> [
                        Container(
                          margin: EdgeInsets.fromLTRB(20.w, 0, 20.w, 0),
                          child: Text(
                            "赞 1",style: tabText,
                          ),
                        ),
                        Container(
                            margin: EdgeInsets.fromLTRB(10.w, 0, 0, 0),
                            child: Row(
                              children:<Widget> [
                                Text(
                                  "回复 1",style: tabText,
                                ),
                                Icon(Icons.arrow_drop_down_rounded,
                                  color: HexColor("#7E7E7E"),),

                              ],
                            )
                        ),
                        Expanded(child: Container(
                          margin: EdgeInsets.fromLTRB(0, 0, 10.w, 0),
                          child: Text("转发 0",style: tabText,),
                          alignment: Alignment.centerRight,
                        ))
                      ],
                    ),
                  ),
                  Container(
                    width: 350.w,
                    child: Column(
                      children:<Widget> [
                        commentCard(),
                        Divider(height: 1.w,
                          thickness: 1.w,),
                        Container(
                          height: 200.h,
                          decoration: BoxDecoration(
                            color: tabBar
                          ),
                          alignment: Alignment.center,
                          child: Container(
                            alignment: Alignment.center,
                              child: Text("没有更多内容了",style: tabText,),
                          )
                        )
                      ],
                    ),
                  )
                ],
              ),
            )
          )
        ),
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