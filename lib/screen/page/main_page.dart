import 'package:flutter/material.dart';


class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {


  String nowCategory='전체';
  double imageSize=60;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16),
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: [
            SizedBox(height: 30,),

            //todo 상단 프로필 박스
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('안녕',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                    Text('나의 코딩 공부 리스트!',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black54),)
                  ],
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(imageSize/2),
                  child: Image.network(
                    'https://i.pinimg.com/736x/8b/ce/fa/8bcefa78a8dec63c7dcfe7152515ddd0.jpg',
                    width: imageSize,
                    height: imageSize,
                  ),
                )
              ],
            ),

            //todo 카테고리 버튼 박스
            Row(
              children: [
                CategoryButton(
                  text: '전체',
                  isSelected: nowCategory=='전체' ? true : false,
                  onClick: (){
                    setState(() {
                      nowCategory='전체';
                      //imageSize=60;
                    });
                  },
                ),
                CategoryButton(
                  text: '플러터',
                  isSelected: nowCategory=='플러터' ? true : false,
                  onClick: (){
                    setState(() {
                      nowCategory='플러터';
                      //imageSize=75;
                    });
                  },
                ),
                CategoryButton(
                  text: '스프링',
                  isSelected: nowCategory=='스프링' ? true : false,
                  onClick: (){
                    setState(() {
                      nowCategory='스프링';
                      //imageSize=90;
                    });
                  },
                )
              ],
            ),

            SizedBox(height: 20,),

            //todo 공부 리스트 박스
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    buildTodoBox(
                        text: '플러터',
                        content: 'setState 공부하기'
                    ),
                    buildTodoBox(
                        text: '스프링',
                        content: 'Dao 공부하기'
                    ),
                    buildTodoBox(
                        text: '데이터베이스',
                        content: '데이터베이스 설치하기'
                    ),
                    buildTodoBox(
                        text: '리눅스서버',
                        content: '라이트세일 서버 호스팅하기'
                    ),
                    buildTodoBox(
                        text: '플러터',
                        content: 'setState 공부하기'
                    ),
                    buildTodoBox(
                        text: '스프링',
                        content: 'Dao 공부하기'
                    ),
                    buildTodoBox(
                        text: '데이터베이스',
                        content: '데이터베이스 설치하기'
                    ),
                    buildTodoBox(
                        text: '리눅스서버',
                        content: '라이트세일 서버 호스팅하기'
                    ),
                    buildTodoBox(
                        text: '플러터',
                        content: 'setState 공부하기'
                    ),
                    buildTodoBox(
                        text: '스프링',
                        content: 'Dao 공부하기'
                    ),
                    buildTodoBox(
                        text: '데이터베이스',
                        content: '데이터베이스 설치하기'
                    ),
                    buildTodoBox(
                        text: '리눅스서버',
                        content: '라이트세일 서버 호스팅하기'
                    ),



                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}



Widget buildTodoBox({required String text, required String content}){

  return Container(
    width: double.infinity,
    height: 70,
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(text,style: TextStyle(color: Colors.blue,fontSize: 18,fontWeight: FontWeight.bold),),
            Text(content,style: TextStyle(fontWeight: FontWeight.bold,color: Color(0xff222222)),),
          ],
        ),
        OutlinedButton(
            onPressed: (){},
            child: Text('완료')
        )
      ],
    ),
  );
}




class CategoryButton extends StatelessWidget {

  String text;
  bool isSelected;
  Function() onClick;


  CategoryButton({
    required this.text,
    required this.isSelected,
    required this.onClick
  });


  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: (){
        onClick();

      },
      child: Container(
        margin: EdgeInsets.only(right: 8),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.blue,width: 1),
          borderRadius: BorderRadius.circular(10),
          color:  isSelected ?  Colors.blue : Colors.white,
        ),
        padding: EdgeInsets.symmetric(vertical: 2,horizontal: 15),
        child: Text(
          text,
          style: TextStyle(
              color: isSelected ?  Colors.white : Colors.blue,
              fontWeight: FontWeight.bold,
              fontSize: 14
          ),
        ),
      ),
    );
  }
}








