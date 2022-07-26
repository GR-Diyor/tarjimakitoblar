import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tarjimakitoblar/utills/thememodal.dart';

Widget ommaviy(String image, String title,String author, String about){
  return Consumer(builder: (context, ThemeModal themeModal, child) {
    return Container(
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
                  Image.asset(
                    image,
                    fit: BoxFit
                        .cover,
                  )),
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
                    title,
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
                    author,
                    style: TextStyle(
                        color: themeModal.isdark?Colors.white.withOpacity(.9):Colors.black,
                        fontSize:
                        14.5,
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
                    about,
                    style:
                    TextStyle(
                      color: themeModal.isdark?Colors.white.withOpacity(.6):Colors.grey,
                      fontSize: 12,
                    ),
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