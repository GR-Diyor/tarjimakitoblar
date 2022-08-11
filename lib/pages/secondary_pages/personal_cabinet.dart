import 'package:clippy_flutter/arc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:tarjimakitoblar/pages/main_page.dart';
import 'package:tarjimakitoblar/utills/admin_pref.dart';
import 'package:tarjimakitoblar/utills/thememodal.dart';
import 'package:tarjimakitoblar/utills/toast.dart';

class Personal_cabinet extends StatefulWidget {
  const Personal_cabinet({Key? key}) : super(key: key);
  static const String id="Personal_cabinet";

  @override
  State<Personal_cabinet> createState() => _Personal_cabinetState();
}

class _Personal_cabinetState extends State<Personal_cabinet> {
  bool changed=false;
  int value=1;
  int correct=0;
  bool info=false;
  int count=0;
  bool check_count=false;
  bool checking_email=false;
  TextEditingController email_controller=TextEditingController();
  TextEditingController password_controller=TextEditingController();
  TextEditingController _nameController=TextEditingController();
  TextEditingController _emailController=TextEditingController();
  String? name;
  Future check_isAdmin()async{
    Navigator.of(context).push(
      MaterialPageRoute(builder: (BuildContext context)
    {
      return Main_page(isadmin: true);
    }
    ),);
  }
  Future check_isnotAdmin()async{
    Navigator.of(context).push(
      MaterialPageRoute(builder: (BuildContext context){
        return Main_page(isadmin: false);
      }),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Shaxsiy kobinet"),
        elevation: 0,
        backgroundColor: Colors.blueGrey.shade700,
        actions: [
          IconButton(
            onPressed: (){
              setState(() {
                if(!info) changed=true;
              });
            },
            icon: const Icon(Icons.repeat),
          ),
        ],
      ),
      body:   Consumer(
          builder: (context, ThemeModal themeModal, child) {
            return SafeArea(
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: Stack(
                  children: [
                    Column(
                      children: [
                        const SizedBox(height: 20,),
                        Container(
                          padding: const EdgeInsets.only(left: 20,right: 20,top: 10,bottom: 10),
                          decoration: BoxDecoration(
                            color: Colors.grey.shade50,
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    height: 60,
                                    width: 60,
                                    padding: const EdgeInsets.all(3),
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        border: Border.all(width: 2.0,color:Colors.black,style: BorderStyle.solid),
                                        shape: BoxShape.circle),
                                    child:const Center(
                                      child: CircleAvatar(
                                        backgroundImage: AssetImage("assets/images/avatar.jpg"),
                                        radius: 57.0,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 15,),
                                  Container(
                                    child: Center(
                                      child: Text(name==null?"Diyorbek":name!,style: TextStyle(color: Colors.black87,fontSize: 15),),
                                    ),
                                  ),
                                ],
                              ),
                              GestureDetector(
                                onTap: (){
                                  //Toasts.fireToast("Malumotlarni tahrirlash uchun huquq yetarli emas.");
                                  setState(() {
                                    if(!changed) {
                                      info = true;
                                      _emailController.text = name == null
                                          ? "Diyorbek@gmail.com"
                                          : "email";
                                      _nameController.text =
                                      name == null ? "Diyorbek" : name!;
                                    }
                                  });
                                },
                                child: Container(
                                  height: 30,
                                  width: 30,
                                  padding: const EdgeInsets.all(2),
                                  decoration: const BoxDecoration(
                                      color: Colors.black12,
                                      shape: BoxShape.circle),
                                  child:const Center(
                                    child: CircleAvatar(
                                      backgroundColor: Colors.white,
                                      backgroundImage: AssetImage("assets/images/pen1.png"),
                                      radius: 28.0,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 10,),
                        Container(
                          padding: const EdgeInsets.all(25),
                          decoration: BoxDecoration(
                            color: Colors.grey.shade50,
                            borderRadius: BorderRadius.circular(50),
                          ),

                          child: Card(
                            color: Colors.white70,
                            shadowColor: Colors.black,
                            elevation: 3,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Container(
                              padding: const EdgeInsets.all(10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  //balans title
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text("Balans",style: TextStyle(fontSize: 18,color: Colors.black45,fontWeight: FontWeight.bold),),
                                      Row(
                                        children: const [
                                          Text("Hisob raqam:",style:    TextStyle(color: Colors.grey,fontSize: 13),),
                                          Text("A204785",style: TextStyle(color: Colors.grey,fontSize: 18),),
                                        ],
                                      ),

                                    ],
                                  ),
                                  const SizedBox(height: 15,),
                                  const Text("0 Som",style: TextStyle(color: Colors.blue,fontSize: 21),),
                                  const SizedBox(height: 15,),
                                  Container(
                                    alignment: Alignment.center,
                                    child: CupertinoButton(
                                      color: Colors.blueAccent.shade700,
                                      onPressed: () {
                                      },
                                      child:const Text("Hisob to'ldirish",style: TextStyle(color: Colors.white,fontSize: 18),),
                                    ),
                                  ),

                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    changed?
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(35),
                          child: Card(
                            shadowColor: Colors.black45,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                            elevation: 3,
                            child: Container(
                              margin: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: Colors.white70,
                                borderRadius: BorderRadius.circular(10),
                                shape: BoxShape.rectangle,
                              ),
                              child: Column(
                                children: [
                                  Align(
                                    alignment: Alignment.topCenter,
                                    child: Text("Rolni o'zgartirish",style: TextStyle(color: themeModal.isdark?Colors.white70:Colors.black45,fontSize: 19),),
                                  ),
                                  RadioListTile(
                                    value: 1,
                                    groupValue: value,
                                    selected: value==1,
                                    onChanged: (res){
                                      setState(() {
                                        count=0;
                                        value=res! as int;
                                        correct=1;
                                        if(checking_email){
                                          checking_email=false;
                                          email_controller.clear();
                                          password_controller.clear();
                                        }
                                      });
                                    },
                                    title: const Text("Foydaluvchi"),
                                  ),
                                  RadioListTile(
                                    value: 2,
                                    groupValue: value,
                                    selected: value==2,
                                    onChanged: (res){
                                      setState(() {
                                        count++;
                                        value=res! as int;
                                        correct=2;
                                        checking_email=true;
                                      });
                                    },
                                    title: const Text("Boshqaruvchi"),
                                  ),
                                  checking_email?Container(
                                    padding: const EdgeInsets.only(left: 10,right: 10),
                                    child: Column(
                                      children: [
                                        TextField(
                                          controller: email_controller,
                                          decoration: const InputDecoration(
                                            hintText: "Email",
                                          ),
                                        ),
                                        TextField(
                                          controller: password_controller,
                                          decoration: const InputDecoration(
                                              hintText: "Password"
                                          ),
                                        ),
                                      ],
                                    ),
                                  ):const SizedBox.shrink(),
                                  const SizedBox(height: 15,),
                                  Row(
                                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        width: MediaQuery.of(context).size.width*0.3,
                                        height: 50,
                                        padding: EdgeInsets.zero,
                                        child: TextButton(
                                          onPressed: (){
                                            setState(() {
                                                if(correct==2) {
                                                  check_isAdmin();
                                                }else{
                                                  check_isnotAdmin();
                                                }
                                                changed=false;
                                              });
                                          },
                                          child: const Text("Tasdiqlash",style: TextStyle(color:Colors.blue),),
                                          //color: Colors.blue,
                                        ),
                                      ),
                                      Container(
                                        width: MediaQuery.of(context).size.width*0.3,
                                        height: 50,
                                        padding: EdgeInsets.zero,
                                        child: TextButton(
                                          onPressed: (){
                                            setState(() {
                                              changed=false;
                                            });
                                          },
                                          child: const Text("Chiqish",style: TextStyle(color:Colors.red),),
                                          // color: Colors.red,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ):const SizedBox.shrink(),
                    info?Center(
                      child: Container(
                        height: 200,
                        width: MediaQuery.of(context).size.width*0.6,
                        decoration: BoxDecoration(
                          color: Colors.cyanAccent,
                          borderRadius: BorderRadius.circular(15),

                        ),
                        child: Column(
                          children: [
                            Container(
                              height: 50,
                              width: MediaQuery.of(context).size.width*0.5,
                              margin: const EdgeInsets.only(top: 10),
                              padding: const EdgeInsets.only(left: 10.0),
                              decoration: BoxDecoration(
                                color: Colors.white70,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child:
                                  TextField(
                                    controller: _nameController,
                                    decoration: const InputDecoration(
                                      border: InputBorder.none,
                                      focusedBorder: InputBorder.none,
                                      disabledBorder: InputBorder.none,
                                    ),
                                  ),
                            ),
                            Container(
                              height: 50,
                              width: MediaQuery.of(context).size.width*0.5,
                              margin: const EdgeInsets.only(top: 10),
                              padding: const EdgeInsets.only(left: 10.0),
                              decoration: BoxDecoration(
                                color: Colors.white70,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child:
                                  TextField(
                                    controller: _emailController,
                                    decoration: const InputDecoration(
                                      border: InputBorder.none,
                                      focusedBorder: InputBorder.none,
                                      disabledBorder: InputBorder.none,
                                    ),
                                  ),
                            ),
                            SizedBox(height: 30,),
                            FlatButton(
                              color: Colors.blue,
                              onPressed: (){
                                setState(() {
                                  info=false;
                                  name=_nameController.text.toString().trim();
                                });
                              },
                              child: const Text("Tasdiqlash",style: TextStyle(color: Colors.white),),
                            ),
                          ],
                        ),
                      ),
                    ):const SizedBox.shrink(),

                  ],
                ),
              ),
            );
          }
      ),
    );
  }
}
