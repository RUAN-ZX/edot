import 'package:flutter/material.dart';

class register extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("register"),
      ),
      body: Center(
        child: Text("register",style: TextStyle(fontSize: 50),),
      ),
    );
  }

}