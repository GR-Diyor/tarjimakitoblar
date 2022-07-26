import 'package:shared_preferences/shared_preferences.dart';

class PrefAdmin{
  static const KEY="admin";
  setValue(bool value)async{
    SharedPreferences sharedPreferences= await SharedPreferences.getInstance();
    sharedPreferences.setBool(KEY, value);
  }
  getValue()async{
    SharedPreferences sharedPreferences =await SharedPreferences.getInstance();
    return sharedPreferences.getBool(KEY)??false;
  }
}