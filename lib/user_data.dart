import 'dart:io';

class user{
  var _user_name;
  var _user_pass;
  var _user_sex;
  var _user_age;
  var _user_grade;
  var _user_get_pass_que;

  get user_pass => _user_pass;

  set user_pass(value) {
    _user_pass = value;
  }

  var _user_get_pass_ans;


  user(this._user_name, this._user_pass);

  get user_name => _user_name;

  set user_name(value) {
    _user_name = value;
  }

  get user_sex => _user_sex;

  get user_get_pass_ans => _user_get_pass_ans;

  set user_get_pass_ans(value) {
    _user_get_pass_ans = value;
  }

  get user_get_pass_que => _user_get_pass_que;

  set user_get_pass_que(value) {
    _user_get_pass_que = value;
  }

  get user_grade => _user_grade;

  set user_grade(value) {
    _user_grade = value;
  }

  get user_age => _user_age;

  set user_age(value) {
    _user_age = value;
  }

  set user_sex(value) {
    _user_sex = value;
  }

}
user u = new user('','');
var all_user_data=[u];
class excute_user extends user{
  excute_user():super('','');
  int login_check(user_name,user_pass){
    if(!is_exist_user(user_name)){
      return -1;//用户不存在
    }
    else{//用户存在
      for(var i=0;i<all_user_data.length;i++){
        if(all_user_data[i].user_name==user_name){
          if(all_user_data[i].user_pass==user_pass){
            return 0;//密码正确登录成功
          }
          else{
            return -2;//密码错误
          }
        }
      }
    }

  }

  bool is_exist_user(username){
    for(var i=0;i<all_user_data.length;i++){
      if(all_user_data[i].user_name==username){
        print(username);
        return true;
      }
    }
    return false;
  }
  int sign_up_success(username,password) {
    if(username.toString().isEmpty){
      return -2;
    }
    else if(is_exist_user(username)){
      return -1;
    }
    else if(password.toString().isEmpty){
      return -3;
    }
    else{
      user u=new user('','');
      u.user_name=username;
      u.user_pass=password;
      all_user_data.add(u);
      return 0;
    }
  }
}