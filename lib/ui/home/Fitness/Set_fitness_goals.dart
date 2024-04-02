

import 'package:bisa_app/models/current_user.dart';
import 'package:bisa_app/providers/current_user_provider.dart';
import 'package:flutter/material.dart';
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
            title: Text(
              "Set Fitness Goals",
               style: TextStyle(
                color: Colors.white,
              fontSize: 20.sp,
              fontWeight: FontWeight.bold
            ),),
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
                        children: [],
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