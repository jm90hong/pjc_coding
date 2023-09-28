


import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class MyApp{
  static String serverAddress='54.238.30.108:8080';



  static showToastMessage(String text){
    Fluttertoast.showToast(
        msg: text,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.black,
        textColor: Colors.white,
        fontSize: 16.0
    );

  }


}