import 'package:flutter/material.dart';

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}

Color loginButtonColor = HexColor("#00dc9c");//登录按钮颜色·
Color loginTFColor = HexColor("#F2F2F4");//灰色颜色
Color homeColor = HexColor("#fafafa");
Color tabBar = HexColor("#ffffff");//纯白色
Color black = HexColor("#000000");//纯黑色
Color lightGrey = HexColor("#A3A3A3");//亮灰色
Color attentionColor = HexColor('#0F9C57');//关注原谅色