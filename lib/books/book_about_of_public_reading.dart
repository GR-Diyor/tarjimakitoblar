import 'package:flutter/material.dart';
import 'package:slimy_card/slimy_card.dart';
import 'package:tarjimakitoblar/pages/main_page.dart';
import 'package:tarjimakitoblar/utills/toast.dart';
import 'package:tarjimakitoblar/widgets/main_page_widget.dart';

class Book_public extends StatefulWidget {
  static const String id="Book_public";
  final int index;
  const Book_public({Key? key, required this.index}) : super(key: key);
  @override
  State<Book_public> createState() => _Book_publicState();
}
GlobalKey _key=GlobalKey();
class _Book_publicState extends State<Book_public> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Image.asset("assets/images/img11.jpg",fit: BoxFit.cover)),
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            alignment: Alignment.center,
            child: ListView(
              // mainAxisAlignment: MainAxisAlignment.center,
              // crossAxisAlignment: CrossAxisAlignment.center,
              scrollDirection: Axis.vertical,
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              reverse: true,
              children: [
                SlimyCard(
                  color: const Color(-1728053249),
                  width: MediaQuery.of(context).size.width*0.8,
                  topCardHeight: 400,
                  bottomCardHeight: MediaQuery.of(context).size.width,
                  borderRadius: 30,
                  slimeEnabled: true,
                  topCardWidget:  SizedBox(
                    height: MediaQuery.of(context).size.height*0.4,
                    width: MediaQuery.of(context).size.width*0.4,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Hero(
                            tag: "public",
                            transitionOnUserGestures: true,
                            key: _key,
                            child: widget.index<6?Image.asset(ommaviybooks[widget.index].image,fit: BoxFit.contain,):Image.file(ommaviybooks[widget.index].img,fit: BoxFit.contain,)
                        ),
                        const SizedBox(height: 20,),
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.indigoAccent,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(width: 0.5,color: Colors.indigo,style: BorderStyle.solid)
                          ),
                          child: TextButton(
                            // color: Colors.indigo,
                            //  highlightColor: Colors.tealAccent,
                            autofocus: false,
                            onPressed: () {
                              Toasts.fireToast("Muaffaqiyatli yuklandi.");
                            },
                            child: const Text("Yuklash",style: TextStyle(color: Colors.white),),
                          ),
                        ),
                      ],
                    ),),
                  bottomCardWidget: Text.rich(
                    textAlign: TextAlign.center,
                    TextSpan(
                      spellOut: true,
                      text:"Kitob haqida\n",style: TextStyle(fontFamily: "Nottingsam_Demo",fontSize: 23,color: Colors.white,),
                      children: [
                        TextSpan(text:"fasfsafasfsdfsdafsadfsdfsdffddfdsfsad"
                            "sdfsdafsdfsdfsdfasfsadfsadfsfsafsdf"
                            "sdfsdfffffffffffffffffffffff"
                            "sdfffffffffffffffffffffffff"
                            "sdffffffffffffffffffffffffff"
                            "sdfffffffffffffffffffffffffffffd"
                            "sdfffffffffffffffffffffffffffffff"
                            "sdfffffffffffffffffffffffffffffffffsdfsdfs",style: TextStyle(color: Colors.white,fontSize:14,fontFamily: "BebasNeue-Regular"),),
                      ],
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
}
