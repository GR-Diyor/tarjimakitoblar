import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tarjimakitoblar/utills/thememodal.dart';

Widget SearchWidget(BuildContext context){
  return  Consumer(builder: (context, ThemeModal themeModal, child) {
    return SafeArea(
      child: Stack(
        children: [
          Container(
            child: Column(
              children: [
                Container(
                  height: 70,
                  width: MediaQuery.of(context).size.width,
                  child: ListView(
                    reverse: false,
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.all(15),
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10),
                        margin: const EdgeInsets.only(right: 8.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(width: 1,color: themeModal.isdark?Colors.white70:Colors.black45),
                        ),
                        child: const Center(
                          child: Text("Biznes"),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(10),
                        margin: const EdgeInsets.only(right: 8.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(width: 1,color: themeModal.isdark?Colors.white70:Colors.black45),
                        ),
                        child: const Center(
                          child: Text("Detektiv"),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(10),
                        margin: const EdgeInsets.only(right: 8.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(width: 1,color: themeModal.isdark?Colors.white70:Colors.black45),
                        ),
                        child: const Center(
                          child: Text("Fantastik"),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(10),
                        margin: const EdgeInsets.only(right: 8.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(width: 1,color: themeModal.isdark?Colors.white70:Colors.black45),
                        ),
                        child: const Center(
                          child: Text("Diniy"),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(10),
                        margin: const EdgeInsets.only(right: 8.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(width: 1,color: themeModal.isdark?Colors.white70:Colors.black45),
                        ),
                        child: const Center(
                          child: Text("Ilm fan"),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(10),
                        margin: const EdgeInsets.only(right: 8.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(width: 1,color: themeModal.isdark?Colors.white70:Colors.black45),
                        ),
                        child: const Center(
                          child: Text("Biografiya"),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          //  nothing logo
          Container(
            alignment: Alignment.center,
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Image.asset("assets/images/nothing_search.gif",fit: BoxFit.contain,),
          ),
        ],
      ),
    );
  }
  );
}