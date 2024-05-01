

import 'dart:math';

import 'package:bisa_app/animation/PageTransition.dart';
import 'package:bisa_app/animation/fade_animation.dart';
import 'package:bisa_app/services/workout_service.dart';
import 'package:bisa_app/ui/home/Fitness/Fitness_fitness.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FitnessTraining extends StatefulWidget {
  const FitnessTraining({super.key});

  @override
  State<FitnessTraining> createState() => _FitnessTrainingState();
}

class _FitnessTrainingState extends State<FitnessTraining> {

late SharedPreferences prefs;
final WorkoutService _workoutService = WorkoutService();
dynamic workoutresponse;
String? gender;

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
  void initState() {
    initprefs();
    //initialize();
    super.initState();
  }

  initprefs()async{
    prefs = await SharedPreferences.getInstance();
    gender = await prefs.getString('gender') ?? 'female';
    if(gender == 'female'){
     workoutresponse = await _workoutService.getfemaleWorkouts();
     if(mounted){
      setState(() {
        
      });
     }
   }else{
     workoutresponse = await _workoutService.getMaleWorkouts();
     if(mounted){
      setState(() {
        
      });
     }
   }
  }


  initialize()async{
   if(gender == 'Female'){
     workoutresponse = await _workoutService.getfemaleWorkouts();
     if(mounted){
      setState(() {
        
      });
     }
   }else{
     workoutresponse = await _workoutService.getMaleWorkouts();
     if(mounted){
      setState(() {
        
      });
     }
   }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: (){
            Navigator.pop(context);
          },
        ),
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        toolbarHeight: 30,
        surfaceTintColor: Colors.transparent,
      ),
      body:Container(
        padding: EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 10
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10.h,),
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
           workoutresponse == null ? Container() : Container(
                height: MediaQuery.of(context).size.height*0.64,
                child: ListView.builder(
                //  physics: const NeverScrollableScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  itemCount: workoutresponse.length,
                  itemBuilder: ( context , index ) => InkWell(
                    onTap: (){
                      PageAnimateNoRep(
                        context, 
                        PageTransitionType.fade,
                         Fitness_fitness(
                        workoutdata: workoutresponse[index]['workouts'],
                        workout: workoutresponse[index]['name'],
                        )
                        );
                    },
                    child: Container(
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
                          image: AssetImage("${workoutresponse[index]['image']}"),
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
                            "${workoutresponse[index]['name']}",style: 
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
                                  "Level: ${workoutresponse[index]['level']}",
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 14.sp,
                                    color:  Colors.white,
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                                const Expanded(child: SizedBox()),
                                Text(
                                  "Duration: ${workoutresponse[index]['duration']} mins",
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
                    ),
                  )
                  ),
              ),
              SizedBox(height: 30.h,)
            ],
          ),
        ),
      ),
    ); 
  }
}