

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SpecialistHome extends StatefulWidget {
  const SpecialistHome({super.key});

  @override
  State<SpecialistHome> createState() => _SpecialistHomeState();
}

class _SpecialistHomeState extends State<SpecialistHome> {
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
    );
  }
}