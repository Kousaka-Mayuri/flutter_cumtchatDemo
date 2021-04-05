import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cumtchat/data/otherUser.dart';
import 'package:flutter_cumtchat/data/user.dart';
import 'package:flutter_cumtchat/module/cardCon.dart';
import 'package:flutter_cumtchat/module/colors.dart';
import 'package:flutter_cumtchat/module/stateCard.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class other extends StatefulWidget{
  @override
  _other createState() => _other();
}
bool isAtten;
cancelAtten()async{
  var cancel = 'https://moreover.atcumt.com/userinfo/unstar/'+otherUser.username;
  Dio dio = new Dio();
  Response response =await dio.delete(
      cancel,
      options: Options(
          headers: {
            'token':user.token
          }
      )
  );
  if(response.statusCode == 200){
    isAtten = !isAtten;
  }
}
class _other extends State<other>{
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isAtten = true;
  }
  @override
  Widget build(BuildContext context) {
    judgeAtten(){
      if(isAtten){
       return Text("已关注",
          style: TextStyle(
              fontSize: 14.sp,
              color: HexColor("#999999")
          ),);
      }
      else{
        return Text("未关注",
          style: TextStyle(
              fontSize: 14.sp,
              color: HexColor("#999999")
          ),);
      }
    }
    showDetail(){
      showDialog(
          context: context,
          builder: (context){
            return AlertDialog(
              title: Text("个性签名"),
              content: Text(otherUser.description),
            );
          });
    }
    return Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              elevation: 1,
              iconTheme: IconThemeData(
                  color: Colors.black
              ),
              expandedHeight:240.h,
              flexibleSpace: FlexibleSpaceBar(
                  background: Container(
                    child: Stack(
                      children: [
                        Container(
                          width: 350.w,
                          height: 150.h,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage("images/screen.jpg"),
                                  fit: BoxFit.cover
                              )
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(10.w, 125.h, 0, 0),
                          child: Column(
                            children: [
                              Container(
                                height: 120.h,
                                width: 350.w,
                                child: Row(
                                  children: [
                                    Container(
                                      margin: EdgeInsets.fromLTRB(0, 5.h, 0, 0),
                                      width: 85.h,
                                      height: 85.h,
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              width: 1.w,
                                              color: tabBar
                                          ),
                                          borderRadius: BorderRadius.circular(60.w),
                                          image: DecorationImage(
                                              image: MemoryImage(otherUser.bytes),
                                              fit: BoxFit.cover
                                          )
                                      ),
                                    ),
                                    Container(
                                        margin: EdgeInsets.fromLTRB(10.w, 40.h, 0, 0),
                                        width: 220.w,
                                        child: Column(
                                          children: [
                                            stateCard("11", "22", "153"),
                                            InkWell(
                                              highlightColor: Colors.transparent, // 透明色
                                              splashColor: Colors.transparent,
                                              onTap: (){
                                                  cancelAtten();
                                                  if(mounted)
                                                    setState(() {

                                                    });
                                              },
                                              child: Container(
                                                margin: EdgeInsets.fromLTRB(0, 5.h, 0, 0),
                                                padding: EdgeInsets.all(5.w),
                                                alignment: Alignment.center,
                                                width: 210.w,
                                                decoration: BoxDecoration(
                                                  color: HexColor("#E7E7E7"),
                                                    borderRadius: BorderRadius.circular(5.w),

                                                ),
                                                child: judgeAtten(),
                                              ),
                                            ),

                                          ],
                                        )
                                    ),

                                  ],
                                ),
                              ),
                              Container(
                                  width: 350.w,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Container(
                                        width: 280.w,
                                        child: Text(
                                          otherUser.description
                                          ,maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                      Expanded(
                                          child:Container(
                                            margin: EdgeInsets.fromLTRB(0, 0, 10.w, 0),
                                            alignment: Alignment.centerRight,
                                            child: InkWell(
                                              highlightColor: Colors.transparent, // 透明色
                                              splashColor: Colors.transparent,
                                              onTap: (){
                                                showDetail();
                                              },
                                              child: Text("详情",style: TextStyle(
                                                  color: HexColor("#2481C2")
                                              ),),
                                            ),
                                          )
                                      )
                                    ],
                                  )
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  )
              ),
              title: Container(
                child: Text(otherUser.nickname+"的主页",style: TextStyle(color: Colors.black),),
              ),
              backgroundColor: Colors.white,
              floating: true,
              snap: true,
              pinned: true,
            ),
            SliverList(
                delegate: SliverChildListDelegate(
                    [
                      Container(
                          width: 350.w,
                          child:
                          Container(
                              padding: EdgeInsets.all(10.w),
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
        )
    );
  }
}