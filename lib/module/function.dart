import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'dart:convert';

String decodeBase64(String data){
  return String.fromCharCodes(base64Decode(data));
}

String encodeBase64(String data){
  var content = utf8.encode(data);
  var digest = base64Encode(content);
  return digest;
}

Future<String> imageToBase64(File file) async {
  List<int> imageBytes = await file.readAsBytes();
  print('图片大小:' + imageBytes.length.toString());
  print("转移后的"+base64Encode(imageBytes));
  return  base64Encode(imageBytes);
}