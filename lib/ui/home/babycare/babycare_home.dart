
import 'package:bisa_app/animation/PageTransition.dart';
import 'package:bisa_app/animation/fade_animation.dart';
import 'package:bisa_app/ui/home/babycare/babyinput.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Babyhome extends StatefulWidget {
  const Babyhome({super.key});

  @override
  State<Babyhome> createState() => _BabyhomeState();
}

class _BabyhomeState extends State<Babyhome> {

late SharedPreferences prefs;
List Vaccinationsdates = [
  
];

@override
  void initState() {
    initialize();
    super.initState();
  }

Future<void> initialize()async{
  prefs = await SharedPreferences.getInstance();
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: (){},
          icon: Icon(Icons.arrow_back_ios_new_outlined
         ),
         ),
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                 child: FadeAnimation(
                        1.2,
                        0,
                        30,
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'Keep Track of Your Child\'s Health And Well-Being',
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w600,
                                  fontSize: 22.sp,
                                  color: const Color.fromRGBO(23, 30, 60, 1),
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                      ),
               ),
               const SizedBox(
                height: 30,
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 30
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        height: 80,
                        width: 80,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(
                            image: AssetImage('assets/imgs/bweight.png')
                            ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.topRight,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                         // crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Weight",
                              style: TextStyle(
                                 fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18.sp,
                                    color: const Color.fromRGBO(23, 30, 60, 1),
                              ),
                              ),
                             const SizedBox(height: 10,),
                            Text( 
                              "N/A",
                              style: TextStyle(
                                 fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14.sp,
                                    color: const Color.fromRGBO(23, 30, 60, 1),
                              ),
                             ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                height: 30,
                ),
                 Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 30
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        height: 80,
                        width: 80,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(
                            image: AssetImage('assets/imgs/bsleep.png')
                            ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.topRight,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                         // crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Sleep Hours",
                              style: TextStyle(
                                 fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18.sp,
                                    color: const Color.fromRGBO(23, 30, 60, 1),
                              ),
                              ),
                             const SizedBox(height: 10,),
                            Text( 
                              "N/A",
                              style: TextStyle(
                                 fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14.sp,
                                    color: const Color.fromRGBO(23, 30, 60, 1),
                              ),
                             ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                height: 40,
                ),
                Center(
                 child: FadeAnimation(
                        1.2,
                        0,
                        30,
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'Vaccinations',
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w600,
                                  fontSize: 22.sp,
                                  color: const Color.fromRGBO(23, 30, 60, 1),
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                      ),
               ),
            ],
          )
          ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InkWell(
            onTap: (){
              PageAnimateNoRep(context, PageTransitionType.rightToLeft, Babyinput());
            },
            child: Container(
                        height: 50,
                        width: 200,
                        margin: const EdgeInsets.only(
                          top: 10,
                          bottom: 10,
                          left:30
                          ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30),
                          boxShadow: const [
                            BoxShadow(
                              color: Color(0xFFB5E255),
                              spreadRadius: 1,
                              blurRadius: 2,
                              offset:  Offset(0, 2), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Center(
                          child: Text(
                            "Update info",
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 20.sp,
                              color:  Colors.black,
                            ),
                          ),
                        ),
                      ),
          ),
        ],
      ),
    );
  }
}