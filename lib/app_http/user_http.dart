import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:pjc_coding/config/my_app.dart';

import '../vo/user.dart';


class UserHttp{



  //todo 회원 조회
  static Future<User> getUser({required int userIdx}) async{
    var uri = Uri.http(MyApp.serverAddress,'pjc_final/user/detail',{
      'uidx': userIdx.toString()
    });

    var response = await http.get(uri);

    var map = jsonDecode(utf8.decode(response.bodyBytes));


    User user = User.fromJson(map);


    return user;

  }




  static Future<List<User>> getAllUsers() async{
    //todo 회원가입 서버 요청 http://54.238.30.108:8080/pjc_final/user/create
    var uri = Uri.http(MyApp.serverAddress,'pjc_final/user/all',{});

    var response = await http.get(uri);

    var jsonList = jsonDecode(utf8.decode(response.bodyBytes));



    List<User> list = [];

    for(int i=0; i<jsonList.length;i++){
      var map = jsonList[i];
      User user = User.fromJson(map);
      list.add(user);
    }



    return list;

  }





  static Future<User> getAuthUser({required String id, required String pw}) async{

    var uri = Uri.http(MyApp.serverAddress,'pjc_final/user/loginForApp',{
      'id':id.toString(),
      'pw':pw.toString(),
    });

    var response = await http.get(uri);


    if(response.body.isEmpty){
      //값이 없는 경우
      return User();
    }else{
      //값이 있는 경우 (로그인 성공)
      var map = jsonDecode(response.body);
      User user = User.fromJson(map);
      return user;
    }
  }






  static Future<String> save({required User user}) async{
    //todo 회원가입 서버 요청 http://54.238.30.108:8080/pjc_final/user/create
    var uri = Uri.http(MyApp.serverAddress,'pjc_final/user/create',{
      'id':user.id.toString(),
      'pw':user.pw.toString(),
      'nn':user.nickname.toString(),
      'addr':user.address.toString(),
      'subject':user.interSubject.toString()
    });

    var response = await http.get(uri);


    return response.body;

  }


}