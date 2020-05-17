import 'package:edot/views/tab/tabR.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'validation.dart';

class LoginWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => LoginWidgetState();
}

class LoginWidgetState extends State<LoginWidget> {
  GlobalKey<FormState> key = GlobalKey();
  String username;
  String userPassword;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Form(
        key: key,
        child: Center(
          child: ListView(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.fromLTRB(80, 10, 80, 10),
                child: ClipOval(
                  child: Image.asset(
                    'asset/images/user.jpeg',
                    fit: BoxFit.cover,
//                      width: 30,
                  ),
                ),
              ),
              TextFormField(
                onSaved: (value) => this.username = value,
                validator: (value) {
                  if (value.isEmpty) {
                    return "不能为空";
                  }
//              else if(value)
                  return null;
                },
                decoration: InputDecoration(
                  icon: Icon(Icons.people),
                  labelText: "你的名字",
//                focusColor: Colors.blue,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                onSaved: (value) => this.userPassword = value,
//              validator: (value) {
//                if (value.isEmpty) {
//                  return "不能为空";
//                }
//                else if(value)
//                return null;
//              },
                obscureText: true,
                decoration: InputDecoration(
                  icon: Icon(Icons.lock),
                  labelText: "你的密码",
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: double.infinity,
                height: 44,
                child: RaisedButton(
//                color： Colors.lightBlueAccent,
                  color: Colors.lightBlueAccent,
                  child: Text(
                    "登录",
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                  onPressed: () {
                    key.currentState.save();
                    key.currentState.validate();

                    if (validation(username, userPassword)) {
                      print("username: $username \n password: $userPassword");

                      /// 用户按返回的时候 就还会回到登录注册页面 非常不好
//                    Navigator.pushNamed(context, '/tab');
                      Navigator.of(context).pushAndRemoveUntil(
                          new MaterialPageRoute(
                              builder: (context) => new tab()),
                          (route) => route == null);
                    }
//                  Navigator.push(context, route);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
