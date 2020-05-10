import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'login.dart';
import 'register.dart';

class index extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
          length: 2,
          child:  Scaffold(
            appBar: AppBar(
              ///菜单栏 设置等等都可以实现
//            leading: IconButton(
//              icon: Icon(Icons.menu),
//              onPressed: (){
//                print('menu activated');
//              },
//            ),
              title: Row(
//                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child:TabBar(
                      indicatorColor: Colors.lightBlueAccent,
                      labelColor: Colors.white,
                      labelStyle: TextStyle(
                        fontSize: 15,
                      ),
                      tabs: <Widget>[
                        Tab(text: '登录',),
                        Tab(text: '注册',),

                      ],
                    ),
                  )
                ],
              ),
            ),
            body: TabBarView(
              children: <Widget>[
                LoginWidget(),
                RegisterWidget(),
              ],
            ),
          )
    );
  }
}
