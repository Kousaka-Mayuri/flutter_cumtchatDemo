import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cumtchat/community/community_expandPage.dart';
import 'package:flutter_cumtchat/module/button.dart';
import 'package:flutter_cumtchat/module/cardCon.dart';
import 'package:flutter_cumtchat/module/colors.dart';
import 'package:flutter_cumtchat/module/commentCard.dart';
import 'package:flutter_cumtchat/module/imageCon.dart';
import 'package:flutter_cumtchat/module/textStyle.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:like_button/like_button.dart';
class talkCard extends StatefulWidget{
  @override
  final Function() click;
  const talkCard(this.click,{Key key});
  talk_card createState() => talk_card();
}

class talk_card extends State<talkCard>{
  @override
  Widget build(BuildContext context) {
    void comment() {
      final top = 12.h;
      final txBottom = 40.h;
      final txHeight = 100.h;
      showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (ctx) {
          return StatefulBuilder(builder: (ctx2, state) {
            return Container(
              height: MediaQuery.of(ctx2).viewInsets.bottom +
                  txHeight +
                  top +
                  txBottom,
              color: Colors.white,
              child: Stack(
                children: <Widget>[
                  Positioned(
                      left: 12.h,
                      bottom: (MediaQuery.of(ctx2).viewInsets.bottom < 0)
                          ? 0
                          : MediaQuery.of(ctx2).viewInsets.bottom,
                      right: 12.h,
                      top: top,
                      child: Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: <Widget>[
                                Expanded(
                                    child: Container(
                                      padding: EdgeInsets.all(8.w),
                                      height: txHeight,
                                      color: loginTFColor,
                                      child: TextField(
                                        // scrollPadding: EdgeInsets.zero,
                                        autofocus: true,
                                        maxLines: 4,
                                        style: TextStyle(
                                            fontSize: 15.sp, color: Colors.black),
                                        decoration: InputDecoration(
                                            contentPadding: EdgeInsets.zero,
                                            isDense: true,
                                            border: InputBorder.none),
                                      ),
                                    )),

                              ],
                            ),
                            Row(
                              children:<Widget> [
                                /*Container(
                                  height: txBottom,
                                  child: Image.asset(
                                    "images/pic.png",
                                    height: 30.h,
                                    width: 30.h,
                                  ),
                                ),*/
                                Expanded(
                                  child: GestureDetector(
                                    onTap: (){
                                      Navigator.of(context).pop();
                                    },
                                    child: Container(
                                      alignment: Alignment.bottomRight,
                                      padding: EdgeInsets.only(left: 12.w, right: 12.w),
                                      child: Text("发送",
                                          style: TextStyle(
                                              fontSize: 15.sp,
                                              color: Colors.orange)),
                                    ),),
                                  )
                              ],
                            )
                          ],
                        ),
                      ))
                ],
              ),
            );
          });
        },
      );
    }//评论弹出窗口
    return InkWell(
      onTap: (){
        widget.click();
      },
      child: Hero(tag: "BangdreamTalk", child: Material(
        child: Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.w)
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
                        /*Container(
                          height: 50.w,
                          width: 20.w,
                          alignment: Alignment.center,
                          child: InkWell(
                            child: Icon(Icons.arrow_drop_down_outlined),
                          ),
                        )*/
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
                          widget.click();
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
                              child:LikeButton(
                                size: 25.w,
                                likeBuilder: (bool isLiked){
                                },
                                likeCount: 100,
                              )
                            ),
                            Container(
                              width: 95.w,
                              child: homeClickButton('images/talk_pinglun.png', comment),)
                            ,
                            Container(
                              width: 95.w,
                              child: homeClickButton('images/talk_fenxiang.png', share),
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
        ),
      )),
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
    void comment() {
      final top = 12.h;
      final txBottom = 40.h;
      final txHeight = 100.h;
      showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (ctx) {
          return StatefulBuilder(builder: (ctx2, state) {
            return Container(
              height: MediaQuery.of(ctx2).viewInsets.bottom +
                  txHeight +
                  top +
                  txBottom,
              color: Colors.white,
              child: Stack(
                children: <Widget>[
                  Positioned(
                      left: 12.h,
                      bottom: (MediaQuery.of(ctx2).viewInsets.bottom < 0)
                          ? 0
                          : MediaQuery.of(ctx2).viewInsets.bottom,
                      right: 12.h,
                      top: top,
                      child: Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: <Widget>[
                                Expanded(
                                    child: Container(
                                      padding: EdgeInsets.all(8.w),
                                      height: txHeight,
                                      decoration: BoxDecoration(
                                        color: loginTFColor,
                                        borderRadius: BorderRadius.circular(10.w)
                                      ),
                                      child: TextField(
                                        // scrollPadding: EdgeInsets.zero,
                                        autofocus: true,
                                        maxLines: 4,
                                        style: TextStyle(
                                            fontSize: 15.sp, color: Colors.black),
                                        decoration: InputDecoration(
                                            contentPadding: EdgeInsets.zero,
                                            isDense: true,
                                            border: InputBorder.none),
                                      ),
                                    )),

                              ],
                            ),
                            Row(
                              children:<Widget> [
                                /*Container(
                                  height: txBottom,
                                  child: Image.asset(
                                    "images/pic.png",
                                    height: 30.h,
                                    width: 30.h,
                                  ),
                                ),*/
                                Expanded(
                                  child: GestureDetector(
                                    onTap: (){
                                      Navigator.of(context).pop();
                                    },
                                    child: Container(
                                      alignment: Alignment.bottomRight,
                                      margin: EdgeInsets.fromLTRB(0, 10.h, 0, 0),
                                      child: Text("发送",
                                          style: TextStyle(
                                              fontSize: 15.sp,
                                              color: Colors.orange)),
                                    ),),
                                )
                              ],
                            )
                          ],
                        ),
                      ))
                ],
              ),
            );
          });
        },
      );
    }//评论弹出窗口
    return Hero(
        tag: 'BangdreamTalk', child:Material(
        child: Scaffold(
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
          child:  Column(
            children: [
              Expanded(child:   SingleChildScrollView(
                scrollDirection: Axis.vertical,
                physics: BouncingScrollPhysics(),
                child:ScrollConfiguration(
                  behavior: CusBehavior(),
                  child: Column(
                    children:<Widget> [
                      GestureDetector(
                        onTap: (){
                          Navigator.push(
                              context,
                              CupertinoPageRoute(builder: (context)=>
                                  communityExPandCard()
                              ));
                        },
                        child:Container(
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
                                      color: Colors.grey,
                                      icon: Icon(Icons.arrow_forward_ios),
                                    ),
                                  ))
                            ],
                          ),
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
            )),
              Container(
                alignment: Alignment.center,
                child:FlatButton(
                  child: Text("写回复"),
                  onPressed: (){
                    comment();
                  },
                )
              )

            ],
          )
      ),
    ),));
  }
}

class CusBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return super.buildViewportChrome(context, child, axisDirection);
  }
}