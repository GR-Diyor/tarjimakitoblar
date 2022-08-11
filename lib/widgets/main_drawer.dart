
import 'package:flutter/material.dart';
import 'package:tarjimakitoblar/pages/secondary_pages/about_page.dart';
import 'package:tarjimakitoblar/pages/secondary_pages/downloads_page.dart';
import 'package:tarjimakitoblar/pages/secondary_pages/management_department_page.dart';
import 'package:tarjimakitoblar/pages/secondary_pages/personal_cabinet.dart';
import 'package:tarjimakitoblar/pages/secondary_pages/setting_page.dart';
import 'package:tarjimakitoblar/pages/sign_in_page.dart';
import 'package:tarjimakitoblar/services/auth_service.dart';

Widget drawer_main(BuildContext context,[bool isAdmin=false]){
  return  SafeArea(
    child: Container(
      width: MediaQuery.of(context).size.width*0.64,
      child: ListView(
        padding:const EdgeInsets.only(left: 8.0,right: 8.0,bottom: 8.0,top: 20.0),
        children: [
          Card(
            borderOnForeground: true,
            elevation: 3,
            shadowColor: Colors.white,
            semanticContainer: true,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            color: Colors.white,
            child: Container(
              width: MediaQuery.of(context).size.width*0.6,
              padding: const EdgeInsets.only(left: 12, right: 12, top: 10,bottom: 5),
              child: Column(
                children: [
                  Image.asset(
                    "assets/images/logo.png",
                    height: 100.0,
                    width: MediaQuery.of(context).size.width*0.5,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "Tarjima kitoblar",
                    style: TextStyle(color: Colors.black87, fontSize: 15),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "Version: 1.0.1",
                    style: TextStyle(
                        color: Colors.black12,
                        fontSize: 11,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
          Column(
            children: [
              isAdmin?Container(
                margin: const EdgeInsets.only(top: 10),
                child: GestureDetector(
                  onTap: (){
                    Navigator.pushNamed(context,Managment_department_page.id);
                  },
                  child: Card(
                    borderOnForeground: true,
                    elevation: 3,
                    shadowColor: Colors.white,
                    semanticContainer: true,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    color: Colors.white,
                    child:Container(
                      padding: const EdgeInsets.only(left: 10),
                      height: 40,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: const [
                          Icon(Icons.manage_accounts_rounded,color: Colors.black54,),
                          SizedBox(width: 5),
                          Text("Boshqaruv bo'limi",style: TextStyle(color: Colors.black54,fontSize: 14,fontWeight: FontWeight.bold),),
                        ],
                      ),
                    ),
                  ),
                ),
              ):const SizedBox.shrink(),
              const SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: (){
                  Navigator.pushNamed(context, Personal_cabinet.id);
                },
                child: Card(
                  borderOnForeground: true,
                  elevation: 3,
                  shadowColor: Colors.white,
                  semanticContainer: true,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  color: Colors.white,
                  child:Container(
                    padding:const EdgeInsets.only(left: 10),
                    height: 40,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: const [
                        Icon(Icons.account_box,color: Colors.black54,),
                        SizedBox(width: 5),
                        Text("Shaxsiy kobinet",style: TextStyle(color: Colors.black54,fontSize: 14,fontWeight: FontWeight.bold),),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: (){
                  Navigator.pushNamed(context, Downloads_page.id);
                },
                child:  Card(
                  borderOnForeground: true,
                  elevation: 3,
                  shadowColor: Colors.white,
                  semanticContainer: true,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  color: Colors.white,
                  child:Container(
                    padding: const EdgeInsets.only(left: 10),
                    height: 40,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: const [
                        Icon(Icons.download,color: Colors.black54,),
                        SizedBox(width: 5),
                        Text("Yuklanganlar",style: TextStyle(color: Colors.black54,fontSize: 14,fontWeight: FontWeight.bold),),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: (){
                  Navigator.pushNamed(context, Setting_page.id);
                },
                child: Card(
                  borderOnForeground: true,
                  elevation: 3,
                  shadowColor: Colors.white,
                  semanticContainer: true,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  color: Colors.white,
                  child:Container(
                    padding: const EdgeInsets.only(left: 10),
                    height: 40,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: const [
                        Icon(Icons.app_settings_alt_outlined,color: Colors.black54,),
                        SizedBox(width: 5),
                        Text("Sozlamalar",style: TextStyle(color: Colors.black54,fontSize: 14,fontWeight: FontWeight.bold),),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, About_page.id);
                },
                child: Card(
                  borderOnForeground: true,
                  elevation: 3,
                  shadowColor: Colors.white,
                  semanticContainer: true,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  color: Colors.white,
                  child:Container(
                    padding: const EdgeInsets.only(left: 10),
                    height: 40,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: const [
                        Icon(Icons.perm_device_info_rounded,color: Colors.black54,),
                        SizedBox(width: 5),
                        Text("Dastur haqida",style: TextStyle(color: Colors.black54,fontSize: 14,fontWeight: FontWeight.bold),),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: () {
                  AuthService.signOutUser(context);
                },
                child: Card(
                  borderOnForeground: true,
                  elevation: 3,
                  shadowColor: Colors.white,
                  semanticContainer: true,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  color: Colors.white,
                  child:Container(
                    padding: const EdgeInsets.only(left: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: const [
                        Icon(Icons.exit_to_app_outlined,color: Colors.black54,),
                        SizedBox(width: 5),
                        Text("Tizimdan chiqish",style: TextStyle(color: Colors.black54,fontSize: 14,fontWeight: FontWeight.bold),),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}