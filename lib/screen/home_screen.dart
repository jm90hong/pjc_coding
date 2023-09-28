import 'package:flutter/material.dart';
import 'package:pjc_coding/config/my_color.dart';
import 'package:pjc_coding/screen/page/add_page.dart';
import 'package:pjc_coding/screen/page/info_page.dart';
import 'package:pjc_coding/screen/page/main_page.dart';
import 'package:pjc_coding/screen/page/user_list_page.dart';




class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {


  int nowIndex=0;

  List<Widget> pages = [
    UserListPage(),
    MainPage(),
    AddPage(),
    InfoPage()
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('코딩 공부일정 앱',style: TextStyle(fontWeight: FontWeight.bold),),
      ),
      body: pages[nowIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline_rounded),
            label: '회원들',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '홈',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: '일정등록',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info_outline),
            label: '앱정보',
          ),
        ],
        currentIndex: nowIndex, // 지정 인덱스로 이동
        selectedItemColor: MyColor.appMainColor,

        onTap: (index){

          setState(() {
            nowIndex=index;
          });

        }, // 선언했던 onItemTapped
      ),
    );
  }
}




