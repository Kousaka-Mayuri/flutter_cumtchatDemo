import 'package:flutter/material.dart';
import 'package:flutter_cumtchat/data/user.dart';
import 'package:flutter_cumtchat/module/textStyle.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class splash extends StatefulWidget{
  @override
  _splash createState() =>_splash();
}

class _splash extends State<splash>
{
  bool haveToken;
  void goHome() {
    Navigator.of(context).pushReplacementNamed('/login');
  }
  void goMain(){
    Navigator.of(context).pushReplacementNamed('/main');
  }

  void setTime(){
    var _duration = new Duration(seconds: 2);
    if(haveToken){
      Future.delayed(_duration,goMain);
    }
    else{
      Future.delayed(_duration,goHome);
    }
  }
  getIsLogin(){
    try{
      user.token = user.prefs.getString('token');
      user.username = user.prefs.getString('username');
      print("object1");
    }catch(e){
      haveToken =false;
      print('object');
    }
  }
  @override
  void initState() {
    super.initState();
    haveToken =true;
    getIsLogin();
    setTime();
  }
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        body: Container(
          alignment: Alignment.bottomRight,
          width: 350.w,
          height: 700.h,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/splash.jpg'),
              fit: BoxFit.cover
            )
          ),
          child: OutlineButton(
                onPressed: goHome,
                child: Text("跳过",textAlign: TextAlign.center,style: skipText,),
            shape: StadiumBorder(),
          ),
        ),
      ),
    );
  }
}

