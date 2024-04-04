

import 'package:bisa_app/animation/fade_animation.dart';
import 'package:bisa_app/models/current_user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Fitness_fitness extends StatefulWidget {
  final dynamic workoutdata;
  final String workout;
  const Fitness_fitness({super.key,this.workoutdata, required this.workout});

  @override
  State<Fitness_fitness> createState() => _Fitness_fitnessState();
}

class _Fitness_fitnessState extends State<Fitness_fitness> {


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
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios),
          color: Colors.black,
        ),
        centerTitle: true,
        backgroundColor:Colors.transparent 
        ),
      body: Container(
        padding: const EdgeInsets.symmetric(),
        child: Column(
          children: [
            SizedBox(),
            Center(
              child: FadeAnimation(1.2,
                      0,
                      30,  
                      Text(
                        "${widget.workout} Workout",
                        style: TextStyle(
                         fontFamily: 'Poppins',
                         fontSize: 26.sp,
                         color:  Colors.black,
                         ),
                        )
                      ),
            ),
            SizedBox(height: 20.h,),
            Container(
              height: MediaQuery.of(context).size.height * 0.6,
              child: ListView.builder(
                itemBuilder: ( context , index ) => Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 1,
                        blurRadius: 2,
                        offset: const Offset(0, 2), // changes position of shadow
                      ),
                    ],
                    ),
                  child: Row(
                    children: [],
                  ),
                )
                ),
            )
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: InkWell(
        onTap: (){},
        child: Container(
            height: 50,
            width: 200,
            margin: const EdgeInsets.only(bottom: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30),
              boxShadow: [
                BoxShadow(
                  color: gender == "Male" ?Colors.amber : Colors.pink,
                  spreadRadius: 1,
                  blurRadius: 2,
                  offset: const Offset(0, 2), // changes position of shadow
                ),
              ],
            ),
            child:const Center(
              child: Text(
                "Get Started",
                style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.w600,
                fontFamily: 'Poppins',
              ),
              textAlign: TextAlign.center,
              ),
            )
          ),
      ),
    );
  }
}