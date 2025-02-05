
import 'package:bisa_app/animation/PageTransition.dart';
import 'package:bisa_app/ui/home/Labs/Lab_history.dart';
import 'package:bisa_app/ui/home/Labs/lab_tests.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
          'Labs',
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'Poppins',
            fontSize: 20.sp,
          ),
          ),
          centerTitle: true,
          actions: [
            IconButton(
            onPressed: () => PageAnimateNoRep(context, PageTransitionType.rightToLeft, const Lab_history()), 
            icon: const FaIcon(
              FontAwesomeIcons.list,
              color: Colors.white,
              )
              )
          ],
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 20,
          horizontal: 10
        ),
        child: SingleChildScrollView(
          child: Column(
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
                        child: Text("No Labs Available in your area at the moment."),
                        );
                    }else if(future.hasData){
                        if(future.data == []){
                        return  const Center(
                        child: Text("No Labs Available Yet"),
                        );
                        }else{
                          return Container(
                            padding: const EdgeInsets.only(
                              bottom: 30
                            ),
                          );
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
              //   height: MediaQuery.of(context).size.height*0.8,
              //   child: ListView.builder(
              //     itemCount: labs.length,
              //     itemBuilder: (context,index) => InkWell(
              //       onTap: (){
              //         PageAnimateNoRep(context, PageTransitionType.rightToLeft,LabTest(lab: labs[index],));
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
              //             Text(labs[index]),
              //           ],
              //         ),
              //       ),
              //     )
              //     ),
              // )
            ],
          ),
        ),
      ),
    );
  }
}