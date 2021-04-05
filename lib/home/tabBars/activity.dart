import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cumtchat/data/activity.dart';
import 'package:flutter_cumtchat/data/http.dart';
import 'package:flutter_cumtchat/data/user.dart';
import 'package:flutter_cumtchat/login/enter/login.dart';
import 'package:flutter_cumtchat/module/cardCon.dart';
import 'package:flutter_cumtchat/module/colors.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class activity extends StatefulWidget
{
  @override
  _activity createState() => _activity();
}
List<String> picture = ['images/swiper1.jpg','images/swiper2.jpg','images/swiper3.jpg'];

class _activity extends State<activity>
{
  RefreshController _refreshController =
  RefreshController(initialRefresh: false);
  @override
  void initState() {
    super.initState();

  }
  Future getActivity() async{
    Dio dio = new Dio();
    Response response = await dio.get(
        'https://moreover.atcumt.com/posts/post/'+actInfo.page.toString()+'/1',
        options: Options(
            headers: {
              "token":user.token
            }
        ));
    List newData = response.data['data']['content'];
    actInfo.activityList .addAll(newData);
    actInfo.thisCount = response.data['totalElements'];
    print(actInfo.page);
  }
  void _onRefresh() async {
    await Future.delayed(Duration(milliseconds: 1000));
    _refreshController.refreshFailed();
  }
  void _onLoading() async {
    if(
      actInfo.page < actInfo.allPage
    ){
      actInfo.page++;
      await getActivity();
      _refreshController.loadComplete();
    }
    if(
    actInfo.page == actInfo.allPage
    )
      {
        _refreshController.loadNoData();
      }
    if (mounted) setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
        body:Container(
            padding: EdgeInsets.all(7.w),
            child: SmartRefresher(
              enablePullDown: true,
              enablePullUp: true,
              header: CustomHeader(
                builder: (BuildContext context,RefreshStatus mode){
                  Widget body;
                  if(mode == RefreshStatus.failed){
                    body = Text("加载失败，请假查网络");
                  }
                  if(mode == RefreshStatus.idle)
                    {

                    }
                  if(mode == RefreshStatus.canRefresh){
                    body = Text("松手加载更多");
                  }
                  if(mode == RefreshStatus.refreshing){
                    body = CircularProgressIndicator();
                  }
                  else{
                    body = Text("加载完成");
                  }
                  return Container(
                    height: 55.0,
                    child: Center(child: body),
                  );
                },
              ),
              footer: CustomFooter(
                builder: (BuildContext context,LoadStatus mode){
                  Widget body;
                  if (mode == LoadStatus.idle) {
                    body = Text("正在加载");
                  } else if (mode == LoadStatus.loading) {
                    body = CircularProgressIndicator();
                  } else if (mode == LoadStatus.failed) {
                    body = Text("Load Failed!Click retry!");
                  } else if (mode == LoadStatus.canLoading) {
                    body = Text("松手获取内容");
                  } else {
                    body = Text("没有更多内容");
                  }
                  return Container(
                    height: 55.0,
                    child: Center(child: body),
                  );
                },
              ),
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: actInfo.activityList.length,
                itemBuilder: (context,index){
                  return
                    actCard(
                      head:actInfo.activityList[index]['head'],
                      title: actInfo.activityList[index]['title'],
                      picList: actInfo.activityList[index]['thumbnailImage'],
                      location: actInfo.activityList[index]['location'],
                      time: actInfo.activityList[index]['startTime']+'-'+actInfo.activityList[index]['cutoffTime'],
                      detail: actInfo.activityList[index]['detail'],
                      id: actInfo.activityList[index]['id'],
                      description: actInfo.activityList[index]["outline"],
                      publisher: actInfo.activityList[index]['publisher'],
                      star: actInfo.activityList[index]['star'],
                    );
                },
              ),
              controller: _refreshController,
              onRefresh: _onRefresh,
              onLoading: _onLoading,
            )
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
