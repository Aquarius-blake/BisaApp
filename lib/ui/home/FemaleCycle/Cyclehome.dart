

import 'package:bisa_app/animation/fade_animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CycleHome extends StatefulWidget {
  const CycleHome({super.key});

  @override
  State<CycleHome> createState() => _CycleHomeState();
}

class _CycleHomeState extends State<CycleHome> {

  int? Datefomprefs;
  DateTime? lastperiod;

  @override
  void initState() {
    initialize();
    super.initState();
  }

  initialize()async{}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[100],
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 150,
              ),
              Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.symmetric(
                  vertical: 20,
                  horizontal: 20
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(40),
                    topLeft: Radius.circular(40)
                  )
                ),
                child: Column(
                  children: [
                    FadeAnimation(
                1.2,
                0,
                30,
                Text(
                  "Track your cycle",
                  style: TextStyle(
                     fontFamily: 'Poppins',
                     fontSize: 20.sp,
                     color:  Colors.pink,
                     ),
                  )
                   ),
                   SizedBox(height: 20,),
                   Align(
                    alignment: Alignment.centerLeft,
                     child: Text(
                      "Your Last Cycle",
                       style: TextStyle(
                       fontFamily: 'Poppins',
                       fontSize: 16.sp,
                       color:  Colors.pink,
                       ),
                       textAlign: TextAlign.left,
                      ),
                   ),
                   SizedBox(height: 30,),
                   lastperiod == null? InkWell(
                    onTap: (){
                      //showDatePicker(context: context, firstDate: firstDate, lastDate: lastDate)
                    },
                     child: Container(
                      height: 150,
                      width: 150,
                      padding:const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.pink[300],
                        shape: BoxShape.circle,
                        boxShadow: [
                           BoxShadow(
                          color:Colors.pink[200]!,
                          spreadRadius: 9,
                          blurRadius: 10,
                          offset: const Offset(0, 0), // changes position of shadow
                        ),
                        ]
                      ),
                      child: Center(
                        child: Text(
                          "When was your\n last period?",
                          style: TextStyle(
                           fontFamily: 'Poppins',
                           fontSize: 16.sp,
                           color:  Colors.white,
                           ),
                           textAlign: TextAlign.center,
                          ),
                      ),
                     ),
                   ) : Container()
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}