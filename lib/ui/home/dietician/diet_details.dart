
import 'package:bisa_app/animation/PageTransition.dart';
import 'package:bisa_app/ui/home/dietician/speak_dietician.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:page_transition/page_transition.dart';

class DietDetailPage extends StatefulWidget {
  final String title;
  final String intro;
  final String description;
  final String category;
  const DietDetailPage({super.key, required this.category ,required this.description, required this.title, required this.intro}) ;

  @override
  State<DietDetailPage> createState() => _DietDetailPageState();
}

class _DietDetailPageState extends State<DietDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 230, 229, 229),
      body: Container(
        padding: EdgeInsetsDirectional.symmetric(
          horizontal: 20.w,
          vertical: 20.h
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 40.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: (){
                      Navigator.of(context).pop();
                    }, 
                  icon: const Icon(
                    Icons.arrow_back_ios_new_outlined,
                    color: Color.fromRGBO(23, 30, 60, 1),
                    )
                    ),
                    Text(
                      widget.category,
                       style:const TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                        color: Color.fromRGBO(23, 30, 60, 1),
                      ),
                      )
                ],
              ),
              SizedBox(height: 20.h,),
              Text(
                "${widget.title} Foods",
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w500,
                  fontSize: 30.sp,
                  color: const Color.fromRGBO(23, 30, 60, 1),
                ),
                ),
                SizedBox(height: 20.h,),
                Text(
                  widget.intro,
                  style: TextStyle(),
                  ),
                  SizedBox(height: 30.h,),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 20,
                      horizontal: 20
                    ),
                    width: MediaQuery.of(context).size.width *0.9,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20)
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.title,
                        style: const TextStyle(
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w400,
                                  fontSize: 20,
                                  color: Color.fromRGBO(23, 30, 60, 1),
                                ),
                                ),
                        SizedBox(height: 15.h,),
                        Text(
                          widget.description,
                          textAlign: TextAlign.justify,
                          style: const TextStyle(
                            fontFamily: 'Poppins',
                            color: Color.fromRGBO(23, 30, 60, 1),
                          ),
                          )
                      ],
                    ),
                  ),
                  SizedBox(height: 20,),
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      child: Text("No Recommendations at the moment")
                      ),
                  )
            ],
          ),
        ),
      ),
       floatingActionButton: InkWell(
        onTap: (){
          PageAnimateNoRep(context,PageTransitionType.rightToLeft, Dieticanspeak() );
        },
        child: Container(
          height: 50,
          margin: EdgeInsets.only(
            left: 30
          ),
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 10,
          ),
          decoration: BoxDecoration(
            color: Color(0xFFB5E255),
            borderRadius: BorderRadius.circular(15)
          ),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 40,
                  width: 30,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/imgs/dietimage.png"),
                      fit: BoxFit.fill
                      )
                  ),
                  child: Text(""),
                ),
                SizedBox(width: 10.w),
                Text(
                  "SPEAK TO A DIETICIAN",
                  style: TextStyle(
                    color: Colors.white
                  ),
                  textAlign: TextAlign.center,
                  ),
              ],
            )
          ),
        )
        ),
    );
  }
}