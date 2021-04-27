import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp003/user_data.dart';
class login_success_page extends StatelessWidget{
  user u;
  login_success_page(this.u);

  Widget build(BuildContext context){
    String username(){
      print('用户名:      '+u.user_name);
      return u.user_name;
    }
    String userpass(){
      print('用户密码：    '+u.user_pass);
      return u.user_pass;
    }
    return Scaffold(
      appBar: AppBar(
        title:Text('用户信息界面',textDirection: TextDirection.ltr,),
      ),
      body: new Center(
        child: Column(
          children: <Widget>[
            new Container(
              alignment: Alignment.center,
              margin: EdgeInsets.all(5.0),
              height: 100,
              width: 300,
              color:Colors.white,
              child: Text('用户名：'+username(),textDirection: TextDirection.ltr,),
            ),
            new Container(
              alignment: Alignment.center,
              margin: EdgeInsets.all(5.0),
              height: 100,
              width: 300,
              color: Colors.white,
              child: Text('密码：'+userpass(),textDirection: TextDirection.ltr,),
            ),
          ],
        ),
      ),
    );
  }
}