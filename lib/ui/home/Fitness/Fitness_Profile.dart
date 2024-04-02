

import 'package:bisa_app/animation/PageTransition.dart';
import 'package:bisa_app/models/current_user.dart';
import 'package:bisa_app/providers/current_user_provider.dart';
import 'package:bisa_app/services/local_notifications.dart';
import 'package:bisa_app/ui/home/Fitness/Set_fitness_goals.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FitnessProfile extends StatefulWidget {
  const FitnessProfile({super.key});

  @override
  State<FitnessProfile> createState() => _FitnessProfileState();
}

class _FitnessProfileState extends State<FitnessProfile> {

  late SharedPreferences prefs;
  late CurrentUser currentUser;
  String? gender;


@override
  void initState() {
    initialize();
    super.initState();
  }

initialize()async{
  prefs = await SharedPreferences.getInstance();
  gender = await prefs.getString("gender") ?? "Male";
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
          body: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  color: Colors.transparent,
                  height:250.h,
                ),
                Stack(
                  clipBehavior: Clip.none,
                  children: [
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
                          SizedBox(height: 95.h,),
                          Text(
                        "${currentUser.fname} ${currentUser.lname}",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                      SizedBox(height: 20.h,),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 30,
                          vertical: 10
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white
                          ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                Text(
                                  "0",
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 20.sp,
                                    color:  Colors.black,
                                  ),
                                  ),
                                Text(
                                  "Workouts",
                                   style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 20.sp,
                                    color:  Colors.black,
                                  ),
                                  ),
                              ],
                            ),
                            Column(
                              children: [
                                 Text(
                                  "0",
                                   style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 20.sp,
                                    color:  Colors.black,
                                  ),
                                  ),
                                Text(
                                  "Kcal",
                                   style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 20.sp,
                                    color:  Colors.black,
                                  ),
                                  ),
                              ],
                            ),
                            Column(
                              children: [
                                 Text(
                                  "0",
                                   style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 20.sp,
                                    color:  Colors.black,
                                  ),
                                  ),
                                Text(
                                  "Weight",
                                   style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 20.sp,
                                    color:  Colors.black,
                                  ),
                                  ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 40.h,),
                      InkWell(
                        onTap: (){
                          PageAnimateNoRep(context, PageTransitionType.fade, FitnessGoals());
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 45,
                            vertical: 15
                            ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                            boxShadow:  [
                              BoxShadow(
                                color: gender == "Male" ?Colors.amber : Colors.pink,
                                blurRadius: 1,
                                spreadRadius: 0.5,
                                offset: Offset(2, 3)
                              )
                            ]
                          ),
                          child: Text(
                              "Set Workout Reminder",
                               style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 20.sp,
                                      color:  Colors.black,
                                    ),
                              ),
                        ),
                      ),
                       SizedBox(height: 40.h,),
                      InkWell(
                        onTap: (){
                         try{
                           LocalNotifications.cancelNotification(1000);
                          LocalNotifications.cancelNotification(2000);
                          prefs.remove('remindertype');
                           ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: const Text("Workout Reminder Deactivated successfully"),
                                  duration: const Duration(seconds: 3),
                                  backgroundColor: gender == "Male" ?Colors.amber : Colors.pink,
                                )
                        );
                         }catch(e){
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
                          padding: const EdgeInsets.symmetric(
                            horizontal: 60,
                            vertical: 15
                            ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                            boxShadow:  [
                              BoxShadow(
                                color: gender == "Male" ?Colors.amber : Colors.pink,
                                blurRadius: 1,
                                spreadRadius: 0.5,
                                offset: Offset(2, 3)
                              )
                            ]
                          ),
                          child: Text(
                              "Disable reminders",
                               style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 20.sp,
                                      color:  Colors.black,
                                    ),
                              ),
                        ),
                      ),
                        ],
                      ),
                    ),
                    Positioned(
                      top:-50,
                      //left: 120,
                      left:MediaQuery.of(context).size.width*0.5-60,
                    child: CircleAvatar(
                      backgroundColor: gender == "Male" ?Colors.amber : Colors.pink[200],
                      radius: 60,
                      child: CircleAvatar(
                        backgroundColor: gender == "Male" ?Colors.amber[400] : Colors.pink[100],
                        radius: 50,
                        child: Text(
                          "${currentUser.fname!.substring(0,1)}",
                          style: const TextStyle(
                            fontSize: 50
                          ),
                          ),
                      ),
                      ),
                                        )
                  ],
                )
              ],
            ),
          ),
          // body: Center(
          //   child: Container(
          //     padding: const EdgeInsets.symmetric(
          //       horizontal: 10,
          //       vertical: 5
          //       ),
          //       child: Column(
          //         crossAxisAlignment: CrossAxisAlignment.center,
          //         children: [
          //           const SizedBox(height: 80,),
          //           CircleAvatar(
          //             backgroundColor: gender == "Male" ?Colors.amber : Colors.pink[200],
          //             radius: 50,
          //             child: CircleAvatar(
          //               backgroundColor: gender == "Male" ?Colors.amber[400] : Colors.pink[100],
          //               radius: 40,
          //               child: Text(
          //                 "${currentUser.fname!.substring(0,1)}",
          //                 style: TextStyle(
          //                   fontSize: 50
          //                 ),
          //                 ),
          //             ),
          //             ),
          //             SizedBox(height: 20,),
          //             Text(
          //               "${currentUser.fname} ${currentUser.lname}",
          //               style: TextStyle(
          //                 fontSize: 20,
          //                 fontWeight: FontWeight.bold
          //               ),
          //             ),
          //             SizedBox(height: 30,),
          //             Container(
          //               padding: const EdgeInsets.symmetric(
          //                 horizontal: 30,
          //                 vertical: 20
          //                 ),
          //                 decoration: BoxDecoration(
          //                   borderRadius: BorderRadius.circular(10),
          //                   color: Colors.white,
          //                   boxShadow: const [
          //                     BoxShadow(
          //                       color: Colors.grey,
          //                       blurRadius: 5,
          //                       spreadRadius: 1,
          //                       offset: Offset(2, 3)
          //                     )
          //                   ]
          //                 ),
          //               child: Row(
          //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //                 children: [
          //                   Column(
          //                     children: [
          //                       Text(
          //                         "0",
          //                         style: TextStyle(
          //                           fontFamily: 'Poppins',
          //                           fontSize: 20.sp,
          //                           color:  Colors.black,
          //                         ),
          //                         ),
          //                       Text(
          //                         "Workouts",
          //                          style: TextStyle(
          //                           fontFamily: 'Poppins',
          //                           fontSize: 20.sp,
          //                           color:  Colors.black,
          //                         ),
          //                         ),
          //                     ],
          //                   ),
          //                   Column(
          //                     children: [
          //                        Text(
          //                         "0",
          //                          style: TextStyle(
          //                           fontFamily: 'Poppins',
          //                           fontSize: 20.sp,
          //                           color:  Colors.black,
          //                         ),
          //                         ),
          //                       Text(
          //                         "Kcal",
          //                          style: TextStyle(
          //                           fontFamily: 'Poppins',
          //                           fontSize: 20.sp,
          //                           color:  Colors.black,
          //                         ),
          //                         ),
          //                     ],
          //                   ),
          //                   Column(
          //                     children: [
          //                        Text(
          //                         "0",
          //                          style: TextStyle(
          //                           fontFamily: 'Poppins',
          //                           fontSize: 20.sp,
          //                           color:  Colors.black,
          //                         ),
          //                         ),
          //                       Text(
          //                         "Weight",
          //                          style: TextStyle(
          //                           fontFamily: 'Poppins',
          //                           fontSize: 20.sp,
          //                           color:  Colors.black,
          //                         ),
          //                         ),
          //                     ],
          //                   ),
          //                 ],
          //               ),
          //             ),
          //            const SizedBox(height: 40,),
          //            Container(
          //             margin: EdgeInsets.symmetric(
          //               horizontal: 20
          //               ),
          //             padding: EdgeInsets.symmetric(
          //               horizontal: 15,
          //               vertical: 10
          //               ),
          //               decoration: BoxDecoration(
          //                 borderRadius: BorderRadius.circular(10),
          //                 color: Colors.white,
          //                 boxShadow: const [
          //                   BoxShadow(
          //                     color: Colors.grey,
          //                     blurRadius: 5,
          //                     spreadRadius: 1,
          //                     offset: Offset(2, 3)
          //                   )
          //                 ]
          //               ),
          //               child: ListTile(
          //                 titleAlignment: ListTileTitleAlignment.center,
          //                 contentPadding: EdgeInsets.zero,
          //                 title: Text(
          //                   "Set workout goals",
          //                   style: TextStyle(
          //                     fontFamily: 'Poppins',
          //                     fontSize: 20.sp,
          //                     color:  Colors.black,
          //                   ),
          //                   ),
          //                   trailing: Icon(
          //                     Icons.arrow_forward_ios,
          //                     color: Colors.black,
          //                     size: 20.sp,
          //                     ),
          //                     onTap: (){
          //                       // Navigator.push(context, MaterialPageRoute(builder: (context)=>EditProfile()));
          //                     },
          //               ),
          //            ),const SizedBox(height: 30,),
          //            Container(
          //             margin: EdgeInsets.symmetric(
          //               horizontal: 40
          //               ),
          //             padding: EdgeInsets.symmetric(
          //               horizontal: 15,
          //               vertical: 10
          //               ),
          //               decoration: BoxDecoration(
          //                 borderRadius: BorderRadius.circular(10),
          //                 color: Colors.white,
          //                 boxShadow: const [
          //                   BoxShadow(
          //                     color: Colors.grey,
          //                     blurRadius: 5,
          //                     spreadRadius: 1,
          //                     offset: Offset(2, 3)
          //                   )
          //                 ]
          //               ),
          //               child: ListTile(
          //                 titleAlignment: ListTileTitleAlignment.center,
          //                 contentPadding: EdgeInsets.zero,
          //                 title: Text(
          //                   "Disable Reminders",
          //                   style: TextStyle(
          //                     fontFamily: 'Poppins',
          //                     fontSize: 20.sp,
          //                     color:  Colors.black,
          //                   ),
          //                   ),
          //                   trailing: Icon(
          //                     Icons.arrow_forward_ios,
          //                     color: Colors.black,
          //                     size: 20.sp,
          //                     ),
          //                     onTap: (){
          //                       // Navigator.push(context, MaterialPageRoute(builder: (context)=>EditProfile()));
          //                     },
          //               ),
          //            )
          //             ]
          //             )
          //   ),
          // ),
        ),
      )
      );
  }
}