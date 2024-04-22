


import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PharmacyDrugs extends StatefulWidget {
  final String? pharmacyname;
  const PharmacyDrugs({super.key, this.pharmacyname});

  @override
  State<PharmacyDrugs> createState() => _PharmacyDrugsState();
}

class _PharmacyDrugsState extends State<PharmacyDrugs> {

  List drugs = [];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(23, 30, 60, 1),
        leading: IconButton(
          onPressed: (){}, 
          icon: const Icon(
            Icons.arrow_back_ios_new_outlined,
            color: Colors.white,
            )
          ),
        title: Text(
         widget.pharmacyname ?? 'Pharmacy',
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'Poppins',
            fontSize: 20.sp,
          ),
          ),
          centerTitle: true,
      ),
      body: Container(
        child: Column(
          children: [],
        ),
      ),
      floatingActionButton:  Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InkWell(
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
                            "Checkout",
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