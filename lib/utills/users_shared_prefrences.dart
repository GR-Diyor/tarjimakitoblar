import 'package:shared_preferences/shared_preferences.dart';

class UsersSharedPrefrences{
  static const USER_KEY="user";

  setUser(bool value)async{
    SharedPreferences sharedPreferences= await SharedPreferences.getInstance();
    sharedPreferences.setBool(USER_KEY, value);
  }
  getUser()async{
    SharedPreferences sharedPreferences =await SharedPreferences.getInstance();
    return sharedPreferences.getBool(USER_KEY)??false;
  }

}