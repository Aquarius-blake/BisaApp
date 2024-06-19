
import 'package:bisa_app/animation/fade_animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LabTest extends StatefulWidget {
  final String? lab;
   const LabTest({super.key,this.lab});

  @override
  State<LabTest> createState() => _LabTestState();
}

class _LabTestState extends State<LabTest> {


late int Selectedindex ;

 List Tests = [
  "Blood test",
  "Hepatitis b",
  "complete blood count",
  "Some Tests",
  "Some Tests",
  "Some Tests",
  "Some Tests",
  "Some Tests",
  "Some Tests",
  "Some Tests",
 ];

@override
  void initState() {
    initialze();
    super.initState();
  }

  initialze(){
    Selectedindex = Tests.length + 1;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 250, 250, 250),
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
         widget.lab ?? 'Lab',
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
                              "Available Tests",
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
                itemCount: Tests.length,
                padding: const EdgeInsets.only(
                  bottom: 100
                ),
                itemBuilder: (context,index) => InkWell(
                  onTap: (){
                    setState(() {
                      Selectedindex = index;
                    });
                  },
                  child: Container(
                    margin:const EdgeInsets.symmetric(vertical: 10),
                    padding: const EdgeInsets.symmetric(
                      vertical: 20,
                      horizontal: 20
                    ),
                  decoration: BoxDecoration(
                    color: Selectedindex > Tests.length || Selectedindex != index? Colors.white : const Color(0xFFB5E255),
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
                    "${Tests[index]}",
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
      floatingActionButton: InkWell(
            onTap: (){
           
              //  ScaffoldMessenger.of(context).showSnackBar(
              //                  const  SnackBar(
              //                     content:  Text("Cycle saved successfully"),
              //                     duration:  Duration(seconds: 3),
              //                     backgroundColor: Colors.pink,
              //                   )
              //           );
              //   Future.delayed(const Duration(seconds: 3),(){
              //     Navigator.pop(context);
              //   });
            },
            child: Container(
                        height: 40,
                        width: 180,
                        margin: const EdgeInsets.only(
                          top: 10,
                          bottom: 10,
                          left:30
                          ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30),
                          boxShadow: const [
                            BoxShadow(
                              color: Color(0xFFB5E255),
                              spreadRadius: 0.2,
                              blurRadius: 0.5,
                              offset:  Offset(1, 1), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Center(
                          child: Text(
                            "Make Request",
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 17.sp,
                              color:  Colors.black,
                            ),
                          ),
                        ),
                      ),
          ),
    );
  }
}