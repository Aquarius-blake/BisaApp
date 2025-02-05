
import 'package:bisa_app/animation/PageTransition.dart';
import 'package:bisa_app/animation/fade_animation.dart';
import 'package:bisa_app/ui/home/babycare/babyinput.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Babyhome extends StatefulWidget {
  const Babyhome({super.key});

  @override
  State<Babyhome> createState() => _BabyhomeState();
}

class _BabyhomeState extends State<Babyhome> {

late SharedPreferences prefs;
String? weight;
String? sleep;
int? sinceEpoch;
DateTime? Birthday;
List Vaccinationsdates = [
  
];
List Vaccines =[
  "BCG, OPVO, Hepatitis B",
"OPV1, DPT/HiB/HepB1, Rotavirus 1, Pneumococcal 1",
"OPV2, DPT/HiB/HepB2, Rotavirus2, Pneumococcal 2",
"OPV3, DPT/HiB/HepB3, Pneumococcal 3, Inactivated Polio vaccine (IPV)",
"Vitamin A",
"MR1, Yellow fever",
"Vitamin A",
"MR2, MenA"
];
List intervals = [0,42,70,98,183,274,365,548];

@override
  void initState() {
   initialize();
    super.initState();
  }

Future<void> initialize()async{
  prefs = await SharedPreferences.getInstance();
  weight = prefs.getString('Bweight');
  sleep = prefs.getString('Bsleep');
  sinceEpoch = prefs.getInt('BDOB') ?? 0;
  Birthday = DateTime.fromMillisecondsSinceEpoch(sinceEpoch!);

  intervals.forEach((element) {
    Vaccinationsdates.add(Birthday!.add(Duration(days:element)));
   });

  if(weight!=null){
    weight = "${weight!} Kg";
  }
  if(sleep!=null){
    sleep = "${sleep!} Hrs";
  }
  if(mounted){
    setState(() {
      
    });
  }
}

@override
  void didUpdateWidget(covariant Babyhome oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
   // print(Birthday);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios_new_outlined
         ),
         ),
         actions: [
          TextButton(
            onPressed: (){
                PageAnimateNoRep(context, PageTransitionType.rightToLeft, Babyinput());
            }, 
          child:const Text(
            "Update Info",
            style: TextStyle(
              color: Color(0xFFB5E255)
            ),
            ))
         ],
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
                              weight ?? "N/A",
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
                              sleep ?? "N/A",
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
               Container(
                height: 700,
                margin: EdgeInsets.symmetric(
                  horizontal: 10
                ),
                child: ListView.builder(
                  itemCount: Vaccines.length,
                  itemBuilder: (context,index) => Container(
                    margin: EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 10
                    ),
                    padding:const EdgeInsets.symmetric(
                      horizontal: 25,
                      vertical: 20
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: const [
                        BoxShadow(
                              color: Color(0xFFB5E255),
                              spreadRadius: 0.2,
                              blurRadius: 1,
                              offset:  Offset(1, 2), // changes position of shadow
                            ),
                      ]
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width*0.8,
                          child: Row(
                            children: [
                              Text(
                                "Vaccines:",
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16.sp,
                                  color: const Color.fromRGBO(23, 30, 60, 1),
                                ),
                                ),
                                const SizedBox(width: 10,),
                              Expanded(
                                child: Text(
                                  " ${Vaccines[index]}",
                                   style: TextStyle(
                                 fontFamily: 'Poppins',
                                    fontSize: 16.sp,
                                    color: const Color.fromRGBO(23, 30, 60, 1),
                              ),
                                  )
                                  ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 10,),
                        Container(
                          width: MediaQuery.of(context).size.width*0.8,
                          child: Row(
                            children: [
                              Text(
                                "Due Date:",
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16.sp,
                                  color: const Color.fromRGBO(23, 30, 60, 1),
                                ),
                                ),
                                const SizedBox(width: 10,),
                              Expanded(
                                child: Text(
                                  " ${DateFormat('dd-MM-yyyy').format(Vaccinationsdates[index])}",
                                   style: TextStyle(
                                      fontFamily: 'Poppins',
                                          fontSize: 16.sp,
                                          color: const Color.fromRGBO(23, 30, 60, 1),
                                    ),
                                  )
                                  ),
                            ],
                          ),
                        ),
               
                      ],
                    ),
                  )
                  ),
               ),
               SizedBox(
                height:120.h
                )
            ],
          )
          ),
      ),
      // floatingActionButton: Row(
      //   mainAxisAlignment: MainAxisAlignment.center,
      //   children: [
      //     InkWell(
      //       onTap: (){
      //         PageAnimateNoRep(context, PageTransitionType.rightToLeft, Babyinput());

      //       },
      //       child: Container(
      //                   height: 50,
      //                   width: 200,
      //                   margin: const EdgeInsets.only(
      //                     top: 10,
      //                     bottom: 10,
      //                     left:30
      //                     ),
      //                   decoration: BoxDecoration(
      //                     color: Colors.white,
      //                     borderRadius: BorderRadius.circular(30),
      //                     boxShadow: const [
      //                       BoxShadow(
      //                         color: Color(0xFFB5E255),
      //                         spreadRadius: 0,
      //                         blurRadius: 0.5,
      //                         offset:  Offset(0, 2), // changes position of shadow
      //                       ),
      //                     ],
      //                   ),
      //                   child: Center(
      //                     child: Text(
      //                       "Update info",
      //                       style: TextStyle(
      //                         fontFamily: 'Poppins',
      //                         fontSize: 20.sp,
      //                         color:  Colors.black,
      //                       ),
      //                     ),
      //                   ),
      //                 ),
      //     ),
      //   ],
      // ),
    );
  }
}