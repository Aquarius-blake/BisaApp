

import 'package:bisa_app/animation/PageTransition.dart';
import 'package:bisa_app/animation/fade_animation.dart';
import 'package:bisa_app/ui/home/FemaleCycle/CycleResult.dart';
import 'package:bisa_app/utils/validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
  int? per;
  final TextEditingController _controller = TextEditingController();
  final TextEditingController _CycledaysController = TextEditingController();
   final TextEditingController _periodController = TextEditingController();
  final _scaffoldkey = GlobalKey<ScaffoldState>();
  final _formkey = GlobalKey<FormState>();
  late final SharedPreferences prefs;

  @override
  void initState() {
    initialize();
    super.initState();
  }

  initialize()async{
    prefs = await SharedPreferences.getInstance();
    Datefomprefs =  prefs.getInt('Lastperiod');
    Cycledays =  prefs.getInt('cycle');
    periodduration =  prefs.getInt('bleed');
    if(periodduration!=null){
      per = periodduration!-1;
    }
    if(Datefomprefs!=null){
      lastperiod = DateTime.fromMicrosecondsSinceEpoch(Datefomprefs!);
    }
    if(mounted){
      setState(() {
        
      });
    }
  }

  showDialogbox(context){

    return showDialog(
      context: context, 
      builder: (context) => Dialog(
        child: Container(
          height: 500,
          width: MediaQuery.of(context).size.width*0.85,
          padding: EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 20
          ),
          decoration: BoxDecoration(),
          child: Form(
            key: _formkey,
            child: Column(
              children: [
                const SizedBox(height: 20,),
                TextFormField(
                  controller: _controller,
                  style: const TextStyle(
                            fontSize: 12,
                            height: 0.1
                          ),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.transparent,
                    label: const Text("Choose last period Start Date"),
                    hintText: "Choose a date",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)
                    ),
                    suffix: IconButton(
                      onPressed: (){
                        showDatePicker(
                          context: context, 
                          firstDate: DateTime(1800), 
                          lastDate: DateTime.now(),
                          builder: (context, child)=>Theme(
                            data: ThemeData(
                            colorScheme: ColorScheme.fromSeed(seedColor: Colors.pink)
                            ), 
                            child: child!
                            )
                          ).then((value) {
                            lastperiod = value;
                            if(lastperiod !=null){
                              _controller.text =  DateFormat('dd-MM-yyyy').format(lastperiod!);
                            }
                          });
                      }, 
                      icon: const Icon(
                        Icons.calendar_today_outlined,
                        color: Colors.pink,
                        )
                      )
                  ),
                ),
                const SizedBox(height: 30,),
                TextFormField(
                  controller: _CycledaysController,
                  validator: (value) => Validator.textValidator(value),
                  style: const TextStyle(
                            fontSize: 12,
                            height: 0.9
                          ),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.transparent,
                    label: Text("Cycle duration in days"),
                    hintText: "Enter the number of days in your cycle",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)
                    ),
                  ),
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 30,),
                TextFormField(
                  controller: _periodController,
                  validator: (value) => Validator.textValidator(value),
                  style: const TextStyle(
                            fontSize: 12,
                            height: 0.9
                          ),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.transparent,
                    label: Text("Period Duration in days"),
                    hintText: "Enter a number of days",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)
                    ),
                  ),
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 30,),
                Expanded(child: SizedBox()),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: (){
                          Navigator.pop(context);
                        }, 
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
                         if(_formkey.currentState!.validate()){
                           setState(() {
                            periodduration = int.parse(_periodController.text);
                            Cycledays = int.parse(_CycledaysController.text);
                            per = periodduration!-1;
                          });
                          Navigator.pop(context);
                         }
                           
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
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        toolbarHeight: 30,
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios_new_outlined,
            color: Colors.white,
            ),
          ),
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 100,
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
                      "Your Last Cycle Tracked",
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
                   ) : InkWell(
                    onTap: (){
                      showDialogbox(context);
                    },
                     child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                       children: [ Container(
                           height: 100,
                            width: 100,
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
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "${DateFormat('dd').format(lastperiod!)} ",
                                    style: TextStyle(
                                     fontFamily: 'Poppins',
                                     fontWeight: FontWeight.w600,
                                     fontSize: 30.sp,
                                     color:  Colors.white,
                                     ),
                                     textAlign: TextAlign.center,
                                    ),
                                    Text(
                                    " ${DateFormat('MMMM').format(lastperiod!.add(Duration(days:periodduration ?? 0 )))}",
                                    style: TextStyle(
                                     fontFamily: 'Poppins',
                                     fontSize: 10.sp,
                                     color:  Colors.white,
                                     ),
                                     textAlign: TextAlign.center,
                                    ),
                                ],
                              ),
                            ),
                         ),
                         Container(
                           height: 100,
                            width: 100,
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
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "${DateFormat('dd').format(lastperiod!.add(Duration(days:per ?? 0 )))} ",
                                    style: TextStyle(
                                     fontFamily: 'Poppins',
                                     fontWeight: FontWeight.w600,
                                     fontSize: 30.sp,
                                     color:  Colors.white,
                                     ),
                                     textAlign: TextAlign.center,
                                    ),
                                    Text(
                                    " ${DateFormat('MMMM').format(lastperiod!.add(Duration(days:per ?? 0 )))}",
                                    style: TextStyle(
                                     fontFamily: 'Poppins',
                                     fontSize: 10.sp,
                                     color:  Colors.white,
                                     ),
                                     textAlign: TextAlign.center,
                                    ),
                                ],
                              ),
                            ),
                         ),
                       ],
                     ),
                   ),
                   const SizedBox(height: 60,),
                   Cycledays == null? InkWell(
                    onTap: (){
                      //showDatePicker(context: context, firstDate: firstDate, lastDate: lastDate)
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
                   ) : InkWell(
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
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "$Cycledays",
                                style: TextStyle(
                                 fontFamily: 'Poppins',
                                 fontWeight: FontWeight.w600,
                                 fontSize: 40.sp,
                                 color:  Colors.white,
                                 ),
                                 textAlign: TextAlign.center,
                                ),
                                Text(
                                " Days",
                                style: TextStyle(
                                 fontFamily: 'Poppins',
                                 fontSize: 20.sp,
                                 color:  Colors.white,
                                 ),
                                 textAlign: TextAlign.center,
                                ),
                            ],
                          ),
                        ),
                    )
                    ),
                    const SizedBox(height: 60,),
                   periodduration == null? InkWell(
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
                   ) : InkWell(
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
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "$periodduration ",
                                style: TextStyle(
                                 fontFamily: 'Poppins',
                                 fontWeight: FontWeight.w600,
                                 fontSize: 40.sp,
                                 color:  Colors.white,
                                 ),
                                 textAlign: TextAlign.center,
                                ),
                                Text(
                                " Days",
                                style: TextStyle(
                                 fontFamily: 'Poppins',
                                 fontSize: 20.sp,
                                 color:  Colors.white,
                                 ),
                                 textAlign: TextAlign.center,
                                ),
                            ],
                          ),
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
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InkWell(
            onTap: (){
              if(lastperiod!=null || Cycledays!=null || periodduration!=null) {
                PageAnimateNoRep(context, PageTransitionType.fade, CycleResult(lastperiod: lastperiod!,cycle: Cycledays, period: periodduration,));
              }else{
                 ScaffoldMessenger.of(context).showSnackBar(
                               const  SnackBar(
                                  content:  Text("Please answer all questions before continuing"),
                                  duration:  Duration(seconds: 3),
                                  backgroundColor: Colors.red,
                                )
                        );
              }
            },
            child: Container(
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
          ),
        ],
      ),
    );
  }
}