import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "易点健身",
        theme: ThemeData(
          primaryColor: Colors.lightBlueAccent,
        ),
        home:
        Scaffold(
//          appBar: AppBar(
//            title: Text("login"),
//          ),
          body: LoginWidget(),
        ));
  }
}

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
      padding:const EdgeInsets.all(20),
      child:Form(
      key: key,
      child: Center(
        child: ListView(
          children: <Widget>[
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
                labelText: "UserAlias",
//                focusColor: Colors.blue,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              onSaved: (value) => this.userPassword = value,
              validator: (value) {
                if (value.isEmpty) {
                  return "不能为空";
                }
//              else if(value)
                return null;
              },
              obscureText: true,
              decoration: InputDecoration(
                icon: Icon(Icons.lock),
                labelText: "UserPassword",
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
                  "register",
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
                onPressed: () {
                  key.currentState.save();
                  key.currentState.validate();
                  print("username: $username \n password: $userPassword");
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
