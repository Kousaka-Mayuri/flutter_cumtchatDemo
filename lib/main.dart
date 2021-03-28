import 'package:flutter/material.dart';
import 'package:flutter_cumtchat/home/home_page.dart';
import 'package:flutter_cumtchat/login/login_page.dart';
import 'package:flutter_cumtchat/splash/splash_page.dart';
import 'package:flutter_cumtchat/user/ListView/settings_page.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  static GlobalKey<NavigatorState> navigator =GlobalKey();
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(350,700),
        allowFontScaling: false,
        builder:()=>MaterialApp(
          navigatorKey: navigator,
          routes: <String,WidgetBuilder>{
            '/login':(BuildContext context) => login(),
            '/home':(BuildContext context) => home_page(),
            '/settings':(BuildContext context) => settings_page()
          },
          title: '矿且',
          debugShowCheckedModeBanner: false,
          home:splash(),
        )
        );
  }
}

