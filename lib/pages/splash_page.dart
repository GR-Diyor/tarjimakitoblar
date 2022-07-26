
import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tarjimakitoblar/pages/sign_in_page.dart';
import 'package:tarjimakitoblar/utills/admin_pref.dart';
import 'package:tarjimakitoblar/widgets/splash_page_widget.dart';
import 'main_page.dart';

class Splash_page extends StatefulWidget {
  const Splash_page({Key? key}) : super(key: key);
  static const String id = 'Splash_page';
  @override
  State<Splash_page> createState() => _Splash_pageState();
}
class _Splash_pageState extends State<Splash_page> {

  _timer(){
    Timer(const Duration(seconds: 3),(){
      Navigator.pushReplacementNamed(context, Sign_in_page.id);
    });
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _timer();
  }
  Checking()async{
    return StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context,snapshot){
          if(snapshot.hasData){
            return const Sign_in_page();
          }else{
            return Main_page(isadmin: false);
          }
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: splash_page(),
    );
  }
}
