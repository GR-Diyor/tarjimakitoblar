import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tarjimakitoblar/books/book_view/view.dart';
import 'package:tarjimakitoblar/utills/thememodal.dart';

class Public_list extends StatefulWidget {
 // const Public_list({Key? key}) : super(key: key);
  late String? image;
  late String? title;
  late String? author;

  Public_list({required this.image,required this.title,required this.author});

  @override
  State<Public_list> createState() => _Public_listState();
}

class _Public_listState extends State<Public_list> {
  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: "public",
      child: Container(
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
                  Image.asset(
                    widget.image!,
                    fit: BoxFit
                        .cover,
                  ),),
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
                      widget.title!,
                      style: TextStyle(
                          color:Colors.black,
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
                      widget.author!,
                      style: TextStyle(
                          color:Colors.black,
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
    );
  }
}

class ommaviyclass{
  final File img;
 final String title;
  final String author;
  ommaviyclass({required this.img,required this.title,required this.author});
}

void openPDF(BuildContext context, File file) => Navigator.of(context).push(
  MaterialPageRoute(builder: (context) => PDFViewerPage(file: file)),
);