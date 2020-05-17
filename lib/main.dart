import 'package:flutter/material.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';

import 'views/loginAndRegister/index.dart';
//import 'views/loginAndRegister/register.dart';
import 'package:flutter/services.dart';
import 'route/route_config.dart';
import 'views/splash.dart';
///单行实现
void main() {
//  SystemChrome.setPreferredOrientations([
//    DeviceOrientation.portraitUp,
//    DeviceOrientation.portraitDown,
//  ]);///强制竖屏
  runApp(Edot());
  //以下两行 设置android状态栏为透明的沉浸。写在组件渲染之后，是为了在渲染后进行set赋值，覆盖状态栏，写在渲染之前MaterialApp组件会覆盖掉这个值
  //SystemUiOverlayStyle systemUiOverlayStyle = SystemUiOverlayStyle(statusBarColor: Colors.transparent);
  //SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
}


class Edot extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "易点健身",
      theme: ThemeData(
      primaryColor: Colors.lightBlueAccent,
      ),
      routes: routes,
      home: SplashPage(),
      onGenerateRoute: onGenerateRoute,
    );
  }
}


