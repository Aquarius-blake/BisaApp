
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DietHome extends StatefulWidget {
  const DietHome({super.key});

  @override
  State<DietHome> createState() => _DietHomeState();
}

class _DietHomeState extends State<DietHome> {
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
        backgroundColor: Color.fromRGBO(23, 30, 60, 1),
        title: Text(
          'Diet & Nutrition',
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'Poppins',
            fontSize: 20.sp,
          ),
          ),
          centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 20
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [],
          )
          ),
      ),
      floatingActionButton: InkWell(
        onTap: (){},
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
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/imgs/dietimage.png")
                      )
                  ),
                  child: Text(""),
                ),
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