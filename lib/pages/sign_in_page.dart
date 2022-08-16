import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:tarjimakitoblar/pages/sign_up_page.dart';
import 'package:tarjimakitoblar/services/auth_service.dart';
import 'package:tarjimakitoblar/utills/firebase_pref.dart';
import 'package:tarjimakitoblar/utills/toast.dart';

import 'main_page.dart';

class Sign_in_page extends StatefulWidget {
  const Sign_in_page({Key? key}) : super(key: key);
  static const String id = "Sign_in_page";

  @override
  State<Sign_in_page> createState() => _Sign_in_pageState();
}

class _Sign_in_pageState extends State<Sign_in_page> {
  var emailController;
  var passwordController;
  @override
  void initState() {
    // TODO: implement initState
    emailController=TextEditingController();
    passwordController=TextEditingController();
    super.initState();
  }
  bool isloading=false;

  dosign_in() async {
    String email= emailController.text.toString().trim();
    String password = passwordController.text.toString().trim();
    if (email.isEmpty || password.isEmpty) return;
    setState(() {
      isloading = true;
    });
    await AuthService.signInUser(context,email, password).then((value) => {
      if(value!=null){
        Navigator.pushNamed(context, Main_page.id),
      }else{
        Toasts.fireToast("Tizimga kirishda xatolik. Qayta urinib ko'ring."),
      },
    setState(() {
    isloading = false;
    }),
    });

  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SafeArea(
            child: Container(
              decoration:const BoxDecoration(
                color: Colors.tealAccent,
                image: DecorationImage(image: AssetImage("assets/images/gradients.webp"),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                children: [
                  Expanded(
                    flex: 2,
                    child:  SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      child: const Center(
                        child: Text(
                          "Tizimga kirish",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 40,
                              fontFamily: "BebasNeue-Regular"),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      decoration:const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(40),
                            topRight: Radius.circular(40)),
                      ),
                      child:SingleChildScrollView(
                        child: Stack(
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                // sign in textfield : name=> E-mail
                                Container(
                                  height: 60,
                                  width: MediaQuery
                                      .of(context)
                                      .size
                                      .width,
                                  margin: const EdgeInsets.only(
                                      left: 20, right: 20, top: 60),
                                  padding: const EdgeInsets.only(left: 20),
                                  decoration: BoxDecoration(
                                    color: Colors.white70,
                                    borderRadius: BorderRadius.circular(30),
                                    border:
                                    Border.all(
                                        width: 2, color: Colors.blueGrey),
                                  ),
                                  child: Center(
                                    child: TextField(
                                      controller: emailController,
                                      keyboardType: TextInputType.emailAddress,
                                      decoration: const InputDecoration(
                                        border: InputBorder.none,
                                        hintText: "E-pochta",
                                        hintStyle: TextStyle(
                                            color: Colors.black12,
                                            fontSize: 19),
                                      ),
                                    ),
                                  ),
                                ),
                                // sign in textfield : name=> Password
                                const SizedBox(
                                  height: 40,
                                ),
                                Container(
                                  height: 60,
                                  width: MediaQuery
                                      .of(context)
                                      .size
                                      .width,
                                  margin: const EdgeInsets.only(
                                      left: 20, right: 20),
                                  padding: const EdgeInsets.only(left: 20),
                                  decoration: BoxDecoration(
                                    color: Colors.white70,
                                    borderRadius: BorderRadius.circular(30),
                                    border:
                                    Border.all(
                                        width: 2, color: Colors.blueGrey),
                                  ),
                                  child: Center(
                                    child: TextField(
                                      controller: passwordController,
                                      keyboardType: TextInputType
                                          .visiblePassword,
                                      decoration: const InputDecoration(
                                        border: InputBorder.none,
                                        hintText: "Parol",
                                        hintStyle: TextStyle(
                                            color: Colors.black12,
                                            fontSize: 19),
                                      ),
                                    ),
                                  ),
                                ),
                                // navigate sign up page
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Align(
                                      alignment: Alignment.bottomCenter,
                                      child: Container(
                                        margin: const EdgeInsets.only(
                                            bottom: 50, top: 30),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment
                                              .center,
                                          children: [
                                            GestureDetector(
                                                onTap: () {
                                                  Navigator
                                                      .pushReplacementNamed(
                                                      context, Sign_up_page.id);
                                                },
                                                child: const Text(
                                                  "Ro'yxatdan o'tish",
                                                  style: TextStyle(
                                                      color: Colors.blue,
                                                      fontSize: 14),
                                                )),
                                          ],
                                        ),
                                      ),
                                    ),
                                    //sign in button : name => Enter
                                    Align(
                                      alignment: Alignment.bottomCenter,
                                      child: Container(
                                        margin: const EdgeInsets.only(
                                            bottom: 20),
                                        height: 50,
                                        width: 140,
                                        decoration: BoxDecoration(
                                          gradient: const LinearGradient(
                                            begin: Alignment.topLeft,
                                            colors: [
                                              Color(0xffe52efa),
                                              Color(0xda8457ee),
                                              Color(0xe66c4df5),
                                              Color(0xff72CCD4),
                                              Color(0xff71A5D7),
                                            ],
                                          ),
                                          borderRadius: BorderRadius.circular(
                                              20),
                                        ),
                                        child: TextButton(
                                          onPressed: () {
                                            dosign_in();
                                          },
                                          child: const Text(
                                            "Kirish",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 16),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),


                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          isloading
              ? const Center(
            child: CircularProgressIndicator(),
          )
              : const SizedBox.shrink(),
        ],
      ),
    );
  }
}
//
