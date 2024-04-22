
import 'package:bisa_app/animation/fade_animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Babyhome extends StatefulWidget {
  const Babyhome({super.key});

  @override
  State<Babyhome> createState() => _BabyhomeState();
}

class _BabyhomeState extends State<Babyhome> {

late SharedPreferences prefs;

@override
  void initState() {
    initialize();
    super.initState();
  }

Future<void> initialize()async{
  prefs = await SharedPreferences.getInstance();
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: (){},
          icon: Icon(Icons.arrow_back_ios_new_outlined
         ),
         ),
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                 child: FadeAnimation(
                        1.2,
                        0,
                        30,
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'Keep Track of Your Child\'s Health And Well-Being',
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w600,
                                  fontSize: 22.sp,
                                  color: const Color.fromRGBO(99, 93, 93, 0.98),
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                      ),
               ),
            ],
          )
          ),
      ),
    );
  }
}