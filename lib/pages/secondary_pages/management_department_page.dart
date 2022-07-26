import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:tarjimakitoblar/function/reading.dart';
import 'package:tarjimakitoblar/pages/main_page.dart';
import 'package:tarjimakitoblar/utills/thememodal.dart';
import 'package:tarjimakitoblar/utills/toast.dart';
import 'package:tarjimakitoblar/widgets/main_page_widget.dart';


class Managment_department_page extends StatefulWidget {
  // Managment_department_page({});
  static const String id="management_department_page";

  @override
  State<Managment_department_page> createState() => _Managment_department_pageState();
}
class _Managment_department_pageState extends State<Managment_department_page> {
  TextEditingController _titlecontroller=TextEditingController();
  static const menuItems = <String>[
    "Mashhurlar",
    "Ommabop",
    "Ommaviy o'qilayotgan",
    "Tavsiya etilgan",
  ];
  String? _btn2SelectedVal;
  File? _image;
  bool postActive=false;
  final List<DropdownMenuItem<String>>_dropDownMenuItems = menuItems.map(
        (String value) => DropdownMenuItem<String>(value: value, child: Text(value),),
  ).toList();
  // camera
  // _imgFromCamera() async {
  //   File image = (await ImagePicker().pickImage(
  //       source: ImageSource.camera, imageQuality: 50)) as File;
  //
  //   setState(() {
  //     _image = image;
  //   });
  // }

// gallery
  _imgFromGallery() async {
    final image = await ImagePicker().pickImage(
        source: ImageSource.gallery, imageQuality: 50);

    setState(() {
      _image = File(image!.path);
    });
  }
  // void _showPicker(context) {
  //   showModalBottomSheet(
  //       backgroundColor: Colors.white.withOpacity(0.8),
  //       context: context,
  //       builder: (BuildContext bc) {
  //         return SafeArea(
  //           child: Wrap(
  //             children: <Widget>[
  //               ListTile(
  //                   leading: const Icon(Icons.photo_library),
  //                   title: const Text('Pick Photo'),
  //                   onTap: () {
  //                     _imgFromGallery();
  //                     Navigator.of(context).pop();
  //                   }),
  //               Container(
  //                 width: double.infinity,
  //                 height: 1,
  //                 color: Colors.blue,
  //               ),
  //               ListTile(
  //                 leading: const Icon(Icons.photo_camera),
  //                 title: const Text('Take Photo'),
  //                 onTap: () {
  //                   _imgFromCamera();
  //                   Navigator.of(context).pop();
  //                 },
  //               ),
  //             ],
  //           ),
  //         );
  //       });
  // }
  Future check_isAdmin()async{
    Navigator.of(context).push(
      MaterialPageRoute(builder: (BuildContext context)
      {
        return Builder(
            builder: (context) {
              return Main_page(isadmin: true);
            });
      }
      ),);
  }
  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ThemeModal themeModal, child) {
      return WillPopScope(
          onWillPop: () async{
            check_isAdmin();
             return true;
          },

        child: Scaffold(
          body: SafeArea(
            child: Stack(
              children: [
                SingleChildScrollView(
                  child: Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.all(20),
                    child: Card(
                      elevation: 3,
                      shadowColor: Colors.black.withOpacity(0.7),
                      borderOnForeground: true,
                      semanticContainer: true,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            padding: const EdgeInsets.only(left: 12,right: 4,top: 4,bottom: 4),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: themeModal.isdark?Colors.white38:Colors.black12
                            ),
                            child:DropdownButton(
                              value: _btn2SelectedVal,
                              hint: const Text("Bo'limni tanlash",),
                              onChanged: (String? newValue){
                                if(newValue!=null){
                                  setState(() {
                                    _btn2SelectedVal=newValue;
                                  });
                                };},
                              items:_dropDownMenuItems,
                            ),
                          ),
                          const SizedBox(height: 50,),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            height: 250,
                            child: Stack(
                              children: [
                                Center(child: _image==null?Image.asset("assets/images/book.png",fit: BoxFit.fitHeight,):Stack(
                                  children: [
                                    Image.file(_image!),
                                    IconButton(
                                      onPressed: (){
                                        setState(() {
                                          _image=null;
                                        });
                                      },
                                      icon: const Icon(Icons.cancel,color: Colors.red,),
                                    ),
                                  ],
                                ),),
                                Center(
                                  child: _image==null?GestureDetector(
                                    onTap: (){
                                      _imgFromGallery();
                                    },
                                    child: Container(
                                      height: 40,
                                      width: 40,
                                      decoration: const BoxDecoration(
                                        color: Colors.blue,
                                        shape: BoxShape.circle,
                                      ),
                                      child:const Center(child: Icon(Icons.add,size: 35,color: Colors.white,)),
                                    ),
                                  ):const SizedBox.shrink(),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 40,),
                          Container(
                            padding: const EdgeInsets.only(left: 25,right: 25),
                            child:TextField(
                              controller: _titlecontroller,
                              decoration: const InputDecoration(
                                  hintText: "Sarlavha"
                              ),
                              maxLength:25,
                            ),
                          ),
                          const SizedBox(height: 40,),
                          Container(
                            margin: const EdgeInsets.only(left: 25,right: 25),
                            height: 50,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              color: themeModal.isdark?Colors.blue.withOpacity(0.125):Colors.blue,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: TextButton(
                              onPressed: (){
                                setState(() {
                                  if(_image!=null&&_titlecontroller.text.isNotEmpty){
                                    postActive=true;
                                    Timer(const Duration(seconds: 2),(){
                                      Toasts.fireToast("Muaffaqiyatli yuklandi.");
                                      kMixedColors.add(const Color(0xfffb8457),);
                                      categories.add(CategoryFile(image: _image, name: _titlecontroller.text.trim()));
                                      images.add(_image);
                                      setState(() {
                                        _image=null;
                                        _titlecontroller.text="";
                                        postActive=false;
                                      });
                                    });
                                  }else{
                                    Toasts.fireToast("Kitob yoki sarlavha joylanmagan!!");
                                  }

                                });
                              },
                              child:Text("Tasdiqlash",style: TextStyle(fontSize: 23,color: themeModal.isdark?Colors.white70:Colors.white),),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                postActive?const Center(child: CircularProgressIndicator()):const SizedBox.shrink(),
              ],
            ),
          ),
        ),
      );
    }
    );
  }
}
