import 'package:shared_preferences/shared_preferences.dart';

class PrefAdmin{
  static const KEY="admin";
  setadmin(bool value)async{
    SharedPreferences sharedPreferences= await SharedPreferences.getInstance();
    sharedPreferences.setBool(KEY, value);
  }
  getadmin()async{
    SharedPreferences sharedPreferences =await SharedPreferences.getInstance();
    return sharedPreferences.getBool(KEY)??false;
  }
}