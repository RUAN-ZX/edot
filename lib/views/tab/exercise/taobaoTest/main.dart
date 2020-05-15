import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../taobaoTest/common/style/gzx_style.dart';
import '../taobaoTest/ui/page/drawer/gzx_filter_goods_page.dart';
import '../taobaoTest/ui/page/gzx_bottom_navigation_bar.dart';
import '../taobaoTest/ui/page/home/searchlist_page.dart';
import '../taobaoTest/ui/page/test/AnimateExpanded.dart';
import '../taobaoTest/ui/page/test/ExpansionList.dart';
import '../taobaoTest/ui/page/test/SliverWithTabBar.dart';
import '../taobaoTest/ui/page/test/act_page.dart';
import '../taobaoTest/ui/page/test/gridview_height_page.dart';
import '../taobaoTest/ui/page/test/gzx_dropdown_menu_test_page.dart';
import '../taobaoTest/ui/page/test/my_home_page.dart';
import '../taobaoTest/ui/page/test/scroll_page.dart';
import '../taobaoTest/ui/page/test/scroll_page1.dart';
import '../taobaoTest/ui/page/test/textfield_test_page.dart';

import 'common/utils/provider.dart';
import 'common/utils/shared_preferences.dart';

SpUtil sp;
var db;

//void main() async {
//  final provider = new Provider();
//  await provider.init(true);
//  sp = await SpUtil.getInstance();
//  db = Provider.db;
//  if (Platform.isAndroid) {
//    // 以下两行 设置android状态栏为透明的沉浸。写在组件渲染之后，是为了在渲染后进行set赋值，覆盖状态栏，写在渲染之前MaterialApp组件会覆盖掉这个值。
//    SystemUiOverlayStyle systemUiOverlayStyle = SystemUiOverlayStyle(statusBarColor: Colors.transparent);
//    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
//  }
//
//  runApp(MyApp());
//}

class taobao extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double i = 84.99998982747397;

    print(i.toInt());

    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: GZXColors.primarySwatch,
      ),
      home: GZXBottomNavigationBar(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
