

import 'dart:math';

import 'package:bisa_app/models/current_user.dart';
import 'package:bisa_app/providers/current_user_provider.dart';
import 'package:bisa_app/services/local_notifications.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FitnessGoals extends StatefulWidget {
  const FitnessGoals({super.key});

  @override
  State<FitnessGoals> createState() => _FitnessGoalsState();
}

class _FitnessGoalsState extends State<FitnessGoals> {


   late SharedPreferences prefs;
  late CurrentUser currentUser;
  String? gender;
  String? remtype;
  List reminders = [
        "Time to sweat it out! Let's crush this workout!",
    "Workout mode: activated! Let's hustle!",
    "It's go time! Get ready to unleash your inner beast!",
    "Strap in, it's time to push your limits!",
    "No excuses, just results! Let's get this workout started!",
    "Wake up, work out, dominate! Let's do this!",
    "The only bad workout is the one that didn't happen. Let's make it happen!",
    "Get pumped! Your body will thank you later!",
    "It's not just a workout, it's an investment in yourself. Let's invest some sweat equity!",
    "Get ready to feel the burn! Let's make every rep count!",
    "Time to turn up the intensity! Let's sweat, smile, repeat!",
    "You vs. You. Let's crush those fitness goals!",
    "Today's workout is tomorrow's strength. Let's build that foundation!",
    "Challenge accepted! Let's push past our limits and grow stronger!",
    "Your body achieves what your mind believes. Let's make it happen!",
    "Let's hustle for that muscle! Time to get our sweat on!",
    "Every drop of sweat brings you closer to your goals. Let's make it rain!",
    "Embrace the grind! Let's work hard and make progress!",
    "Your workout is waiting for you. Let's go show it who's boss!",
    "Get ready to feel the burn and love every minute of it! Let's crush this workout!",
  ];
  Random random = Random();


@override
  void initState() {
    initialize();
    super.initState();
  }

initialize()async{
  prefs = await SharedPreferences.getInstance();
  gender = await prefs.getString("gender") ?? "Male";
  remtype = await prefs.getString("remindertype") ?? "None";
  if(mounted){
    setState(() {
      
    });
  }
}



  @override
  Widget build(BuildContext context) {
    currentUser = context.read<CurrentUserProvider>().currentUser!;
    return Theme(
      data: ThemeData(
        primarySwatch: gender == "Male" ?Colors.amber : Colors.pink,
      ),
      child: Container(
        decoration:  BoxDecoration(
          image: DecorationImage(
            image: gender == "Male" ? const AssetImage("assets/workout/test.png"): const AssetImage("assets/workout/test2.png"),
            fit: BoxFit.cover,
            colorFilter: const ColorFilter.mode(Colors.black54, BlendMode.darken)
          )
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          extendBody: true,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: IconButton(
              icon: const Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
                ),
              onPressed: (){
                Navigator.pop(context);
              },
            ),
            // title: Text(
            //   "Set Fitness Goals",
            //    style: TextStyle(
            //     color: Colors.white,
            //   fontSize: 20.sp,
            //   fontWeight: FontWeight.bold
            // ),),
            centerTitle: true,
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  color: Colors.transparent,
                  height:150.h,
                ),
                Container(
                  height: MediaQuery.of(context).size.height*0.9,
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30)
                        )
                      ),
                      child: Column(
                        children: [
                          Container(
                            margin: EdgeInsets.only(top: 20.h),
                            child: Text(
                              "Choose your fitness Reminder",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20.sp,
                                fontWeight: FontWeight.bold
                              ),
                            ),
                          ),
                         const SizedBox(height: 50,),
                         InkWell(
                          onTap: ()async{
                            try{
                              LocalNotifications.showPeriodicNotifications(
                                title: "Bisa Workout Reminder", 
                                body: reminders[random.nextInt(reminders.length)], 
                                payload: "Workout Reminder", 
                                id: 1000, 
                                interval: RepeatInterval.daily
                                );
                             prefs.setString("remindertype", "Daily");
                            remtype = "Daily";
                            
                            setState(() {
                              
                            });
                            ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: const Text("Daily Workout Reminder Activated successfully"),
                                  duration: const Duration(seconds: 3),
                                  backgroundColor: gender == "Male" ?Colors.amber : Colors.pink,
                                )
                        );
                             }catch(e){
                                print(e.toString());
                                ScaffoldMessenger.of(context).showSnackBar(
                               const  SnackBar(
                                  content:  Text("An Error Occurred, Please try again later"),
                                  duration:  Duration(seconds: 3),
                                  backgroundColor: Colors.red,
                                )
                        );

                             }
                            },
                           child: Container(
                            margin: EdgeInsets.symmetric(horizontal: 20.w),
                            padding: EdgeInsets.symmetric(
                              horizontal: 40.w,
                              vertical: 10.h
                              ),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                    color: gender == "Male" ?Colors.amber : Colors.pink,
                                    spreadRadius: 1,
                                    blurRadius: 1,
                                    offset: const Offset(1, 2),
                                  )
                                ]
                              ),
                              child: Text(
                                "Set Daily Reminder",
                                style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 20.sp,
                                      color:  Colors.black,
                                    ),
                                ),
                           ),
                         ),
                         const SizedBox(height: 50,),
                         InkWell(
                          onTap: (){
                             try{
                              LocalNotifications.showPeriodicNotifications(
                                title: "Bisa Workout Reminder", 
                                body: reminders[random.nextInt(reminders.length)], 
                                payload: "Workout Reminder", 
                                id: 2000, 
                                interval: RepeatInterval.weekly
                                );
                             prefs.setString("remindertype", "Weekly");
                            remtype = "Weekly";
                            
                            setState(() {
                              
                            });
                            ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: const Text("Weekly Workout Reminder Activated successfully"),
                                  duration: const Duration(seconds: 3),
                                  backgroundColor: gender == "Male" ?Colors.amber : Colors.pink,
                                )
                        );
                             }catch(e){
                                print(e.toString());
                                ScaffoldMessenger.of(context).showSnackBar(
                               const  SnackBar(
                                  content:  Text("An Error Occurred, Please try again later"),
                                  duration:  Duration(seconds: 3),
                                  backgroundColor: Colors.red,
                                )
                        );

                             }
                          },
                           child: Container(
                            margin: EdgeInsets.symmetric(horizontal: 20.w),
                            padding: EdgeInsets.symmetric(
                              horizontal: 40.w,
                              vertical: 10.h
                              ),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                    color: gender == "Male" ?Colors.amber : Colors.pink,
                                    spreadRadius: 1,
                                    blurRadius: 1,
                                    offset: const Offset(1, 2),
                                  )
                                ]
                              ),
                              child: Text(
                                "Set Weekly Reminder",
                                style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 20.sp,
                                      color:  Colors.black,
                                    ),
                                ),
                           ),
                         ),
                          const SizedBox(height: 50,),
                          Text(
                            "Current Reminder Settings",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20.sp,
                              fontWeight: FontWeight.bold
                            ),
                            ),
                            const SizedBox(height: 20,),
                             Text(
                            remtype ?? "No reminder set yet",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 17.sp,
                            ),
                            ),
                        ],
                      ),
                )
              ],
            ),
          ),
        )
        ),
    );
  }
}