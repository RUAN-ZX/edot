import 'package:flutter/material.dart';

class RegisterWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => RegisterState();
}

class RegisterState extends State<RegisterWidget> {
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
                    /// 支持上传图片！！！
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
                  return null;
                },
                decoration: InputDecoration(

                  icon: Icon(Icons.people),
                  labelText: "你的昵称",
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
                  color: Colors.lightBlueAccent,
                  child: Text(
                    "注册",
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                  onPressed: () {
                    key.currentState.save();
                    key.currentState.validate();
                    print("Alias: $username \n pwd: $userPassword");
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
