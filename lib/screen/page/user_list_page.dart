import 'package:flutter/material.dart';
import 'package:pjc_coding/screen/detail_user_screen.dart';
import 'package:provider/provider.dart';

import '../../model/user_model.dart';
import '../../vo/user.dart';


class UserListPage extends StatefulWidget {
  const UserListPage({Key? key}) : super(key: key);

  @override
  State<UserListPage> createState() => _UserListPageState();
}

class _UserListPageState extends State<UserListPage> {


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Provider.of<UserModel>(context,listen: false).setUserList();
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Consumer<UserModel>(builder: (context, userModel, child){
          return SingleChildScrollView(
            child: Column(
              children: userModel.userList.map((u) => buildUserBox(user:u, ctx:context)).toList(),
            ),
          );
        },
      )
    );
  }
}


Widget buildUserBox({required User user, required BuildContext ctx}){

  String subject='';

  if(user.interSubject=='mr'){
    subject='마라톤';
  }else if(user.interSubject=='mt'){
    subject='등산';
  }else if(user.interSubject=='sc'){
    subject='축구';
  }



  return GestureDetector(
    onTap: (){
      Navigator.push(
        ctx, MaterialPageRoute(builder: (context) => DetailUserScreen(detailUserIdx: user.userIdx,)),
      );
    },
    child: Container(
      padding: EdgeInsets.symmetric(horizontal: 16),
      width: double.infinity,
      height: 90,
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(user.id,style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 15),),
          SizedBox(height: 5,),
          Text(user.nickname,style: TextStyle(color: Color(0xff999999),fontWeight: FontWeight.bold,fontSize: 14),),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(subject,style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold,fontSize: 14),),
              Text(user.createdDate.split(' ')[0]),
            ],
          )
        ],
      ),
    ),
  );
}


