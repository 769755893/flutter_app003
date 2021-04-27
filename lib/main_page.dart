import 'package:flutter/material.dart';
import 'package:flutterapp003/login_success.dart';
import 'package:flutterapp003/sign_up.dart';
import 'package:flutterapp003/user_data.dart';

void main()=>runApp(AApp());


class AApp extends StatelessWidget{
  Widget build(BuildContext context){
    return MaterialApp(
      title: '实验一',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(),
    );
  }
}
class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  @override
  bool passwordVisible=true;
  TextEditingController _userNameController;
  TextEditingController _userPassController;
  user firstconvert;

  void initState(){
    _userNameController = new TextEditingController();
    _userPassController =new TextEditingController();
    passwordVisible=false;
    firstconvert=new user('','');
    super.initState();
  }

  Widget build(BuildContext context) {
    void Control_clear(){
      _userNameController.clear();
      _userPassController.clear();
    }

    void sign_up(){
      Navigator.push(context, MaterialPageRoute(builder: (context)=>sign_page1()));
    }

    void _Login(){
      var user_name=_userNameController.text;
      var user_pass=_userPassController.text;
      if(user_name.toString().isEmpty||user_pass.toString().isEmpty){
        showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Text('用户名|密码长度不能为空！'),
            ));
        Control_clear();
      }
      else{
        excute_user temp=new excute_user();
        var num=temp.login_check(user_name, user_pass);
        if(num==0){//登录成功
          firstconvert.user_name=user_name;
          firstconvert.user_pass=user_pass;
          Navigator.push(context, new MaterialPageRoute(builder: (context)=>
          new login_success_page(firstconvert)//传递用户信息参数
          ));
        }
        else if(num==-1){
          showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: Text('用户不存在，请注册！'),
              ));
        }
        else if(num==-2){
          showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: Text('密码错误！'),
              ));
        }
      }
    }

    void forget_pass(){

    }
    return Scaffold(
      appBar: AppBar(
        title: Text('实验一',textDirection: TextDirection.ltr,),
      ),
      body: new Center(
        child: new ListView(
          children: <Widget>[
            new Container(
              margin: EdgeInsets.all(1.0),
              alignment: Alignment.topCenter,
              color: Colors.white,
              height: 650,
              width: 400,
              child: new ListView(
                children: <Widget>[
                  new Container(
                    margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                    color: Colors.white,
                    alignment: Alignment.center,
                    height: 200,
                    width: 20,
                    child: new Column(
                          children: <Widget>[
                            new Container(
                              child: Image.asset('images/0.jpg'),
                              margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                              height: 100,
                              width: 500,
                            ),
                            new Container(
                              margin: EdgeInsets.fromLTRB(0, 40, 0, 0),
                              alignment: Alignment.center,
                              child:
                              Text('用户名登录',
                                textDirection: TextDirection.ltr,
                                style: new TextStyle(fontWeight: FontWeight.w700,fontSize: 30),
                              ),
                            )
                          ],
                        ),
                    ),
                  new Container(
                    margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                    color: Colors.white,
                    alignment: Alignment.center,
                    height: 200,
                    width: 20,
                    child: Column(
                      children: <Widget>[
                        new Container(
                          margin: EdgeInsets.fromLTRB(1, 1, 1, 1),
                          height: 70,
                          width: 310,
                          color: Colors.white,
                          child: TextField(
                            controller: _userNameController,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              prefixIcon: Icon(Icons.person),
                              labelText: '请输入注册的账号',
                            ),
                            maxLength: 20,
                          ),
                        ),
                        new Container(
                          margin: EdgeInsets.fromLTRB(1, 1, 1, 1),
                          height: 70,
                          width: 310,
                          color: Colors.white,
                          child: TextField(
                            controller: _userPassController,
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
                        ),
                            new Container(
                                margin: EdgeInsets.fromLTRB(1, 1, 1, 1),
                                height: 50,
                                width: 310,
                                color: Colors.white,
                                    child: RaisedButton(
                                       child: Text('登录'),
                                       onPressed: _Login,
                                        ),
                              )
                      ],
                    ),
                  ),
                  new Container(
                    margin: EdgeInsets.fromLTRB(0, 5, 0, 0),
                    color: Colors.white,
                    height: 100,
                    width: 20,
                    child: Row(
                          children: <Widget>[
                            new Container(
                              margin: EdgeInsets.fromLTRB(0, 1, 50, 1),
                              color: Colors.white,
                              height: 20,
                              width: 100,
                              child: RaisedButton(
                                child: Text('忘记密码',textDirection: TextDirection.ltr,),
                                onPressed: forget_pass,
                              ),
                            ),
                            new Container(
                              margin: EdgeInsets.fromLTRB(107, 0, 1, 1),
                              color: Colors.white,
                              height: 20,
                              width: 100,
                                child: RaisedButton(
                                  child: Text('快速注册',textDirection: TextDirection.ltr,),
                                  onPressed: sign_up,
                                ),
                            )
                          ],
                        ),
                    ),
                ],
              )
            )
          ],
        )
      )
    );
  }
}
