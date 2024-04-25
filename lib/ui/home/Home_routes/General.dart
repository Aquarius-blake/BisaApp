
import 'package:bisa_app/animation/PageTransition.dart';
import 'package:bisa_app/animation/fade_animation.dart';
import 'package:bisa_app/ui/home/Water_drinking/Water_home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:page_transition/page_transition.dart';
import 'package:waterfall_flow/waterfall_flow.dart';

class GeneralWellnes extends StatefulWidget {
  const GeneralWellnes({super.key});

  @override
  State<GeneralWellnes> createState() => _GeneralWellnesState();
}

class _GeneralWellnesState extends State<GeneralWellnes> {

   List items = [
    WaterHome()
  ];

  List itemname = [
    "Body Hydration"
  ];

  List itemimage = [
    'assets/imgs/hydration.png',
  ];



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios_new_outlined,
            color: Color.fromRGBO(23, 30, 60, 1),
            ),
          ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 15
        ),
        child: Column(
          children: [
             Center(
                 child: FadeAnimation(
                        1.2,
                        0,
                        30,
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "Mind Your Health",
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 22.sp,
                                color: const Color.fromRGBO(99, 93, 93, 0.98),
                              ),
                              textAlign: TextAlign.center,
                              )
                          ],
                        ),
                      ),
               ),
              const  SizedBox(height: 20,),
              // Container(
              //   height: MediaQuery.of(context).size.height*0.8,
              // )
             FadeAnimation(
                        1.2,
                        0,
                        30,
                         WaterfallFlow.builder(
                      shrinkWrap: true,
                    //  physics: const NeverScrollableScrollPhysics(),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 10,
                      ),
                      gridDelegate: const SliverWaterfallFlowDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 5.0,
                        mainAxisSpacing: 15.0,
                      ),
                      itemCount: items.length,
                      itemBuilder: (BuildContext context, int index) {
                        return InkWell(
                          onTap: (){
                            PageAnimateNoRep(context, PageTransitionType.rightToLeft, items[index]);
                          },
                          child: Container(
                    margin: const EdgeInsets.symmetric(
                      horizontal: 10
                    ),
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                         BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 1,
                          blurRadius: 2,
                          offset: index % 2 == 0? const Offset(2, 3):const Offset(-2, 3), 
                         // offset:  Offset(2, 1), 
                        )
                      ]
                    ),
                    child: Column(
                      children: [
                        Container(
                          height: 80,
                          width: 50,
                          child: Image.asset(itemimage[index]!),
                        ),
                        Text(
                          itemname[index]!,
                          textAlign: TextAlign.center,
                           style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 18.sp,
                                color: const Color.fromRGBO(99, 93, 93, 0.98),
                              ),
                        ),
                      ],
                    ),
                  ),
                        );
                      },
                    ),
              )
          ],
        ),
      ),
    );
  }
}