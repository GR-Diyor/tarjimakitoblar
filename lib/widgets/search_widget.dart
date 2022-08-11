import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tarjimakitoblar/utills/thememodal.dart';
bool isNothing=false;
Widget searchList(String title,String image,String subtitle,Function ontap){
  return Container(
    color: Colors.black12,
    margin: const EdgeInsets.only(bottom: 1),
    child: ListTile(
      focusColor: Colors.blue,
      hoverColor: Colors.green,
      onTap: (){},
      title: const Text("The healing",style: TextStyle(color: Colors.blueGrey,fontSize: 15,fontWeight: FontWeight.bold,),),
      leading: Image.asset("assets/images/thehealing.png",fit: BoxFit.cover,),
      subtitle: const Text("Lindsey Key",style: TextStyle(fontSize: 11,fontFamily: "BebasNeue-Regular",fontWeight: FontWeight.w400),),
    ),
  );
}

Widget SearchWidget(BuildContext context){
  return  Consumer(builder: (context, ThemeModal themeModal, child) {
    return SafeArea(
      child: Stack(
        children: [
          ListView(
            children: [
              searchList("The healing", "assets/images/thehealing.png", "Lindsey Key", (){}),
              searchList("The healing", "assets/images/thehealing.png", "Lindsey Key", (){}),
              searchList("The healing", "assets/images/thehealing.png", "Lindsey Key", (){}),
              searchList("The healing", "assets/images/thehealing.png", "Lindsey Key", (){}),
              searchList("The healing", "assets/images/thehealing.png", "Lindsey Key", (){}),
              searchList("The healing", "assets/images/thehealing.png", "Lindsey Key", (){}),
              searchList("The healing", "assets/images/thehealing.png", "Lindsey Key", (){}),
              searchList("The healing", "assets/images/thehealing.png", "Lindsey Key", (){}),
            ],
          ),
          //  nothing logo
          isNothing?Container(
            alignment: Alignment.center,
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Image.asset("assets/images/nothing_search.gif",fit: BoxFit.contain,),
          ):const SizedBox.shrink(),
        ],
      ),
    );
  }
  );
}