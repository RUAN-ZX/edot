import 'package:flutter/material.dart';

/// me页面不需要联网
class me extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(

      ),
      body: Center(
        child: Text("me",style: TextStyle(fontSize: 50),),
      ),
    );
  }

}