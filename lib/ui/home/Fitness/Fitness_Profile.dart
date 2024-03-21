

import 'package:bisa_app/models/current_user.dart';
import 'package:bisa_app/providers/current_user_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
      child: Scaffold(
        body: Center(
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 5
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 80,),
                  CircleAvatar(
                    backgroundColor: gender == "Male" ?Colors.amber : Colors.pink[200],
                    radius: 50,
                    child: CircleAvatar(
                      backgroundColor: gender == "Male" ?Colors.amber[400] : Colors.pink[100],
                      radius: 40,
                      child: Text(
                        "${currentUser.fname!.substring(0,1)}",
                        style: TextStyle(
                          fontSize: 50
                        ),
                        ),
                    ),
                    ),
                    SizedBox(height: 20,),
                    Text(
                      "${currentUser.fname} ${currentUser.lname}",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    SizedBox(height: 30,),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 30,
                        vertical: 20
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.grey,
                              blurRadius: 5,
                              spreadRadius: 1,
                              offset: Offset(2, 3)
                            )
                          ]
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
                    )
                    ]
                    )
          ),
        ),
      )
      );
  }
}