
import 'package:flutter/material.dart';

//tab
import 'package:edot/views/tab/discover/discover.dart';
import 'package:edot/views/tab/exercise/exercise.dart';
import 'package:edot/views/tab/me/me.dart';
import 'package:edot/views/tab/record/record.dart';
import 'package:edot/views/tab/tabR.dart';

// loginAndRegister
import 'package:edot/views/loginAndRegister/index.dart';
//import 'package:edot/views/loginAndRegister/login.dart';
//import 'package:edot/views/loginAndRegister/register.dart';
import 'package:edot/views/loginAndRegister/test.dart';

//配置路由
final routes={
  //loginAndRegister
//  '/':(context)=>index(),
//  '/login':(context)=>login(),
//  '/register':(context)=>register(),

  //tab
  '/tab':(context)=>tab(),
  '/discover':(context)=>discover(),
  '/exercise':(context)=>exercise(),
  '/me':(context)=>me(),
  '/record':(context)=>record(),
  '/test':(context)=>qwer(),
};

//固定写法
var onGenerateRoute=(RouteSettings settings) {
  // 统一处理
  final String name = settings.name;
  final Function pageContentBuilder = routes[name];
  if (pageContentBuilder != null) {
    if (settings.arguments != null) {
      final Route route = MaterialPageRoute(
          builder: (context) =>
              pageContentBuilder(context, arguments: settings.arguments));
      return route;
    }else{
      final Route route = MaterialPageRoute(
          builder: (context) =>
              pageContentBuilder(context));
      return route;
    }
  }
};