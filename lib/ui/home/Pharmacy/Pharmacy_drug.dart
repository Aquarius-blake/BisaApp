


import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PharmacyDrugs extends StatefulWidget {
  final String? pharmacyname;
  const PharmacyDrugs({super.key, this.pharmacyname});

  @override
  State<PharmacyDrugs> createState() => _PharmacyDrugsState();
}

class _PharmacyDrugsState extends State<PharmacyDrugs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(23, 30, 60, 1),
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
    );
  }
}