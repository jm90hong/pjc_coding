import 'package:flutter/material.dart';
import 'package:pjc_coding/model/user_model.dart';
import 'package:provider/provider.dart';

class DetailUserScreen extends StatefulWidget {


  int detailUserIdx=0;


  DetailUserScreen({
    required this.detailUserIdx
  });

  @override
  State<DetailUserScreen> createState() => _DetailUserScreenState();
}

class _DetailUserScreenState extends State<DetailUserScreen> {


  @override
  void initState() {
    // TODO: implement initState
    super.initState();


    //회원 상세 불러오기
    Provider.of<UserModel>(context,listen: false).setDetailUser(userIdx: widget.detailUserIdx);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('회원 상세보기',style: TextStyle(fontWeight: FontWeight.bold),),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 16,),
        width: double.infinity,
        height: double.infinity,
        child: Consumer<UserModel>(builder: (context, userModel, child){

          String subj = '';
          if(userModel.detailUser.interSubject=='mr'){
            subj='마라톤';
          }else if(userModel.detailUser.interSubject=='sc') {
            subj = '축구';
          }else if(userModel.detailUser.interSubject=='mt'){
            subj = '등산';
          }


          return Column(

            children: [

              SizedBox(height: 40,),

              UserInfoBox(
                title: '아이디',
                text: userModel.detailUser.id,
              ),

              UserInfoBox(
                title: '닉네임',
                text: userModel.detailUser.nickname,
              ),

              UserInfoBox(
                title: '주소',
                text: userModel.detailUser.address,
              ),

              UserInfoBox(
                title: '관심있는 운동',
                text: subj,
              ),

              UserInfoBox(
                title: '가입날짜',
                text: '${userModel.detailUser.createdDate.split(' ')[0]} 에 가입',
              ),


            ],
          );
        },)
      ),
    );
  }
}


class UserInfoBox extends StatelessWidget {

  String title;
  String text;

  UserInfoBox({
    required this.title,
    required this.text
  });



  @override
  Widget build(BuildContext context) {
    return  Container(
      margin: EdgeInsets.only(bottom: 25),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,style: TextStyle(color: Color(0xff999999),fontWeight: FontWeight.bold),),
          Text(text,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),)
        ],
      ),
    );
  }
}














