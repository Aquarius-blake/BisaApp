

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Pharmahome extends StatefulWidget {
  const Pharmahome({super.key});

  @override
  State<Pharmahome> createState() => _PharmahomeState();
}

class _PharmahomeState extends State<Pharmahome> {

  bool loading = true;
  dynamic pharmresponse;

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
        child: Column(
          children: [],
        ),
      ),
    );
  }
}