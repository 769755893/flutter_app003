import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp003/user_data.dart';
class sign_page1 extends StatefulWidget{
  sign_page_state createState()=>sign_page_state();
}
class sign_page_state extends State<sign_page1>{
  @override
  bool passwordVisible=true;
  TextEditingController username;
  TextEditingController userpass;
  void initState(){
    passwordVisible=false;
    username = new TextEditingController();
    userpass = new TextEditingController();
    super.initState();
  }
  Widget build(BuildContext context){
    void control_clean(){
      username.clear();
      userpass.clear();
    }
    void sign_check(){
      excute_user temp=new excute_user();
      var num=temp.sign_up_success(username.text, userpass.text);
      if(num==0){
        showDialog(context: context, builder: (context)=>AlertDialog(
          title: Text('注册成功',textDirection: TextDirection.ltr,),
        ));
        control_clean();
      }
      else if(num==-1){
        showDialog(context: context, builder: (context)=>AlertDialog(
          title: Text('用户名已存在！',textDirection: TextDirection.ltr,),
        ));
        control_clean();
      }
      else if(num==-2){
        showDialog(context: context, builder: (context)=>AlertDialog(
          title: Text('用户名不能为空！',textDirection: TextDirection.ltr,),
        ));
        control_clean();
      }
      else if(num==-3){
        showDialog(context: context, builder: (context)=>AlertDialog(
          title: Text('密码不能为空！',textDirection: TextDirection.ltr,),
        ));
        control_clean();
      }
    }
    return Scaffold(
      appBar: AppBar(
        title: Text('注册页面',textDirection: TextDirection.ltr,),
      ),
      body: new Center(
        child: new ListView(
          children: <Widget>[
            TextField(
              controller: username,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: '请输入用户名：',
                prefixIcon: Icon(Icons.person),
              ),
              maxLength: 20,
            ),
            TextField(
              controller: userpass,
              keyboardType: TextInputType.number,
              obscureText: passwordVisible,
              decoration: InputDecoration(
                labelText: '请输入密码：',
                prefixIcon: Icon(Icons.lock),
                suffixIcon: IconButton(
                  icon: Icon((passwordVisible)?Icons.visibility_off:Icons.visibility),
                  onPressed: (){
                      setState(() {
                        passwordVisible=!passwordVisible;
                      });
                  },
                )
              ),
              maxLength: 20,
            ),
            RaisedButton(
              child: Text('提交'),
              onPressed: sign_check,
            ),
          ],
        ),
      ),
    );
  }
}