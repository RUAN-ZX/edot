import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';


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
              Padding(
                padding: EdgeInsets.fromLTRB(80, 10, 80, 10),
                child:
                  ClipOval(
                    child: Image.network(
                      'http://b-ssl.duitang.com/uploads/item/201612/05/20161205085151_AGRej.jpeg',
                      fit: BoxFit.cover,
//                      width: 30,
                    ),
                  ),

              ),

//            AspectRatio(
//              aspectRatio: 2.0/1.0,
//              child: CircleAvatar(
//                backgroundImage: NetworkImage('http://b-ssl.duitang.com/uploads/item/201612/05/20161205085151_AGRej.jpeg'),
//              )
//


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
                  "登录",
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
                onPressed: () {
                  key.currentState.save();
                  key.currentState.validate();
                  print("username: $username \n password: $userPassword");
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
