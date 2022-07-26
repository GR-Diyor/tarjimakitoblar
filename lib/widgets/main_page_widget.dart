
import 'dart:io';

import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scaled_list/scaled_list.dart';
import 'package:tarjimakitoblar/function/reading.dart';
import 'package:tarjimakitoblar/pages/main_page.dart';
import 'package:tarjimakitoblar/pages/secondary_pages/about_page.dart';
import 'package:tarjimakitoblar/pages/secondary_pages/downloads_page.dart';
import 'package:tarjimakitoblar/pages/secondary_pages/management_department_page.dart';
import 'package:tarjimakitoblar/pages/secondary_pages/personal_cabinet.dart';
import 'package:tarjimakitoblar/pages/secondary_pages/setting_page.dart';
import 'package:tarjimakitoblar/utills/admin_pref.dart';
import 'package:tarjimakitoblar/utills/thememodal.dart';
final List categories = [
  Category(image: "assets/images/img5.jpg", name: "Book"),
  Category(image: "assets/images/im1.webp", name: "Book"),
  Category(image: "assets/images/img2.webp", name: "Book"),
  Category(image: "assets/images/img3.webp", name: "Book"),
  Category(image: "assets/images/img4.jpg", name: "Book"),
];

final List<Color> kMixedColors = [
  const Color(0xff71A5D7),
  const Color(0xff72CCD4),
  const Color(0xffFBAB57),
  const Color(0xffF8B993),
  const Color(0xff962D17),
];
final List images = [
  "assets/images/img6.jpg",
  "assets/images/im1.webp",
  "assets/images/img2.webp",
  "assets/images/img3.webp",
  "assets/images/img4.jpg",
  "assets/images/img5.jpg",
];
Widget Main_page_widget(BuildContext context){
  return  Consumer(builder: (context, ThemeModal themeModal, child) {
    return SafeArea(
      child: Column(
        children: [
          Expanded(
            child: ListView(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              children: [
                //swiper 1
                Stack(
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        "MASHHURLAR",
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      width:
                      MediaQuery.of(context).size.width,
                      height: 300,
                      child: Container(
                        margin: const EdgeInsets.only(
                            top: 80, right: 15),
                        decoration: const BoxDecoration(
                          color: Colors.blueAccent,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(100),
                            bottomRight:
                            Radius.circular(100),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width:
                      MediaQuery.of(context).size.width,
                      margin:
                      const EdgeInsets.only(top: 30),
                      child: Column(
                        mainAxisAlignment:
                        MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            height: 180,
                            child: Center(
                              child: Swiper(
                                itemBuilder:
                                    (context, index) {
                                  return index<6?Image.asset(
                                    images[index],
                                  ):Image.file(images[index]);
                                },
                                autoplay: true,
                                itemCount: images.length,
                                pagination:
                                SwiperPagination(
                                    margin:
                                    EdgeInsets.zero,
                                    builder: SwiperCustomPagination(
                                        builder:
                                            (context,
                                            config) {
                                          return ConstrainedBox(
                                            constraints:
                                            const BoxConstraints
                                                .expand(
                                                height:
                                                50.0),
                                            child: Row(
                                              children: <Widget>[
                                                // Text(
                                                //   '${titles[config.activeIndex]} ${config.activeIndex + 1}/${config.itemCount}',
                                                //   style: const TextStyle(fontSize: 20.0),
                                                // ),
                                                Expanded(
                                                  child:
                                                  Align(
                                                    alignment:
                                                    Alignment.bottomCenter,
                                                    child: const DotSwiperPaginationBuilder(color: Colors.white, activeColor: Colors.green, size: 10.0, activeSize: 13.0).build(
                                                        context,
                                                        config),
                                                  ),
                                                )
                                              ],
                                            ),
                                          );
                                        })),
                                // control: const SwiperControl(color: Colors.blue),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                //scaled list
                Stack(
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        "OMMABOP",
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      height: 300,
                      margin:
                      const EdgeInsets.only(top: 30),
                      decoration: const BoxDecoration(
                        color: Colors.lightGreenAccent,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(100),
                            bottomRight:
                            Radius.circular(100)),
                      ),
                    ),
                    Container(
                      margin:
                      const EdgeInsets.only(top: 30),
                      child: ScaledList(
                        itemCount: categories.length,
                        showDots: true,
                        itemColor: (index) {
                          return kMixedColors[
                          index % kMixedColors.length];
                        },
                        itemBuilder:
                            (index, selectedIndex) {
                          final category =
                          categories[index];
                          File? file;
                          file=index>4?categories[index].image:null;
                          return Column(
                            // mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Container(
                                  padding:
                                  const EdgeInsets.all(15),
                                  height:
                                  selectedIndex == index
                                      ? 100
                                      : 80,
                                  child: index<5?Image.asset(
                                    category.image,
                                    fit: BoxFit.cover,
                                  ): Image.file(
                                    file!,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 15),
                              Align(
                                alignment:
                                Alignment.bottomCenter,
                                child: Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Text(
                                    category.name,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize:
                                        selectedIndex ==
                                            index
                                            ? 25
                                            : 20),
                                    softWrap: true,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 3),
                            ],
                          );
                        },
                      ),
                    ),
                  ],
                ),
                //card view
                Stack(
                  children: [
                    //  title
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        "OMMAVIY O'QILMOQDA",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    //nowadays books
                    Container(
                      margin:
                      const EdgeInsets.only(top: 15),
                      child: Card(
                        margin: const EdgeInsets.all(20),
                        elevation: 5,
                        color: themeModal.isdark?Colors.grey.withOpacity(0.6):Colors.white.withOpacity(0.98),
                        shadowColor: themeModal.isdark?Colors.white70:Colors.black,
                        semanticContainer: true,
                        shape: RoundedRectangleBorder(
                          borderRadius:
                          BorderRadius.circular(20),
                          side:  BorderSide(color:themeModal.isdark?Colors.white12:Colors.black12,style: BorderStyle.solid,width: 1.5),
                        ),
                        child:Column(
                          children: [
                            ommaviy("assets/images/im1.webp", "Sarlavha", "Muallif", "kitob haqida"),
                            ommaviy("assets/images/img2.webp", "Sarlavha", "Muallif", "kitob haqida"),
                            ommaviy("assets/images/img3.webp", "Sarlavha", "Muallif", "kitob haqida"),
                            ommaviy("assets/images/img4.jpg", "Sarlavha", "Muallif", "kitob haqida"),
                            ommaviy("assets/images/img5.jpg", "Sarlavha", "Muallif", "kitob haqida"),
                            ommaviy("assets/images/img6.jpg", "Sarlavha", "Muallif", "kitob haqida"),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                // bestseller title
                Container(
                  decoration: BoxDecoration(
                    color: Colors.black12,
                    border: Border.all(
                        width: 2, color: Colors.green),
                  ),
                  height: 40,
                  child: const Center(
                    child: Text(
                      "TAVSIYA ETILADI",
                      style: TextStyle(
                          fontSize: 19,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                // book trend or bestseller
                Container(
                  height: 150,
                  margin: const EdgeInsets.only(left: 5),
                  child: ListView(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    children: [
                      GestureDetector(
                        // onTap: () => book_navigate()
                        //     .About_thehealing(context),
                        child: Container(
                          width: 150,
                          height: 150,
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius:
                            BorderRadius.circular(25),
                          ),
                          child: Hero(
                              tag: 'thehealing',
                              child: Image.asset(
                                "assets/images/thehealing.png",
                                fit: BoxFit.cover,
                              )),
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      GestureDetector(
                        // onTap: () => book_navigate()
                        //     .About_wherethe(context),
                        child: Container(
                          width: 150,
                          height: 150,
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius:
                            BorderRadius.circular(25),
                          ),
                          child: Hero(
                              tag: "wherethe",
                              child: Image.asset(
                                "assets/images/wherethe.jpg",
                                fit: BoxFit.cover,
                              )),
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Container(
                        width: 150,
                        height: 150,
                        decoration: BoxDecoration(
                          color: Colors.yellow,
                          borderRadius:
                          BorderRadius.circular(25),
                        ),
                        child: Image.asset(
                          "assets/images/sarahwinman.jpg",
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Container(
                        width: 150,
                        height: 150,
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius:
                          BorderRadius.circular(25),
                        ),
                        child: Image.asset(
                          "assets/images/theshack.jpg",
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Container(
                        width: 150,
                        height: 150,
                        decoration: BoxDecoration(
                          color: Colors.brown,
                          borderRadius:
                          BorderRadius.circular(25),
                        ),
                        child: Image.asset(
                          "assets/images/roadatlas.jpg",
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Container(
                        width: 150,
                        height: 150,
                        decoration: BoxDecoration(
                          color: Colors.orange,
                          borderRadius:
                          BorderRadius.circular(25),
                        ),
                        child: Image.asset(
                          "assets/images/longwayhome.jpg",
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Container(
                        width: 150,
                        height: 150,
                        decoration: BoxDecoration(
                          color: Colors.teal,
                          borderRadius:
                          BorderRadius.circular(25),
                        ),
                        child: Image.asset(
                          "assets/images/noonesaw.jpg",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
  );
}


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
            ],
          ),
        ],
      ),
    ),
  );
}
