

import 'package:bisa_app/animation/PageTransition.dart';
import 'package:bisa_app/ui/home/Specialist/Specialist_book.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:page_transition/page_transition.dart';

class SpecialistHome extends StatefulWidget {
  const SpecialistHome({super.key});

  @override
  State<SpecialistHome> createState() => _SpecialistHomeState();
}

class _SpecialistHomeState extends State<SpecialistHome> {

  List Specialist = [
    'Specialist A',
    'Specialist B',
    'Specialist C',
    'Specialist D',
    'Specialist E',
    'Specialist F'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new_outlined,
            color: Colors.white,
            ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: const Color.fromRGBO(23, 30, 60, 1),
        title: Text(
          'Specialists',
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'Poppins',
            fontSize: 20.sp,
          ),
          ),
          centerTitle: true,
      ),
      body:  Container(
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
                        child: Text("No Specialist Available at the moment"),
                        );
                    }else if(future.hasData){
                        if(future.data == []){
                        return  const Center(
                        child: Text("No Specialist Available Yet"),
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
              //     itemCount: Specialist.length,
              //     itemBuilder: (context,index) => InkWell(
              //       onTap: (){
              //         PageAnimateNoRep(context, PageTransitionType.rightToLeft,BookSpecialist());
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
              //             Text(Specialist[index]),
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