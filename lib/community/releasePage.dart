import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cumtchat/module/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:chewie/chewie.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';

class release extends StatefulWidget{
  final String community;

  @override
  const release({Key key,this.community});
  _release createState() => _release();
}

class _release extends State<release>{
  var _imagePath;
  List  _imageList = [];
  TextEditingController _controller;
  @override
  Widget build(BuildContext context) {
    Future openGallery()async{
      var image = await ImagePicker.pickImage(source:ImageSource.gallery);
      setState(() {
        _imagePath = image;
      });
      print(_imagePath.toString());
      if(_imagePath != null){
        _imageList.add(_imagePath);
      }
    }
    Widget _imageView(imagePath){
      return Container(
        width: 100.w,
        height: 100.w,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: FileImage(imagePath),
                fit: BoxFit.cover
            )
        ),
      );
    }
    Widget buildPictureList(){
      List<Widget> pics = [];
      Widget content;
      if(_imageList.isEmpty){
        return Container();
      }else{
        for(var item in _imageList){
          pics.add(
              _imageView(item)
          );
        }
        content = new Wrap(
          children: pics,
        );
        return content;
      }
    }
    Widget picWrap = buildPictureList();
    showBottom(){
      showModalBottomSheet(
          context: context,
          builder: (context){
              return Container(
                margin: EdgeInsets.fromLTRB(0,20.h, 0, 0),
                height: 90.h,
                child: Wrap(
                  alignment: WrapAlignment.spaceAround,
                  children: [
                      Container(
                        child: GestureDetector(
                          onTap: openGallery,
                          child: Container(
                            child: Column(
                              children: [
                                Container(
                                  height: 50.w,
                                  width: 50.w,
                                  child: Image.asset('images/release/picture.png',
                                    fit: BoxFit.cover,),
                                ),
                                Text("图片")
                              ],
                            )
                          ),
                        ),
                      ),
                     Container(
                       child:  GestureDetector(
                         child: Container(
                           child: Column(
                             children: [
                               Container(
                                 width: 50.w,
                                 height: 50.w,
                                 child: Image.asset('images/release/video.png',
                                   fit: BoxFit.cover,),
                               ),
                               Text("视频")
                             ],
                           )
                         ),
                       ),
                     )
                  ],
                ),
              );
      });
    }
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child:Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/release/more.png')
            )
          ),
        ),
        onPressed: (){
              showBottom();
        },
      ),
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(40.h),
          child: AppBar(
            backgroundColor: tabBar,
            elevation: 0,
            automaticallyImplyLeading: false,
            title: Container(
              width: 350.w,
              child: Row(
                children: [
                  Expanded(
                        child: Container(
                          alignment: Alignment.center,
                        width: 50.w,
                          child: GestureDetector(
                            onTap: (){
                              Navigator.of(context).pop();
                            },
                            child: Icon(Icons.clear,
                              color: Colors.black,),
                          ),
                        ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    width: 250.w,
                    child: Text("发布到"+widget.community+"社区",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15.sp
                    ),),
                  ),
                  Container(
                    alignment: Alignment.center,
                    width: 50.w,
                    child: GestureDetector(
                      onTap: (){

                      },
                      child: Text("发布",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 15.sp
                          )
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      body: Container(
        child: Column(
          children: [
            Container(
              width: 350.w,
              child: TextField(
                maxLines: 1,
                decoration: InputDecoration(
                  hintText: "标题"
                ),
              ),
            ),
            Container(
              child: TextField(
                decoration: InputDecoration(
                  hintText: "您要发布的内容"
                ),
                maxLines: 15,
                controller: _controller,
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              width: 280.w,
              height: 50.h,
              child: Text("图片",style: TextStyle(
                fontSize: 15.sp,
                fontWeight: FontWeight.bold
              ),),
            ),
            Expanded(
                child: CustomScrollView(

                  slivers: [
                    SliverList(
                        delegate: SliverChildListDelegate(
                      [
                        Container(
                          alignment: Alignment.center,
                            child: picWrap
                        )
                      ]
                    ))
                  ],
                )
            )
          ],
        ),
      ),
    );

  }

}
