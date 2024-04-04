

import 'package:bisa_app/models/current_user.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Fitness_fitness extends StatefulWidget {
  final dynamic workoutdata;
  const Fitness_fitness({super.key,this.workoutdata});

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