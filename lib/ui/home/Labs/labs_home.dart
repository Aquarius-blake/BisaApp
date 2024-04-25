
import 'package:bisa_app/animation/PageTransition.dart';
import 'package:bisa_app/ui/home/Labs/lab_tests.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:page_transition/page_transition.dart';

class LabsHome extends StatefulWidget {
  const LabsHome({super.key});

  @override
  State<LabsHome> createState() => _LabsHomeState();
}

class _LabsHomeState extends State<LabsHome> {


List labs = [
   "Lab A",
    "Lab B",
    "Lab C",
    "Lab D",
    "Lab E",
    "Lab F",
    "Lab G",
];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color.fromRGBO(23, 30, 60, 1),
        title: Text(
          'Labs',
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'Poppins',
            fontSize: 20.sp,
          ),
          ),
          centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 20,
          horizontal: 10
        ),
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height*0.8,
              child: ListView.builder(
                itemCount: labs.length,
                itemBuilder: (context,index) => InkWell(
                  onTap: (){
                    PageAnimateNoRep(context, PageTransitionType.rightToLeft,LabTest(lab: labs[index],));
                  },
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    margin: const EdgeInsets.symmetric(
                      vertical: 10
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow:const <BoxShadow>[
                        BoxShadow(
                          color: Colors.grey,
                          spreadRadius: 1,
                          blurRadius: 2,
                          offset:  Offset(2, 1), 
                        )
                      ]
                    ),
                    child: Row(
                      children: [
                        Text(labs[index]),
                      ],
                    ),
                  ),
                )
                ),
            )
          ],
        ),
      ),
    );
  }
}