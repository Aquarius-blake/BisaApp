

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Lab_history extends StatefulWidget {
  const Lab_history({super.key});

  @override
  State<Lab_history> createState() => _Lab_historyState();
}

class _Lab_historyState extends State<Lab_history> {
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
          'History',
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