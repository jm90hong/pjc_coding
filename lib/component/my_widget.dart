import 'package:flutter/material.dart';


class MyFormInput extends StatelessWidget {

  double width=280;
  TextEditingController textEditingController;
  bool isPassword=false;
  String placeholder='';


  MyFormInput({
    this.width=280,
    required this.textEditingController,
    this.isPassword=false,
    this.placeholder=''
  });



  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: Colors.grey.shade300,
            borderRadius: BorderRadius.circular(6)
        ),
        padding: EdgeInsets.symmetric(horizontal: 4),
        width: width,
        child: TextFormField(
          obscureText: isPassword,
          controller: textEditingController,
          style: TextStyle(color: Colors.black,fontSize:18),
          cursorColor: Colors.black,
          decoration: InputDecoration(
              isDense: true,
              fillColor: Colors.grey.shade300,
              border: InputBorder.none,
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              errorBorder: InputBorder.none,
              disabledBorder: InputBorder.none,
              hintText: placeholder
          ),
        )
    );
  }
}















