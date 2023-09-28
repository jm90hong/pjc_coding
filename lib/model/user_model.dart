

import 'package:flutter/material.dart';
import 'package:pjc_coding/app_http/user_http.dart';
import '../vo/user.dart';

class UserModel extends ChangeNotifier{
  User me = User();
  List<User> userList=[];

  User detailUser = User();



  void setDetailUser({required int userIdx}) async{
    detailUser=User();
    detailUser = await UserHttp.getUser(userIdx: userIdx);
    notifyListeners();

  }


  void setUserList() async{
    userList = await UserHttp.getAllUsers();
    notifyListeners();
  }


  Future<User> loginAndSetMe({required String id, required String pw}) async{
    User result = await UserHttp.getAuthUser(id: id, pw: pw);
    me=result;
    notifyListeners();

    return result;
  }









}