
import 'package:flutter/material.dart';
import 'package:pjc_coding/app_http/user_http.dart';
import 'package:pjc_coding/component/my_widget.dart';
import 'package:pjc_coding/config/my_app.dart';
import 'package:pjc_coding/config/my_color.dart';
import 'package:pjc_coding/screen/home_screen.dart';
import 'package:provider/provider.dart';

import '../model/user_model.dart';
import '../vo/user.dart';
import 'add_user_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {


  TextEditingController idController = TextEditingController();
  TextEditingController pwController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/logo-icon.png',width: 70,),
            SizedBox(height: 20,),
            
            MyFormInput(
              textEditingController: idController,
              placeholder: '아이디',
            ),
            

            SizedBox(height: 10,),

            MyFormInput(
              textEditingController: pwController,
              isPassword: true,
              placeholder: '비밀번호',
            ),

            SizedBox(height: 20,),

            //todo 로그인 버튼
            Material(
              color: MyColor.appMainColor,
              borderRadius: BorderRadius.circular(8),
              child: InkWell(
                borderRadius: BorderRadius.circular(8),
                onTap: () async{
                  var id = idController.text;
                  var pw = pwController.text;



                  User user = await Provider.of<UserModel>(context,listen: false).loginAndSetMe(id: id, pw: pw);

                  if(user.userIdx==0){
                    MyApp.showToastMessage('가입된 계정이 없습니다.');
                  }else{
                    MyApp.showToastMessage('${user.nickname} 안녕하세요.');
                    Navigator.pushReplacement(
                      context, MaterialPageRoute(builder: (context) => HomeScreen()),
                    );
                  }



                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  width: 280,
                  height: 40,
                  child: Center(child: Text('로그인',style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.bold),)),
                ),
              ),
            ),

            SizedBox(height: 10,),
            //todo 회원가입 버튼
            Material(
              color: Color(0xffeaeaea),
              borderRadius: BorderRadius.circular(8),
              child: InkWell(
                borderRadius: BorderRadius.circular(8),
                onTap: (){
                  Navigator.push(
                    context, MaterialPageRoute(builder: (context) => AddUserScreen()),
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  width: 280,
                  height: 40,
                  child: Center(child: Text('회원가입',style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.bold),)),
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
