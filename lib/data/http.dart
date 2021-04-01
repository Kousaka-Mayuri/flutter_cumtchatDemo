import 'package:dio/dio.dart';
import 'package:flutter_cumtchat/data/user.dart';
class Http{
  var resgister = 'https://moreover.atcumt.com/user/register';
  var login = 'https://moreover.atcumt.com/user/login';
  var info = 'https://moreover.atcumt.com/userinfo/userinfo/'+user.username;
  var alertName = 'https://moreover.atcumt.com/userinfo/nickname/'+user.willNickname;
  getInfo()async{
    Dio dio = await Dio();
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
    Dio dio = await Dio();
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
}

Http http = new Http();