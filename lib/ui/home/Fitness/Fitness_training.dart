

import 'dart:math';

import 'package:bisa_app/animation/fade_animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FitnessTraining extends StatefulWidget {
  const FitnessTraining({super.key});

  @override
  State<FitnessTraining> createState() => _FitnessTrainingState();
}

class _FitnessTrainingState extends State<FitnessTraining> {

late SharedPreferences prefs;

List titles =[
  "Pump those muscles", 
  "Lose some weight", 
  "Get Fit",
  "Unleash your inner athlete",
  "Challenge yourself!",
   " Achieve your fitness goals!",
    "Get that summer body!",
    " Prioritize your health and well-being!",
    "Sweat and feel empowered!",
    "Invest in yourself and your fitness journey!"
  ];
Random random =  Random();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body:Container(
        padding: EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 20
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 40.h,),
            Center(
              child: FadeAnimation(
                  1.2,
                  0,
                  30, 
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Time to",
                        style: TextStyle(
                       fontFamily: 'Poppins',
                       fontSize: 26.sp,
                       color:  Colors.black,
                       ),
                       textAlign: TextAlign.center,
                                     ),
                                     SizedBox(height: 2,),
                      Text(
                        titles[random.nextInt(titles.length)],
                        style: TextStyle(
                       fontFamily: 'Poppins',
                       fontSize: 24.sp,
                       color:  Colors.black,
                       ),
                       textAlign: TextAlign.center,
                                     ),
                    ],
                  ),
                 ),
            ),
            SizedBox(height: 40.h,),
            FadeAnimation(  
              1.2,
                  0,
                  30,
                  Text(
                    "Let\'s get you started",
                    style: TextStyle(
                       fontFamily: 'Poppins',
                       fontSize: 16.sp,
                       color:  Colors.black,
                       ),
                    textAlign: TextAlign.left,
                    )
                  ),
            SizedBox(height: 20.h,),
            Container(
              height: MediaQuery.of(context).size.height*0.64,
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemBuilder: ( context , index ) => Container(
                  width: MediaQuery.of(context).size.width*0.8,
                  height: 100,
                  margin: EdgeInsets.symmetric(
                    vertical: 10
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 10
                  ),
                  decoration: BoxDecoration(
                    // color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                      image: AssetImage("assets/workout/mabs1.png"),
                      fit: BoxFit.cover,
                      colorFilter: ColorFilter.mode(
                        Colors.black.withOpacity(0.5), 
                        BlendMode.darken)
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 1,
                        blurRadius: 7,
                        offset: const Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 10,),
                      Text(
                        "Workout 1",style: 
                        TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 20.sp,
                          color:  Colors.white,
                        ),
                        textAlign: TextAlign.left,
                        ),
                        const Expanded(child: SizedBox()),
                        Row(
                          children: [
                            Text(
                              "Level: Beginner",
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 14.sp,
                                color:  Colors.white,
                              ),
                              textAlign: TextAlign.left,
                            ),
                            const Expanded(child: SizedBox()),
                            Text(
                              "Duration: 30 mins",
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 14.sp,
                                color:  Colors.white,
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ],
                        )
                    ],
                  ),
                )
                ),
            )
          ],
        ),
      ),
    ); 
  }
}