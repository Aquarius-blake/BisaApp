

import 'package:bisa_app/animation/fade_animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:table_calendar/table_calendar.dart';

class CycleResult extends StatefulWidget {
  final DateTime lastperiod;
  final int? period;
  final int? cycle;
  const CycleResult({super.key, required this.lastperiod, this.period, this.cycle});

  @override
  State<CycleResult> createState() => _CycleResultState();
}

class _CycleResultState extends State<CycleResult> {

late final SharedPreferences prefs;
 int? per;
 List safedays = [];

@override
  void initState() {
    per = widget.period!-1;
    initprefs();
    initialize();
    super.initState();
  }

initialize(){
  for (int i = widget.cycle!; i >= widget.cycle!-10;i--){
    safedays.add(widget.lastperiod.add(Duration(days: i)));
  }
}

initprefs()async{
  prefs = await SharedPreferences.getInstance();
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.pink[100],
      appBar: AppBar(
        toolbarHeight: 30,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios_new_outlined),
          ),
      ),
      body: Container(
        padding:const EdgeInsets.symmetric(
          horizontal: 20
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TableCalendar(
                focusedDay: widget.lastperiod.add(Duration(days:widget.cycle!)), 
                firstDay: DateTime(1800), 
                lastDay: widget.lastperiod.add(const Duration(days: 365)),
                rangeStartDay: widget.lastperiod.add(Duration(days:widget.cycle!)),
                rangeEndDay: widget.lastperiod.add(Duration(days: per!+ widget.cycle!)),
                calendarStyle: CalendarStyle(
                  rangeHighlightColor: Colors.pink[200]!,
                  rangeStartDecoration: BoxDecoration(
                    color: Colors.pink[300],
                    shape: BoxShape.circle
                  ),
                  rangeEndDecoration: BoxDecoration(
                    color: Colors.pink[300],
                    shape: BoxShape.circle
                  ),
                  holidayDecoration: BoxDecoration(
                    color: Colors.pink[100],
                    shape: BoxShape.circle
                  ),
                  holidayTextStyle: const TextStyle(
                    color: Colors.white,
                  ),
                  todayDecoration: const BoxDecoration(
                    color: Color(0xFFB5E255),
                    shape: BoxShape.circle
                  )
                ),
                onFormatChanged: (value){},
                holidayPredicate: (value){
                  print(safedays);
                   print(value);
                  if(safedays.contains(value.toLocal())){
                    return true;
                  }else{
                    return false;
                  }
                },
                ),
                const SizedBox(height: 20,),
                FadeAnimation(
                1.2,
                0,
                30,
                Text(
                  "Estimated Next Period Range",
                  style: TextStyle(
                     fontFamily: 'Poppins',
                     fontSize: 20.sp,
                     color:  Colors.pink,
                     ),
                  )
                   ),
                   const SizedBox(height: 40,),
                   FadeAnimation(
                        1.2,
                    0,
                    30,
                     Row(
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
                                      "${DateFormat('dd').format(widget.lastperiod.add(Duration(days:widget.cycle!)))} ",
                                      style: TextStyle(
                                       fontFamily: 'Poppins',
                                       fontWeight: FontWeight.w600,
                                       fontSize: 30.sp,
                                       color:  Colors.white,
                                       ),
                                       textAlign: TextAlign.center,
                                      ),
                                      Text(
                                      " ${DateFormat('MMMM').format(widget.lastperiod.add(Duration(days:widget.cycle!)))}",
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
                                      "${DateFormat('dd').format(widget.lastperiod.add(Duration(days: per!+ widget.cycle!)))} ",
                                      style: TextStyle(
                                       fontFamily: 'Poppins',
                                       fontWeight: FontWeight.w600,
                                       fontSize: 30.sp,
                                       color:  Colors.white,
                                       ),
                                       textAlign: TextAlign.center,
                                      ),
                                      Text(
                                      " ${DateFormat('MMMM').format(widget.lastperiod.add(Duration(days: per!+ widget.cycle!)))}",
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
                     const SizedBox(height: 40,),
                     FadeAnimation(
                1.2,
                0,
                30,
                Text(
                  "Estimated Possible Safe Days Range",
                  style: TextStyle(
                     fontFamily: 'Poppins',
                     fontSize: 20.sp,
                     color:  Colors.pink,
                     ),
                     textAlign: TextAlign.center,
                  )
                   ),
                   const SizedBox(height: 40,),
                   FadeAnimation(
                        1.2,
                    0,
                    30,
                     Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                         children: [ Container(
                             height: 100,
                              width: 100,
                              padding:const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: Colors.pink[200],
                                shape: BoxShape.circle,
                                boxShadow: [
                                   BoxShadow(
                                  color:Colors.pink[100]!,
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
                                      "${DateFormat('dd').format(safedays.reversed.first)} ",
                                      style: TextStyle(
                                       fontFamily: 'Poppins',
                                       fontWeight: FontWeight.w600,
                                       fontSize: 30.sp,
                                       color:  Colors.white,
                                       ),
                                       textAlign: TextAlign.center,
                                      ),
                                      Text(
                                      " ${DateFormat('MMMM').format(safedays.reversed.first)}",
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
                                color: Colors.pink[200],
                                shape: BoxShape.circle,
                                boxShadow: [
                                   BoxShadow(
                                  color:Colors.pink[100]!,
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
                                      "${DateFormat('dd').format(safedays.reversed.toList()[safedays.length-2])} ",
                                      style: TextStyle(
                                       fontFamily: 'Poppins',
                                       fontWeight: FontWeight.w600,
                                       fontSize: 30.sp,
                                       color:  Colors.white,
                                       ),
                                       textAlign: TextAlign.center,
                                      ),
                                      Text(
                                      " ${DateFormat('MMMM').format(safedays.reversed.toList()[safedays.length-2])}",
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
                   SizedBox(height: 100.h,)
            ],
          ),
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InkWell(
            onTap: (){
              prefs.setInt('Lastperiod', widget.lastperiod.microsecondsSinceEpoch);
              prefs.setInt('cycle', widget.cycle!);
              prefs.setInt('bleed', widget.period!);
               ScaffoldMessenger.of(context).showSnackBar(
                               const  SnackBar(
                                  content:  Text("Cycle saved successfully"),
                                  duration:  Duration(seconds: 3),
                                  backgroundColor: Colors.pink,
                                )
                        );
                Future.delayed(const Duration(seconds: 3),(){
                  Navigator.pop(context);
                });
            },
            child: Container(
                        height: 50,
                        width: 200,
                        margin: const EdgeInsets.only(
                          top: 10,
                          bottom: 10,
                          left:30
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
                            "Save",
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