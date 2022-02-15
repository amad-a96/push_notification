import 'package:flutter/material.dart';

class Myscreen extends StatefulWidget {
  const Myscreen({Key? key}) : super(key: key);

  @override
  _MyscreenState createState() => _MyscreenState();
}

class _MyscreenState extends State<Myscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("hello"),
      ),
    );
  }
}
