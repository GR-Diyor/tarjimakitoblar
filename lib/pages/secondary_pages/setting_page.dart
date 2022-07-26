import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tarjimakitoblar/utills/thememodal.dart';

class Setting_page extends StatefulWidget {
  const Setting_page({Key? key}) : super(key: key);
  static const String id = "setting_page";
  @override
  State<Setting_page> createState() => _Setting_pageState();
}

class _Setting_pageState extends State<Setting_page> {
  double _slider1val = 13.0;
  double values = 13.0;
  bool isswitch = true;
  bool isnotification = true;
  @override
  Widget build(BuildContext context) {
    return Consumer(
        builder: (context,ThemeModal themeNotifier,child) {
          return Scaffold(

            appBar: AppBar(
              backgroundColor: Colors.blueGrey,
              title: const Text(
                "Sozlamalar",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                ),
              ),
              centerTitle: true,
            ),
            body: ListView(
              children: [
                const SizedBox(
                  height: 10,
                ),
                Slider(
                  max: 20.0,
                  min: 11.0,
                  divisions: 9,
                  onChanged: (double value) {
                    setState(() => {
                      _slider1val = value,
                      values = value,
                    });
                  },
                  value: _slider1val,
                ),
                Card(
                  color: Colors.blueGrey[100],
                  child: ListTile(
                    leading: const Icon(Icons.format_size),
                    title: const Text("Font size",
                        style: TextStyle(
                          fontSize: 19,
                        )),
                    trailing: Text(
                      "abc",
                      style: TextStyle(
                          color:themeNotifier.isdark?Colors.white70:Colors.grey,
                          fontSize: values,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Card(
                  color: Colors.blueGrey[100],
                  child: ListTile(
                    leading: const Icon(
                      Icons.brightness_medium_outlined,
                      color: Colors.grey,
                    ),
                    title:Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text(
                          "Theme",
                          style: TextStyle(
                            fontSize: 19,
                          ),
                        ),

                        Switch(
                          value: themeNotifier.isdark?false:true,
                          onChanged: (value) {
                            themeNotifier.isdark?themeNotifier.isdark=false:themeNotifier.isdark=true;
                          },
                        ),
                      ],
                    ),
                    trailing: Icon(
                      themeNotifier.isdark==false? Icons.wb_sunny : Icons.dark_mode_outlined,
                      color: themeNotifier.isdark==false? Colors.yellowAccent : Colors.white,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Card(
                  color: Colors.blueGrey[100],
                  child: ListTile(
                    leading: const Icon(
                      Icons.notifications,
                      color: Colors.grey,
                    ),
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text(
                          "Notication",
                          style: TextStyle(
                            fontSize: 19,
                          ),
                        ),
                        Switch(
                          value: isnotification,
                          onChanged: (bool notification) {
                            isnotification ? false : true;
                            setState(() {
                              isnotification = notification;
                            });
                          },
                        ),
                      ],
                    ),
                    trailing: Icon(
                      isnotification ? Icons.notifications : Icons.notifications_off,
                      color: isnotification ? Colors.blue : Colors.red,
                    ),
                  ),
                ),
              ],
            ),
          );
        }
    );
  }
}
