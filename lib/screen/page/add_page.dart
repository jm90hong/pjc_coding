import 'package:flutter/material.dart';

class AddPage extends StatefulWidget {
  const AddPage({Key? key}) : super(key: key);

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          color: Colors.blue,
        )
    );
  }
}
