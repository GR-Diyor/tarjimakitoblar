import 'package:flutter/cupertino.dart';
import 'package:tarjimakitoblar/utills/theme_shared_prefrences.dart';

import 'admin_pref.dart';

class ThemeModal extends ChangeNotifier{
  late bool _isdark;
  late ThemeSharedPrefrences themeSharedPrefrences;
  bool  get isdark=>_isdark;
  ThemeModal(){
    _isdark=false;
    themeSharedPrefrences=ThemeSharedPrefrences();
    getThemePrefrences();
  }
  set isdark(bool value){
    _isdark=value;
    themeSharedPrefrences.setTheme(value);
    notifyListeners();
  }
  getThemePrefrences()async{
    _isdark=await themeSharedPrefrences.getTheme();
    notifyListeners();
  }

}