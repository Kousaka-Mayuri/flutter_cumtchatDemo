import 'package:dio/dio.dart';
import 'package:flutter_cumtchat/data/activity.dart';
import 'package:flutter_cumtchat/data/user.dart';
class Http{
  var resgister = 'https://moreover.atcumt.com/user/register';
  var login = 'https://moreover.atcumt.com/user/login';
  var info = 'https://moreover.atcumt.com/userinfo/userinfo/'+user.username;
  var alertName = 'https://moreover.atcumt.com/userinfo/nickname/'+user.willNickname;
  var attentions = 'https://moreover.atcumt.com/userinfo/follow/'+user.username;
  var fans = 'https://moreover.atcumt.com/userinfo/followers/'+user.username;
  var head = 'https://moreover.atcumt.com/userinfo//userinfo';
  var activityUrl = 'https://moreover.atcumt.com/posts/post/1/3';
  getInfo()async{
    Dio dio = new Dio();
    Response response = await dio.get(
        info,
      options:Options(
        headers: {
          'token':user.token
        }
      )
    );
    print(response.data);
    user.exp = response.data['data']['exp'];
    user.nickname = response.data['data']['nickname'];
  }
  alertNickname()async{
    Dio dio = new Dio();
    Response response = await dio.put(
      alertName,
        options:Options(
            headers: {
              'token':user.token
            }
        )
    );
    print(response.data);
  }
  getFans()async{
    Dio dio = new Dio();
    Response response = await dio.get(fans,
        options: Options(
            headers: {
              'token':user.token
            }
        )
    );
    print(response.data);
    user.fansList = response.data['data'];
    print("获取粉丝列表");
  }
  getAttention()async{
    Dio dio = new Dio();
    Response response = await dio.get(
      attentions,
      options: Options(
        headers: {
          'token':user.token
        }
      )
    );
    print(response.data);
    user.attentionList = response.data['data'];
    print("获取关注列表");
  }
  putHead()async{
      Dio dio = new Dio();
      Response response = await dio.put(
        head,
        options: Options(
          headers: {
            'token':user.token
          }
        ),
          data: {
          'head':user.base64Head
      }
      );
      print("上传");
  }
  getActivity() async{
    Dio dio = new Dio();
    Response response = await dio.get(
        activityUrl,
        options: Options(
            headers: {
              "token":user.token
            }
        ));
    actInfo.activityList = response.data['data']['content'];
    actInfo.thisCount = response.data['totalElements'];

  }
}

Http http = new Http();