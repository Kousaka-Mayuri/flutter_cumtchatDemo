import 'package:flutter/material.dart';

class settings_page extends StatefulWidget{
  @override
  _settings createState() => _settings();
}

class _settings extends State<settings_page>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        iconTheme: IconThemeData(
          color: Colors.black
        ),
        backgroundColor: Colors.white,
        title: Text("设置",style: TextStyle(color: Colors.grey),
        ),
      ),
      body: Container(
          child:ListView(
            children: [
              ListTile(
                title: Text("夜间模式"),
          ),
          ],
      ),
      )
    );
  }
}