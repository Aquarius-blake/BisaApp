

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
  int? Cycledays;
  int? periodduration;
  final TextEditingController _CycledaysController = TextEditingController();
   final TextEditingController _periodController = TextEditingController();
  final _scaffoldkey = GlobalKey<ScaffoldState>();
  final _formkey = GlobalKey<FormState>();

  @override
  void initState() {
    initialize();
    super.initState();
  }

  initialize()async{}

  showDialogbox(context){

    return showDialog(
      context: context, 
      builder: (context) => Dialog(
        child: Container(
          height: 500,
          width: MediaQuery.of(context).size.width*0.85,
          padding: EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 10
          ),
          decoration: BoxDecoration(),
          child: Form(
            key: _formkey,
            child: Column(
              children: [
                Align(
                  alignment: Alignment.bottomRight,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      
                      TextButton(
                        onPressed: (){}, 
                        child: Text(
                          "Cancel",
                          style: TextStyle(
                           fontFamily: 'Poppins',
                           fontSize: 14.sp,
                           color:  Colors.grey,
                           ),
                          )
                        ),
                        TextButton(
                        onPressed: (){
                          setState(() {
                            
                          });
                        }, 
                        child: Text(
                          "Continue",
                          style: TextStyle(
                           fontFamily: 'Poppins',
                           fontSize: 14.sp,
                           color:  Colors.pink,
                           ),
                          )
                        ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      )
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldkey,
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
                padding: const  EdgeInsets.symmetric(
                  vertical: 20,
                  horizontal: 20
                ),
                decoration: const BoxDecoration(
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
                   const SizedBox(height: 20,),
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
                   const SizedBox(height: 30,),
                   lastperiod == null? InkWell(
                    onTap: (){
                      showDialogbox(context);
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
                          "When did your last period start?",
                          style: TextStyle(
                           fontFamily: 'Poppins',
                           fontSize: 16.sp,
                           color:  Colors.white,
                           ),
                           textAlign: TextAlign.center,
                          ),
                      ),
                     ),
                   ) : Container(),
                   const SizedBox(height: 60,),
                   Cycledays == null? InkWell(
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
                          "How Long is your Cycle?",
                          style: TextStyle(
                           fontFamily: 'Poppins',
                           fontSize: 16.sp,
                           color:  Colors.white,
                           ),
                           textAlign: TextAlign.center,
                          ),
                      ),
                     ),
                   ) : Container(),
                    const SizedBox(height: 60,),
                   periodduration == null? InkWell(
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
                          "How Long does a period last?",
                          style: TextStyle(
                           fontFamily: 'Poppins',
                           fontSize: 16.sp,
                           color:  Colors.white,
                           ),
                           textAlign: TextAlign.center,
                          ),
                      ),
                     ),
                   ) : Container(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
                      height: 50,
                      width: 200,
                      margin: const EdgeInsets.only(
                        top: 10,
                        bottom: 10
                        ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.pink,
                            spreadRadius: 1,
                            blurRadius: 2,
                            offset: const Offset(0, 2), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Center(
                        child: Text(
                          "Track Period",
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
    );
  }
}