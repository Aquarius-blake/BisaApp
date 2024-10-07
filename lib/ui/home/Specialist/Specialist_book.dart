

import 'package:bisa_app/animation/fade_animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BookSpecialist extends StatefulWidget {
  const BookSpecialist({super.key});

  @override
  State<BookSpecialist> createState() => _BookSpecialistState();
}

class _BookSpecialistState extends State<BookSpecialist> {


  int Selectedindex = 6;
  List  dates = [
    "2025-01-01",
    "2025-04-21",
    "2025-06-12",
    "2025-07-23"
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(23, 30, 60, 1),
        centerTitle: true,
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context); 
          }, 
          icon: const Icon(
            Icons.arrow_back_ios_new_outlined,
            color: Colors.white,
            )
          ),
        title: Text(
          'Specialist',
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'Poppins',
            fontSize: 20.sp,
          ),
          ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(
           vertical: 20,
           horizontal: 10
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
                              "Available Dates",
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
            Container(
              height: MediaQuery.of(context).size.height*0.8,
              child: ListView.builder(
                itemCount: dates.length,
                itemBuilder: (context,index) => InkWell(
                  onTap: (){
                    setState(() {
                      Selectedindex = index;
                    });
                  },
                  child: Container(
                    margin:const EdgeInsets.symmetric(vertical: 20),
                    padding: const EdgeInsets.symmetric(
                      vertical: 20,
                      horizontal: 20
                    ),
                  decoration: BoxDecoration(
                    color: Selectedindex > dates.length || Selectedindex != index? Colors.white : const Color(0xFFB5E255),
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                          color: const Color(0xFFB5E255).withOpacity(0.4),
                          spreadRadius: 1,
                          blurRadius: 2,
                          offset:  const Offset(1, 2)
                         // offset:  Offset(2, 1), 
                        )
                    ]
                  ),
                  child: Text(
                    "${dates[index]}",
                     style: const TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                        color: Colors.black,
                      ),
                    ),
                  ),
                )
                ),
            )
          ],
        ),
      ),
      floatingActionButton:  Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InkWell(
            onTap: (){
           
               ScaffoldMessenger.of(context).showSnackBar(
                               const  SnackBar(
                                  content:  Text("Session successfully booked"),
                                  duration:  Duration(seconds: 3),
                                  backgroundColor: Color(0xFFB5E255),
                                )
                        );
              //   Future.delayed(const Duration(seconds: 3),(){
              //     Navigator.pop(context);
              //   });
            },
            child: Container(
                        height: 50,
                        // width: 250,
                        margin: const EdgeInsets.only(
                          top: 10,
                          bottom: 10,
                          left:30
                          ),
                          padding: EdgeInsets.symmetric(
                            horizontal: 25,
                            vertical: 5
                          ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30),
                          boxShadow: const [
                            BoxShadow(
                              color: Color(0xFFB5E255),
                              spreadRadius: 1,
                              blurRadius: 2,
                              offset:  Offset(0, 2), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Center(
                          child: Text(
                            "Book Appointment",
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 16.sp,
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