import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tarjimakitoblar/pages/main_page.dart';
import 'package:tarjimakitoblar/pages/secondary_pages/about_page.dart';
import 'package:tarjimakitoblar/pages/secondary_pages/downloads_page.dart';
import 'package:tarjimakitoblar/pages/secondary_pages/management_department_page.dart';
import 'package:tarjimakitoblar/pages/secondary_pages/personal_cabinet.dart';
import 'package:tarjimakitoblar/pages/secondary_pages/setting_page.dart';
import 'package:tarjimakitoblar/pages/sign_in_page.dart';
import 'package:tarjimakitoblar/pages/sign_up_page.dart';
import 'package:tarjimakitoblar/pages/splash_page.dart';
import 'package:tarjimakitoblar/utills/admin_pref.dart';
import 'package:tarjimakitoblar/utills/thememodal.dart';

Future<void> main() async {
 WidgetsFlutterBinding.ensureInitialized();
 await Firebase.initializeApp().then((value) => print('Firebase ishga tushdi'));
    runApp(MyApp());
}

class MyApp extends StatelessWidget {
  //const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ThemeModal(),
      child: Consumer(builder: (context, ThemeModal themeModal, child){
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Tarjima kitoblar',
          theme: themeModal.isdark? ThemeData.dark() : ThemeData.light(),
          home: const Splash_page(),
          routes: {
            //Primary pages
            Splash_page.id:(context)=>const Splash_page(),
            Sign_in_page.id:(context)=>const Sign_in_page(),
            Sign_up_page.id:(context)=>const Sign_up_page(),
            Main_page.id:(context)=> Main_page(isadmin:false),
            //Secondary pages
            Managment_department_page.id:(context)=>Managment_department_page(),
            Personal_cabinet.id:(context)=>const Personal_cabinet(),
            Downloads_page.id:(context)=>const Downloads_page(),
            Setting_page.id:(context)=>const Setting_page(),
            About_page.id:(context)=>const About_page(),
          },
        );
      }),
    );
  }

}
