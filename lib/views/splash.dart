import 'package:flutter/material.dart';
import '../main.dart';
import '../views/loginAndRegister/index.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  bool isUserLoginPage = false;
  @override
  void initState() {
    super.initState();
    //开启倒计时
    countDown();
  }

  void countDown() {
    //设置倒计时三秒后执行跳转方法
    var duration = new Duration(seconds: 2);
    new Future.delayed(duration, goToHomePage);
  }

  void goToHomePage(){
    //如果页面还未跳转过则跳转页面
    if(!isUserLoginPage){
      //跳转主页 且销毁当前页面
      Navigator.of(context).pushAndRemoveUntil(new MaterialPageRoute(builder: (context)=>new index()), (Route<dynamic> rout)=>false);
      isUserLoginPage=true;
    }
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image.asset(
        "asset/images/index/index.png",
        fit: BoxFit.cover,
      ),
    );
  }
}