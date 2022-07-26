import 'package:flutter/cupertino.dart';
import 'package:tarjimakitoblar/utills/users_shared_prefrences.dart';

class UserModal extends ChangeNotifier{
  late bool isUser;
  late UserModal userModal;
  bool  get isuser=>isUser;
  UserModal(){
    isUser=false;
    userModal = UsersSharedPrefrences() as UserModal;
    getUserPrefrences();
  }
  set isuser(bool value){
    isUser=value;
    userModal.getUserPrefrences();
    notifyListeners();
  }
  getUserPrefrences()async{
    isUser=await userModal.getUserPrefrences();
    notifyListeners();
  }
}