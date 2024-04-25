
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LabTest extends StatefulWidget {
  final String? lab;
   const LabTest({super.key,this.lab});

  @override
  State<LabTest> createState() => _LabTestState();
}

class _LabTestState extends State<LabTest> {
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
    );
  }
}