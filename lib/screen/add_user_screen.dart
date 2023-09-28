import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pjc_coding/app_http/user_http.dart';
import 'package:pjc_coding/component/my_widget.dart';
import 'package:pjc_coding/config/my_app.dart';
import 'package:pjc_coding/config/my_color.dart';
import 'package:http/http.dart' as http;

import '../vo/user.dart';



class AddUserScreen extends StatefulWidget {
  const AddUserScreen({Key? key}) : super(key: key);

  @override
  State<AddUserScreen> createState() => _AddUserScreenState();
}

class _AddUserScreenState extends State<AddUserScreen> {

  String _subject = '마라톤';

  TextEditingController idController = TextEditingController();
  TextEditingController pwController = TextEditingController();
  TextEditingController pwCheckController = TextEditingController();
  TextEditingController nickController = TextEditingController();
  TextEditingController addressController = TextEditingController();


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('회원가입하기'),
      ),

      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      buildTitle('아이디'),
                      MyFormInput(
                        textEditingController: idController,
                        placeholder: '아이디',
                      ),

                      buildTitle('비밀번호'),
                      MyFormInput(
                        isPassword: true,
                        textEditingController: pwController,
                        placeholder: '비밀번호',
                      ),

                      buildTitle('비밀번호 확인'),
                      MyFormInput(
                        isPassword: true,
                        textEditingController: pwCheckController,
                        placeholder: '비밀번호 확인',
                      ),

                      buildTitle('닉네임'),
                      MyFormInput(
                        textEditingController: nickController,
                        placeholder: '닉네임',
                      ),

                      buildTitle('주소'),
                      MyFormInput(
                        width: double.infinity,
                        textEditingController: addressController,
                        placeholder: '주소',
                      ),

                      buildTitle('좋아하는 운동'),
                      ListTile(
                        title: Text('마라톤'),
                        leading: Radio(
                          value: '마라톤',
                          groupValue: _subject,
                          onChanged: (value) {
                            setState(() {
                              _subject = value!;
                            });
                          },
                        ),
                      ),
                      ListTile(
                        title: Text('축구'),
                        leading: Radio(
                          value: '축구',
                          groupValue: _subject,
                          onChanged: (value) {
                            setState(() {
                              _subject = value!;
                            });
                          },
                        ),
                      ),
                      ListTile(
                        title: Text('등산'),
                        leading: Radio(
                          value: '등산',
                          groupValue: _subject,
                          onChanged: (value) {
                            setState(() {
                              _subject = value!;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),


            Material(
              color: MyColor.appMainColor,
              child: InkWell(
                onTap: () async{
                  var id = idController.text;
                  var pw = pwController.text;
                  var pwChk = pwCheckController.text;
                  var nick = nickController.text;
                  var address = addressController.text;
                  var sbj = 'mr';



                  if(_subject=='마라톤'){
                    sbj='mr';
                  }else if(_subject=='등산'){
                    sbj='mt';
                  }else if(_subject=='축구'){
                    sbj='sc';
                  }


                  if(id.isEmpty){
                    MyApp.showToastMessage('아이디를 적어주세요');
                    return;
                  }

                  if(pw.isEmpty){
                    MyApp.showToastMessage('비밀번호를 적어주세요');
                    return;
                  }

                  if(nick.isEmpty){
                    MyApp.showToastMessage('닉네임을 적어주세요');
                    return;
                  }

                  if(address.isEmpty){
                    MyApp.showToastMessage('주소를 적어주세요');
                    return;
                  }


                  if(pw != pwChk){
                    MyApp.showToastMessage('비밀번호가 일치하지 않습니다.');
                    return;
                  }



                  User one = User(
                    id: id,
                    pw: pw,
                    nickname: nick,
                    address: address,
                    interSubject: sbj
                  );

                  var result = await UserHttp.save(user: one);


                  if(result=='id'){
                    MyApp.showToastMessage('이미 가입된 아이디가 있습니다.');
                  }else if(result=='nick'){
                    MyApp.showToastMessage('이미 가입된 닉네임이 있습니다.');
                  }else if(result=='ok'){
                    MyApp.showToastMessage('회원가입 완료');
                    Navigator.pop(context);
                  }


                },
                child: Container(
                  width: double.infinity,
                  height: 50,
                  child: Center(
                    child: Text('회원 가입하기', style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold),),
                  ),
                ),
              ),
            )




          ],
        ),
      ),
    );
  }
}

Widget buildTitle(String title){
  return Padding(
    padding: EdgeInsets.only(top: 20,bottom: 4),
    child: Text(title,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14),),
  );
}


