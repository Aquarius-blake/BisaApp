

import 'package:bisa_app/animation/PageTransition.dart';
import 'package:bisa_app/ui/home/Pharmacy/Pharmacy_drug.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:page_transition/page_transition.dart';

class Pharmahome extends StatefulWidget {
  const Pharmahome({super.key});

  @override
  State<Pharmahome> createState() => _PharmahomeState();
}

class _PharmahomeState extends State<Pharmahome> {

  bool loading = true;
  dynamic pharmresponse;
  List pharmacies = [
    "Pharma A",
    "Pharma B",
    "Pharma C",
    "Pharma D",
    "Pharma E",
    "Pharma F",
    "Pharma G",
  ];
  @override
  void initState() {
    initialize();
    super.initState();
  }


  initialize()async{
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color.fromRGBO(23, 30, 60, 1),
        title: Text(
          'Pharmacy',
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
          horizontal: 20,
          vertical: 10
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: MediaQuery.of(context).size.height *0.85,
              child: FutureBuilder(
                future: null, 
                builder: (context, future) {
                  if(future.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                      );
                  }else if(!future.hasData){
                    return const Center(
                      child: Text("No Pharmacy Available Yet"),
                      );
                  }else if(future.hasData){
                      if(future.data == []){
                      return  const Center(
                      child: Text("No Pharmacy Available Yet"),
                      );
                      }else{
                        return Container();
                      }
                  }else{
                    return const Center(
                      child: Text("Oops! Something Went Wrong"),
                      );
                  }
                }
                ),
            )
            // Container(
            //   height: MediaQuery.of(context).size.height *0.85,
            //   child: ListView.builder(
            //     itemCount: pharmacies.length,
            //     itemBuilder: (context,index) => InkWell(
            //       onTap: (){
            //         PageAnimateNoRep(context, PageTransitionType.rightToLeft, PharmacyDrugs(pharmacyname:pharmacies[index],));
            //       },
            //       child: Container(
            //         padding: const EdgeInsets.all(20),
            //         margin: const EdgeInsets.symmetric(
            //           vertical: 10
            //         ),
            //         decoration: BoxDecoration(
            //           color: Colors.white,
            //           borderRadius: BorderRadius.circular(10),
            //           boxShadow:const <BoxShadow>[
            //             BoxShadow(
            //               color: Colors.grey,
            //               spreadRadius: 1,
            //               blurRadius: 2,
            //               offset:  Offset(2, 1), 
            //             )
            //           ]
            //         ),
            //         child: Row(
            //           children: [
            //             Text(pharmacies[index]),
            //           ],
            //         ),
            //       ),
            //     )
            //     ),
            // )
          ],
        ),
      ),
    );
  }
}