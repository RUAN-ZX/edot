import 'package:flutter/material.dart';
import 'views/discover/discover.dart';
import 'views/exercise/exercise.dart';
import 'views/me/me.dart';
import 'views/record/record.dart';



main(List<String> args) => edot();


class edot extends StatelessWidget {
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
      body: IndexedStack(
        index: _currentIndex,
        children: <Widget>[
//          Home(),
//          Subject(),
//          Group(),
//          Mall(),
//          Profile()
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
//        selectedFontSize: 14,
//        unselectedFontSize: 14,
        type: BottomNavigationBarType.fixed,
        items: [
          createItem("record", "记录"),
          createItem("discover", "发现"),
          createItem("exercise", "锻炼"),
          createItem("me", "我的"),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),

    );
  }
}


BottomNavigationBarItem createItem(String iconName, String title) {
  return BottomNavigationBarItem(
//      icon: Image.asset("assets/icon/$iconName.png", width: 30,),
      icon: Icon(Icons.fitness_center),

//      activeIcon: Image.asset("assets/images/tabbar/${iconName}_active.png", width: 30,),
      title: Text(title)
  );
}
