import 'package:flutter/material.dart';
import 'package:edot/network/requestServer.dart';
import 'package:dio/dio.dart';
import 'dart:convert'as convert;
class discover extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement builwd
    return Scaffold(
      appBar: AppBar(

      ),
      body: discoverBody(),
    );
  }

}
class discoverBody extends StatefulWidget {
  @override
  _discoverBodyState createState() => _discoverBodyState();
}

class _discoverBodyState extends State<discoverBody> {
  var result;
  @override
  void initState() {
    super.initState();

//    FormData formData = FormData.fromMap({
//      "mId": "40",
//    });
    /// 自己封装的 兼容各种类型的请求
    /// 注意 post方式要传 FormData格式的postdata
    /// get方式 如果有url参数 要传 Map<String,dynamic>的queryParams
//    HttpRequest.request("getMessage/",method: "post",postdata: formData).then((res){
//      setState(() {
//        this.result = res;
//      });//这里 一旦访问完成立刻幅值 立刻让其他人通过result拿到值！
//      final a = this.result.data['msUserId'];
//    });
//
//    HttpRequest.request("getMessage/",method: "get").then((res){
//      setState(() {
//        this.result = res;
//      });
//      final a = this.result.data;
//    });


  }
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("discover",style: TextStyle(fontSize: 50),),
    );
  }
}
