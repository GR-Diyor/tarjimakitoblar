import 'dart:io';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scaled_list/scaled_list.dart';
import 'package:tarjimakitoblar/books/book_about_of_famous.dart';
import 'package:tarjimakitoblar/books/book_about_of_popular.dart';
import 'package:tarjimakitoblar/books/book_about_of_public_reading.dart';
import 'package:tarjimakitoblar/function/reading.dart';
import 'package:tarjimakitoblar/pages/main_page.dart';
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
final List ommaviybooks=[
  Public_list(image:"assets/images/im1.webp", title: "Sarlavha", author: "Muallif"),
  Public_list(image:"assets/images/img2.webp", title:"Sarlavha", author:"Muallif"),
  Public_list(image:"assets/images/img3.webp", title:"Sarlavha", author:"Muallif"),
  Public_list(image:"assets/images/img4.jpg", title:"Sarlavha", author:"Muallif"),
  Public_list(image:"assets/images/img5.jpg", title:"Sarlavha", author:"Muallif"),
  Public_list(image:"assets/images/img6.jpg", title:"Sarlavha", author:"Muallif"),
];
GlobalKey _key=GlobalKey();
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
                            child: Hero(
                              tag: "famous",
                              transitionOnUserGestures: true,
                              key: _key,
                              child: Center(
                                child: Swiper(
                                  itemBuilder:
                                      (context, index) {
                                    return index<6?GestureDetector(
                                      onTap: (){
                                        Navigator.push(context, MaterialPageRoute(builder: (BuildContext context){
                                          return Book_about(index: index,);
                                        }));
                                      },
                                      child: Image.asset(
                                        images[index],
                                      ),
                                    ):GestureDetector(
                                        onTap: (){
                                      Navigator.push(context, MaterialPageRoute(builder: (BuildContext context){
                                        return Book_about(index: index,);
                                      }));
                                    },
                                        child:Image.file(images[index]),
                                    );
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
                          return
                            Column(
                              // mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: GestureDetector(
                                    onTap:(){
                                      Navigator.push(context, MaterialPageRoute(builder: (BuildContext context){
                                        return Book_popular(index: index,);
                                      },
                                      ),
                                      );
                                    },
                                    child: Hero(
                                      transitionOnUserGestures: true,
                                      tag: "popular",
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
                        child:
                            ListView.builder(
                              scrollDirection: Axis.vertical,
                              shrinkWrap: true,
                              itemCount: ommaviybooks.length,
                              physics: const BouncingScrollPhysics(),
                              itemBuilder: (BuildContext context, int index){
                                return GestureDetector(
                                  onTap: (){
                                    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context){
                                      return Book_public(index: index,);
                                    },
                                    ),
                                    );
                                  },
                                  child: Container(
                                   child: index<=5?ommaviybooks[index]
                                      :Container(
                                  width: MediaQuery.of(context).size.width,
                                  margin: const EdgeInsets.only(
                                  bottom: 10, left: 5),
                                  child: Row(
                                  children: [
                                  Expanded(
                                  flex: 1,
                                  child: Container(
                                  padding:
                                  const EdgeInsets
                                      .all(10),
                                  height: 180,
                                  child: Align(
                                  alignment:
                                  Alignment
                                      .topLeft,
                                  child:
                                  Hero(
                                      tag: "public",
                                      child: Image.file(ommaviybooks[index].img)),
                                  ),
                                  ),
                                  ),
                                  Expanded(
                                  flex: 2,
                                  child: Column(
                                  mainAxisAlignment:
                                  MainAxisAlignment
                                      .start,
                                  crossAxisAlignment:
                                  CrossAxisAlignment
                                      .start,
                                  children:  [
                                  Padding(
                                  padding:
                                  const EdgeInsets
                                      .all(8.0),
                                  child: Text(
                                    ommaviybooks[index].title,
                                  style: TextStyle(
                                  color: themeModal.isdark?Colors.white.withOpacity(.9):Colors.black,
                                  fontSize:
                                  23,
                                  fontWeight:
                                  FontWeight
                                      .bold),
                                  ),
                                  ),
                                  Padding(
                                  padding:
                                  const EdgeInsets
                                      .all(8.0),
                                  child: Text(
                                    ommaviybooks[index].author,
                                  style: TextStyle(
                                  color: themeModal.isdark?Colors.white.withOpacity(.9):Colors.black,
                                  fontSize:
                                  14.5,
                                  fontWeight:
                                  FontWeight
                                      .bold),
                                  ),
                                  ),
                                  ],
                                  ),
                                  ),
                                  ],
                                  ),
                                  ),
                                  ),
                                );
                                },
                                ),

                        ),
                    ),
                  ],
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


