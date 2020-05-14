import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'discover/discover.dart';
import 'exercise/exercise.dart';
import 'me/me.dart';
import 'record/record.dart';


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';

import '../loginAndRegister/login.dart';
import '../loginAndRegister/register.dart';

class tab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "易点健身",
      theme: ThemeData(
        primaryColor: Colors.lightBlueAccent,
//          highlightColor: Colors.transparent,
//          splashColor: Colors.transparent
      ),
      home: MyStackPage(),
      // MyStackPage就是我们的核心页面 用scaffold 构建页面
    );
  }
}

class MyStackPage extends StatefulWidget {
  @override
  _MyStackPageState createState() => _MyStackPageState();
}

class _MyStackPageState extends State<MyStackPage> {

  var _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
//      appBar: AppBar(
//            shape: BoxShape.rectangle,
//        title: Center(
//          child:Text(
//            "I am the bar at the beginning.",
//            style: TextStyle(
//              fontSize: 15,
//              color: Colors.amberAccent,
//            ),
//          ),
//        ),
//      ),
      body: IndexedStack(
        index: _currentIndex,
        children: <Widget>[
          record(),
          discover(),
//          exercise(),
          me(),

//          Profile()
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
//        selectedFontSize: 14,
//        unselectedFontSize: 14,
        type: BottomNavigationBarType.fixed,
        items: [
//          createItem("record", "记录"),
//          createItem("discover", "发现"),
//          createItem("exercise", "训练"),
//          createItem("me", "我的"),
          createItem(1, "记录"),
          createItem(2, "发现"),
          createItem(3, "训练"),
          createItem(4, "我的"),
        ],
        onTap: (index) {
          if(index==2){
            Navigator.of(context).push(
              MaterialPageRoute(
                  builder: (BuildContext context){
                    return exercisePage();
                  }
              ),
            );
          }
          else{
            setState(() {
              _currentIndex = index;
            });
          }
        },
      ),

    );
  }
}


BottomNavigationBarItem createItem(int page, String title) {
  var list_icon = [Icons.event_note,Icons.remove_red_eye,Icons.fitness_center,Icons.person];
  return BottomNavigationBarItem(
//      icon: Image.asset("assets/icon/$iconName.png", width: 30,),
      icon: Icon(list_icon[page-1]),
      title: Text(title)
  );
}
