import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tarjimakitoblar/model/user_model.dart';
import 'package:tarjimakitoblar/pages/main_page.dart';
import 'package:tarjimakitoblar/pages/sign_in_page.dart';
import 'package:tarjimakitoblar/services/auth_service.dart';
import 'package:tarjimakitoblar/utills/firebase_pref.dart';
import 'package:tarjimakitoblar/utills/toast.dart';

import 'main_page.dart';

class Sign_up_page extends StatefulWidget {
  const Sign_up_page({Key? key}) : super(key: key);
  static const String id = "sign_up_page";

  @override
  State<Sign_up_page> createState() => _Sign_up_pageState();
}

class _Sign_up_pageState extends State<Sign_up_page> {
  var fullname_controller = TextEditingController();
  var phone_number_controller = TextEditingController();
  var email_controller = TextEditingController();
  var password_controller = TextEditingController();
  var code_controller = TextEditingController();
  int groupvalue = 0;
  bool isnext = false;
  bool isloading = false;
  Widget buildSegment(String text) => Align(
        alignment: Alignment.topCenter,
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.5,
          height: 30,
          child: Center(
            child: Text(
              text,
              style: const TextStyle(color: Colors.white70),
            ),
          ),
        ),
      );
  dosign_up() async {
    String name = fullname_controller.text.toString().trim();
    String phone = phone_number_controller.text.toString().trim();
    String email = email_controller.text.toString().trim();
    String password = password_controller.text.toString().trim();
    String code = code_controller.text.toString().trim();
    var emailVaidation =
        RegExp(r"^[A-z0-9.A-z0-9.!$%&'*+-/=?^_`{|}~]+@(g|e|G|E)mail+\.[A-z]+")
            .hasMatch(email);
    var passwordVaidation =
        RegExp(r"^(?=.*[0-9])(?=.*[A-Z])(?=.*[.!#$@%&'*+/=?^_`{|}~-]).{8,}$")
            .hasMatch(password);
    if (name.isEmpty || email.isEmpty || password.isEmpty || phone.isEmpty)
      return;
    setState(() {
      isloading = true;
    });
    AuthService.signUpUser(context, name, email, password).then((value) => {
          if (value != null)
            {
              Navigator.pushNamed(context, Main_page.id),
            }
          else
            {
              Toasts.fireToast(
                  "Ro'yxatdan o'tishda xatolik. Qayta urinib ko'ring."),
            },
      setState(() {
        isloading = false;
      }),
        });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    fullname_controller.dispose();
    phone_number_controller.dispose();
    email_controller.dispose();
    password_controller.dispose();
    code_controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            color: Colors.tealAccent,
            image: DecorationImage(
              image: AssetImage("assets/images/gradients.webp"),
              fit: BoxFit.cover,
            ),
          ),
          child: Stack(
            children: [
              Column(
                children: [
                  //  sign up title
                  Expanded(
                    flex: 2,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      child: const Center(
                        child: Text(
                          "Ro'yxatdan o'tish",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 40,
                              fontFamily: "BebasNeue-Regular"),
                        ),
                      ),
                    ),
                  ),
                  //body
                  Expanded(
                    flex: 4,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(40),
                            topRight: Radius.circular(40)),
                      ),
                      child: Stack(
                        children: [
                          // textfield groups
                          SingleChildScrollView(
                            child: Container(
                              child:Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  // Textfield . name => fullname
                                  Container(
                                    height: 60,
                                    margin: const EdgeInsets.only(
                                        left: 20, right: 20, top: 60),
                                    padding:
                                        const EdgeInsets.only(left: 20),
                                    width: MediaQuery.of(context)
                                        .size
                                        .width,
                                    decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.circular(30),
                                      color: Colors.white70,
                                      border: Border.all(
                                          color: Colors.blueGrey,
                                          width: 2),
                                    ),
                                    child: Center(
                                      child: TextField(
                                        controller: fullname_controller,
                                        keyboardType:
                                            TextInputType.text,
                                        decoration:
                                            const InputDecoration(
                                          hintText: "Ism",
                                          hintStyle: TextStyle(
                                              color: Colors.black26,
                                              fontSize: 19),
                                          border: InputBorder.none,
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  // textfield . name => email
                                  Container(
                                    height: 60,
                                    margin: const EdgeInsets.only(
                                        left: 20, right: 20),
                                    padding:
                                        const EdgeInsets.only(left: 20),
                                    width: MediaQuery.of(context)
                                        .size
                                        .width,
                                    decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.circular(30),
                                      color: Colors.white70,
                                      border: Border.all(
                                          color: Colors.blueGrey,
                                          width: 2),
                                    ),
                                    child: Center(
                                      child: TextField(
                                        controller: email_controller,
                                        keyboardType:
                                            TextInputType.emailAddress,
                                        decoration:
                                            const InputDecoration(
                                          hintText: "E-pochta",
                                          hintStyle: TextStyle(
                                              color: Colors.black26,
                                              fontSize: 19),
                                          border: InputBorder.none,
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  // textfield . name => password
                                  Container(
                                    height: 60,
                                    margin: const EdgeInsets.only(
                                        left: 20, right: 20),
                                    padding:
                                        const EdgeInsets.only(left: 20),
                                    width: MediaQuery.of(context)
                                        .size
                                        .width,
                                    decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.circular(30),
                                      color: Colors.white70,
                                      border: Border.all(
                                          color: Colors.blueGrey,
                                          width: 2),
                                    ),
                                    child: Center(
                                      child: TextField(
                                        controller: password_controller,
                                        keyboardType: TextInputType
                                            .visiblePassword,
                                        decoration:
                                            const InputDecoration(
                                          hintText: "Parol",
                                          hintStyle: TextStyle(
                                              color: Colors.black26,
                                              fontSize: 19),
                                          border: InputBorder.none,
                                        ),
                                      ),
                                    ),
                                  ),
                                  //footer
                                  Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.end,
                                    children: [
                                      // navigate sign in page
                                      Align(
                                        alignment:
                                            Alignment.bottomCenter,
                                        child: Container(
                                          margin: const EdgeInsets.only(
                                              bottom: 30, top: 30),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment
                                                    .center,
                                            children: [
                                              const Text(
                                                "Ro'yxatdan o'tmaganmisiz?",
                                                style: TextStyle(
                                                    color:
                                                        Colors.black54,
                                                    fontSize: 14),
                                              ),
                                              const SizedBox(
                                                width: 10,
                                              ),
                                              GestureDetector(
                                                  onTap: () {
                                                    Navigator
                                                        .pushReplacementNamed(
                                                            context,
                                                            Sign_in_page
                                                                .id);
                                                  },
                                                  child: const Text(
                                                    "Tizimga kirish",
                                                    style: TextStyle(
                                                        color:
                                                            Colors.blue,
                                                        fontSize: 14),
                                                  )),
                                            ],
                                          ),
                                        ),
                                      ),
                                      //sign up button . name => next
                                      GestureDetector(
                                        onTap: (){},
                                        child: Align(
                                          alignment:
                                              Alignment.bottomCenter,
                                          child: Container(
                                            height: 50,
                                            width: 140,
                                            padding: EdgeInsets.zero,
                                            margin: const EdgeInsets.only(
                                                bottom: 20),
                                            decoration: BoxDecoration(
                                              gradient:
                                                  const LinearGradient(
                                                begin: Alignment.topLeft,
                                                colors: [
                                                  Color(0xffe52efa),
                                                  Color(0xda8457ee),
                                                  Color(0xe66c4df5),
                                                  Color(0xff72CCD4),
                                                  Color(0xff71A5D7),
                                                ],
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      20),
                                            ),
                                            child: const Center(
                                              child: Text(
                                                  "Ro'yxatdan o'tish",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 15),
                                                ),
                                            ),
                                            ),
                                          ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              isloading
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : const SizedBox.shrink(),
            ],
          ),
        ),
      ),
    );
  }
}
