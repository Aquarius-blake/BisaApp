

import 'package:bisa_app/animation/PageTransition.dart';
import 'package:bisa_app/animation/fade_animation.dart';
import 'package:bisa_app/ui/home/Fitness/Fitness_home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FitnessSplash extends StatefulWidget {
  const FitnessSplash({super.key});

  @override
  State<FitnessSplash> createState() => _FitnessSplashState();
}

class _FitnessSplashState extends State<FitnessSplash> {

 late SharedPreferences prefs;
  String? gender;
  dynamic selectedindex = 0;


@override
  void initState() {
    initialize();
    super.initState();
  }


initialize()async{
  prefs = await SharedPreferences.getInstance();
  gender = await prefs.getString('gender');
  if(mounted){
    setState(() {
      
    });
  }
}

@override
  void dispose() {

    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    //prefs.remove('gender');
    return gender!=null? FitnessHome() : Scaffold(
      body: Center(
        child: Container(
          height: MediaQuery.of(context).size.height*0.8,
          padding: EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 20
            ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                 FadeAnimation(
                1.2,
                0,
                30, 
                Column(
                  children: [
                    Text(
                      "Welcome to Bisa Fitness",
                      style: TextStyle(
                     fontFamily: 'Poppins',
                     fontSize: 26.sp,
                     color:  Colors.black,
                     ),
                     textAlign: TextAlign.left,
                                   ),
                                   SizedBox(height: 2,),
                    Text(
                      "Choose your gender",
                      style: TextStyle(
                     fontFamily: 'Poppins',
                     fontSize: 24.sp,
                     color:  Colors.black,
                     ),
                     textAlign: TextAlign.left,
                                   ),
                  ],
                ),
               ),
             Container(
              width: MediaQuery.of(context).size.width*0.8,
              height: 450,
               child: RotatedBox(
                quarterTurns: 1,
                 child: ListWheelScrollView(
                  itemExtent: 180, 
                  squeeze: 0.7,
                  onSelectedItemChanged: (index){
                    setState(() {
                      selectedindex = index;
                    });
                  },
                  children: [
                    RotatedBox(
                      quarterTurns: 3,
                      child: Container(
                        height: 450,
                        width: 450,
                        child: Stack(
                          clipBehavior: Clip.none,
                          children: [
                            Center(
                              child: Transform.rotate(
                                angle: 0.8,
                                child: Container(
                                  height: 170,
                                  width: 170,
                                  decoration: BoxDecoration(
                                    color: selectedindex == 0 ? Colors.amber:Colors.transparent,
                                    borderRadius: BorderRadius.circular(20)
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              width: 450,
                              height: 450,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                //color: Colors.blue,
                                image: const DecorationImage(
                                  image: AssetImage("assets/workout/malegym2.png"),
                                  fit: BoxFit.cover
                                  )
                              ),
                              child: Text(""),
                            ),
                          ],
                        ),
                      ),
                    ),
                    RotatedBox(
                      quarterTurns: 3,
                      child: Container(
                        height: 450,
                        width: 450,
                        child: Stack(
                          clipBehavior: Clip.none,
                          children: [
                            Center(
                              child: Transform.rotate(
                                angle: 0.8,
                                child: Container(
                                  height: 200,
                                  width: 200,
                                  decoration: BoxDecoration(
                                    color: selectedindex == 1 ? Colors.pink:Colors.transparent,
                                    borderRadius: BorderRadius.circular(20)
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              width: 450,
                              height: 450,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                               // color: Colors.blue,
                                image: DecorationImage(
                                  image: AssetImage("assets/workout/femalegym2.png"),
                                  fit: BoxFit.cover
                                  )
                              ),
                              child: Text(""),
                            ),
                          ],
                        ),
                      ),
                    ),
                    
                  ]
                  ),
               ),
             ),
             SizedBox(
              child: InkWell(
                onTap: (){
                  if(selectedindex == 0){
                    prefs.setString('gender','Male');
                  }else{
                    prefs.setString('gender','female');
                  }
                  PagetransAnimate(context, PageTransitionType.fade, FitnessHome());
                },
                child: Container(
                  height: 50,
                  width: 200,
                  margin: const EdgeInsets.only(
                    top: 10,
                    bottom: 10
                    ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                        color: selectedindex == 1 ? Colors.pink:Colors.amber,
                        spreadRadius: 1,
                        blurRadius: 2,
                        offset: const Offset(0, 2), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Center(
                    child: Text(
                      "Continue",
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 20.sp,
                        color:  Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
             )
              ],
            ),
          ),
        ),
      ) ,
    );
  }
}