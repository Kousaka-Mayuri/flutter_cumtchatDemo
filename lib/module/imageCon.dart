import 'dart:ffi';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class imageCon extends StatelessWidget{
  final String src;
  final Double width;
  final Double height;
  const imageCon(this.src,{Key key,this.width,this.height}):super(key:key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80.w,
      height: 80.w,
      margin: EdgeInsets.fromLTRB(10.w, 0, 0, 0),
      child: Image.asset(src,
        fit: BoxFit.cover,
      ),
    );
  }
}