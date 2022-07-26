import 'package:flutter/material.dart';

Widget splash_page(){
  return SafeArea(
    child: Stack(
      children: [
        const Align(
          alignment: Alignment.center,
          child: Image(
            image: AssetImage(
              "assets/images/logo2.png",
            ),
            fit: BoxFit.cover,
          ),
        ),
        const Center(
          child: CircularProgressIndicator(color: Colors.greenAccent,),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            padding: const EdgeInsets.only(bottom: 10),
            child:const Text(
              "Powered by FaM",
              style: TextStyle(
                  color: Colors.black26,
                  fontSize: 14,
                  fontWeight: FontWeight.bold),
            ),
          ),
        )
      ],
    ),
  );
}