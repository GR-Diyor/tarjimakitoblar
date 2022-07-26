import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:tarjimakitoblar/utills/thememodal.dart';

class Downloads_page extends StatefulWidget {
  const Downloads_page({Key? key}) : super(key: key);
  static const String id="downloads_page";
  @override
  State<Downloads_page> createState() => _Downloads_pageState();
}

class _Downloads_pageState extends State<Downloads_page> {
  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ThemeModal themeModal, child) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueGrey,
          title: const Text("Yuklanganlar",style: TextStyle(color: Colors.white,fontSize: 25),),
          centerTitle: true,
        ),
        body: ListView(
          children: [
            const SizedBox(height: 20,),
            Slidable(
              actionPane:const SlidableDrawerActionPane(),
              actionExtentRatio: 0.25,
              child: Card(
                child: ListTile(
                  leading: const Icon(Icons.download),
                  title: const Text("The healing",style: TextStyle(color: Colors.blueGrey,fontSize: 15,fontWeight: FontWeight.bold,),),
                  trailing: Image.asset("assets/images/thehealing.png",fit: BoxFit.cover,),
                  subtitle: const Text("2022-11-08 20:15",style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold),),
                ),
              ),
              secondaryActions: [
                IconSlideAction(
                  caption: 'Delete',
                  color: Colors.red,
                  icon: Icons.delete,
                  onTap: () {
                  },
                ),
              ],
            ),
          ],
        ),
      );
    }
    );
  }
}
