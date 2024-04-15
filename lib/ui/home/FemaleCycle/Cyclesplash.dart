

import 'package:bisa_app/animation/PageTransition.dart';
import 'package:bisa_app/animation/fade_animation.dart';
import 'package:bisa_app/ui/home/FemaleCycle/Cyclehome.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:page_transition/page_transition.dart';

class CycleSplash extends StatefulWidget {
  const CycleSplash({super.key});

  @override
  State<CycleSplash> createState() => _CycleSplashState();
}

class _CycleSplashState extends State<CycleSplash> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/imgs/cycleim.png"),
              fit: BoxFit.fill
              )
          ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body:Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: FadeAnimation(
                1.2,
                0,
                30,
                Text(
                  "Stay in sync with your body",
                  style: TextStyle(
                     fontFamily: 'Poppins',
                     fontSize: 20.sp,
                     color:  Colors.white,
                     ),
                  )
                   ),
              ),
              InkWell(
                onTap: (){
                  PagetransAnimate(context, PageTransitionType.fade, CycleHome());
                },
                child: Container(
                   height: 50,
                    width: 200,
                    margin: const EdgeInsets.only(
                      top: 50,
                      bottom: 10
                      ),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: [
                        BoxShadow(
                          color:  Colors.pink.withOpacity(0.6),
                          spreadRadius: 1,
                          blurRadius: 2,
                          offset: const Offset(0, 2), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Center(
                      child: Text(
                        "Get Started",
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 20.sp,
                          color:  Colors.black,
                        ),
                      ),
                    ),
                ),
              )
            ],
          ),
        )
      ),
    );
  }
}