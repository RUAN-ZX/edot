import 'package:flutter/material.dart';
import 'package:edot/network/requestServer.dart';
import 'package:dio/dio.dart';
import 'listData.dart';
import 'package:imagebutton/imagebutton.dart';
import 'excrciseFront.dart';
import 'exerciseBack.dart';

class exercise extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: Row(
              children: <Widget>[
                Expanded(
                  child: TabBar(
                    indicatorColor: Colors.lightBlueAccent,
                    labelColor: Colors.white,
                    labelStyle: TextStyle(
                      fontSize: 15,
                    ),
                    tabs: <Widget>[
                      Tab(text: '正面',),
                      Tab(text: '背面',),
                    ],
                  ),
                )
              ],
            ),
          ),
          body: TabBarView(
            children: <Widget>[
              exerciseFront(),
              exerciseBack(),
            ],
          ),
        )
    );
  }
}