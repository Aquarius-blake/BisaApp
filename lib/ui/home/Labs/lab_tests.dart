
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
            Container(
              height: MediaQuery.of(context).size.height*0.8,
              child: ListView.builder(
                itemCount: Tests.length,
                itemBuilder: (context,index) => InkWell(
                  onTap: (){},
                  child: Container(
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
                        color: Colors.white,
                      ),
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