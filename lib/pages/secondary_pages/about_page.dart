import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tarjimakitoblar/utills/thememodal.dart';
import 'package:url_launcher/url_launcher.dart';
class About_page extends StatefulWidget {
  const About_page({Key? key}) : super(key: key);
  static const String id = "about_page";
  @override
  State<About_page> createState() => _About_pageState();
}

class _About_pageState extends State<About_page> {
  final String _urlT = 'https://telegram.me/spenser_mobile_developer';
  final String _urlI = 'https://www.instagram.com/spenser_mobile_developer/';
  final String _urlF = 'https://www.facebook.com/profile.php?id=100075583323142';
  final String _urlTW = 'https://twitter.com/Spenser_mobile';
  final String _urlL = 'https://www.linkedin.com/in/diyorbek-nizomiddinov-058415232/';
  void _launchURLtelegram() async {
    if (!await launch(_urlT)) throw 'Could not launch $_urlT';
  }
  void _launchURLintagram() async {
    if (!await launch(_urlI)) throw 'Could not launch $_urlI';
  }
  void _launchURLfacebook() async {
    if (!await launch(_urlF)) throw 'Could not launch $_urlF';
  }
  void _launchURLtwitter() async {
    if (!await launch(_urlTW)) throw 'Could not launch $_urlTW';
  }
  void _launchURLlinkedin() async {
    if (!await launch(_urlL)) throw 'Could not launch $_urlL';
  }
  @override
  Widget build(BuildContext context) {
    return  Consumer(builder: (context, ThemeModal themeModal, child) {
      return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Dastur haqida",
            style: TextStyle(
                color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          backgroundColor: Colors.blueGrey.shade700,
          elevation: 0,
        ),
        body: SafeArea(
          child: Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                 Text("Dastur Test rejimida  ishga  tushirilgan",style:Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: themeModal.isdark?Colors.white70:Colors.green,
                ),
                     textAlign:TextAlign.center,
                 ),
                Text("Dasturdan foydalangan holda siz Jahon kitoblarini O'zbek tilida o'qishingiz mumkin."
                    "Dasturga foydalanuvchilar uchun yangi qulayliklar qo'shilmoqda. Bizni ijtimoiy tarmoqlar orqali kuzatib boring!",style:Theme.of(context).textTheme.bodySmall?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: themeModal.isdark?Colors.white70:Colors.black45,

                ),
                  textAlign:TextAlign.justify,
                ),
                RichText(
                  text: const TextSpan(
                    children: [
                      TextSpan(
                        text: "Dastur haqida fikringiz yoki dasturdagi muommo va"
                            " kamchiliklarni bizga yo'llashingiz mumkin."
                        ,style: TextStyle(color: Colors.blue,fontSize: 14),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 50,),
                Container(
                  height: 400,
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Container(
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(25),
                          border: Border.all(width: 1,color: Colors.red),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset("assets/images/telegram.webp",width: 45,height: 45,),
                            TextButton(
                              onPressed: (){
                                _launchURLtelegram();
                              },
                              child: const Text("Telegram",style: TextStyle(color: Colors.blue,fontSize: 18,fontWeight: FontWeight.bold),),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(25),
                          border: Border.all(width: 1,color: Colors.red),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset("assets/images/instagram.png",width: 45,height: 45,),
                            TextButton(
                              onPressed: (){
                                _launchURLintagram();
                              },
                              child: const Text("Instagram",style: TextStyle(color: Colors.pinkAccent,fontSize: 18,fontWeight: FontWeight.bold),),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 50,
                        width: 140,
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(25),
                          border: Border.all(width: 1,color: Colors.red),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset("assets/images/facebook.png",width: 45,height: 45,),
                            TextButton(
                              onPressed: (){
                                _launchURLfacebook();
                              },
                              child: const Text("Facebook",style: TextStyle(color: Colors.blue,fontSize: 18,fontWeight: FontWeight.bold),),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 50,
                        width: 140,
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(25),
                          border: Border.all(width: 1,color: Colors.red),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset("assets/images/Twitter.png",width: 45,height: 45,),
                            TextButton(
                              onPressed: (){
                                _launchURLtwitter();
                              },
                              child: const Text("Twitter",style: TextStyle(color: Colors.cyanAccent,fontSize: 18,fontWeight: FontWeight.bold),),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 50,
                        width: 140,
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(25),
                          border: Border.all(width: 1,color: Colors.red),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset("assets/images/linkedin.png",width: 45,height: 45,),
                            TextButton(
                              onPressed: (){
                                _launchURLlinkedin();
                              },
                              child: const Text("Linkedln",style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold),),
                            ),
                          ],
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
    }
    );
  }
}
