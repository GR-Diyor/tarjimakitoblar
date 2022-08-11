import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tarjimakitoblar/widgets/main_drawer.dart';
import 'package:tarjimakitoblar/widgets/main_loading.dart';
import 'package:tarjimakitoblar/widgets/main_page_widget.dart';
import 'package:tarjimakitoblar/widgets/search_widget.dart';

class Main_page extends StatefulWidget {
  final bool isadmin;
  Main_page({required this.isadmin,});
  static const String id="Main_page";

  @override
  State<Main_page> createState() => _Main_pageState();
}

class _Main_pageState extends State<Main_page> {
  bool isloading = false;
  bool issearch = false;
  bool searchactive = false;
  var searchcontroller = TextEditingController();
  Icon icon = const Icon(
    Icons.search_rounded,
    color: Colors.white,
  );

  int index = 0;
  loading(){
      Timer(const Duration(seconds: 2), (){
          isloading = true;
      });
  }
  Future cancel()async{
    await showDialog(
      context: context,
      builder:(BuildContext context){
        return  AlertDialog(
          title:const Text("Dasturdan chiqmoqchimisiz?"),
          actions: [
            TextButton(
              onPressed:(){
                SystemNavigator.pop();
              },
              child: const Text("Ha"),
            ),
            TextButton(
              onPressed:(){
                Navigator.pop(context);
              },
              child: const Text("Yo`q"),
            ),
          ],
        );
      },
    );
  }
  double xOffset = 0.0;
  double yOffset = 0.0;
  double scaleFactor = 1.0;
  bool isdraweropen = false;
  @override
  void initState() {
    loading();
    isloading=true;
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        WillPopScope(
          onWillPop: () async{
            setState(() {
              if(isdraweropen){
                xOffset = 0.0;
                yOffset = 0.0;
                scaleFactor = 1.0;
                isdraweropen = false;
              }else{
                if(issearch&&searchactive){
                  issearch=false;
                  searchactive=false;
                  icon = const Icon(
                    Icons.search_rounded,
                    color: Colors.white,
                  );
                }else{
                  cancel();
                }
              }
            });
            return isdraweropen;
          },
          child: Scaffold(
            body: drawer_main(context,widget.isadmin),
          ),
        ),
        AnimatedContainer(
          transform: Matrix4.translationValues(xOffset, yOffset, 0)
            ..scale(scaleFactor),
          duration: const Duration(milliseconds: 250),
          child: Scaffold(
            appBar: AppBar(
              //leading drawer
              leading: isdraweropen
                  ? IconButton(
                onPressed: () {
                  setState(() {
                    xOffset = 0.0;
                    yOffset = 0.0;
                    scaleFactor = 1.0;
                    isdraweropen = false;
                  });
                },
                icon: const Icon(Icons.arrow_back_ios_new),
              )
                  : IconButton(
                icon: const Icon(Icons.menu),
                onPressed: () {
                  setState(() {
                    if(searchactive){
                      searchactive=false;
                      issearch=false;
                      icon = const Icon(
                        Icons.search_rounded,
                        color: Colors.white,
                      );
                    }
                    xOffset = 230;
                    yOffset = 150;
                    scaleFactor = 0.6;
                    isdraweropen = true;
                  });
                },
              ),
              //title software
              title: issearch
                  ? Container(
                height: 40,
                width: MediaQuery.of(context).size.width,
                color: Colors.blueGrey.shade700,
                padding: const EdgeInsets.only(
                  left: 20,
                ),
                child: TextField(
                  controller: searchcontroller,
                  textInputAction: TextInputAction.search,
                  style: const TextStyle(color: Colors.white54),
                  onChanged: (input) {},
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    icon: Icon(
                      Icons.search,
                      color: Colors.white54,
                    ),
                    hintText: "Search",
                    hintStyle: TextStyle(
                        color: Colors.white54,
                        fontStyle: FontStyle.italic),
                  ),
                ),
              )
                  : RichText(
                softWrap: true,
                overflow: TextOverflow.visible,
                text: const TextSpan(
                  children: [
                    TextSpan(
                      text: "Tarjima",
                      style: TextStyle(
                          color: Colors.green,
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                    ),
                    TextSpan(
                      text: "  kitoblar",
                      style: TextStyle(
                          color: Colors.blue,
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              centerTitle: true,
              elevation: 1,
              backgroundColor: Colors.blueGrey.shade700,
              actions: [
                IconButton(
                  onPressed: () {
                    setState(() {
                      if (issearch&&searchactive) {
                        if(searchcontroller.text.isNotEmpty){
                          searchcontroller.clear();
                        }else{
                          searchactive = false;
                          icon = const Icon(
                            Icons.search_rounded,
                            color: Colors.white,
                          );
                          issearch = false;
                        }
                      }else{
                        searchactive = true;
                        issearch = true;
                        searchcontroller.clear();
                        icon = const Icon(
                          Icons.clear_rounded,
                          color: Colors.red,
                        );
                      }
                    });
                  },
                  icon: icon,
                  color: Colors.black12,
                ),
              ],
            ),
            body: isloading?(!searchactive?Main_page_widget(context):SearchWidget(context)):Main_loading(),
          ),
        ),
      ],
    );
  }
}
class Category {
  final String image;
  final String name;
  Category({required this.image, required this.name});
}
class CategoryFile {
  final File? image;
  final String name;
  CategoryFile({required this.image, required this.name});
}