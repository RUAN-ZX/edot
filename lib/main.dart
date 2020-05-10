import 'package:flutter/material.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';

import 'views/loginAndRegister/index.dart';
//import 'views/loginAndRegister/register.dart';

import 'route/route_config.dart';
///单行实现
main() => runApp(Edot());
class Edot extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "易点健身",
      theme: ThemeData(
      primaryColor: Colors.lightBlueAccent,
      ),
      routes: routes,
      home: index(),
      onGenerateRoute: onGenerateRoute,
    );
  }
}


