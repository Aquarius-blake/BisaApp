

import 'package:bisa_app/animation/fade_animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CycleHome extends StatefulWidget {
  const CycleHome({super.key});

  @override
  State<CycleHome> createState() => _CycleHomeState();
}

class _CycleHomeState extends State<CycleHome> {

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
                  horizontal: 10
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
                   SizedBox(height: 20,)
                   
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