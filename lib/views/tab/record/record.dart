import 'package:flutter/material.dart';
import 'package:edot/network/requestServer.dart';
import 'package:dio/dio.dart';
class record extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

      ),
      body: recordBody(),
      );
  }

}
class recordBody extends StatefulWidget {
  @override
  _recordBodyState createState() => _recordBodyState();
}

class _recordBodyState extends State<recordBody> {
  var result;
  @override
  void initState() {
    super.initState();

//    FormData formData = FormData.fromMap({
//      "mId": "40",
//    });

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
      child: Text("record",style: TextStyle(fontSize: 50),),
    );
  }
}
