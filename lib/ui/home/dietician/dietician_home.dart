
import 'package:bisa_app/animation/PageTransition.dart';
import 'package:bisa_app/ui/home/dietician/diet_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:page_transition/page_transition.dart';

class DietHome extends StatefulWidget {
  const DietHome({super.key});

  @override
  State<DietHome> createState() => _DietHomeState();
}

class _DietHomeState extends State<DietHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 230, 229, 229),
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                      "Lose belly fat",
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                      ),
                      SizedBox(height:20.h),
                      Container(
                        height: 140,
                        width: MediaQuery.of(context).size.width*0.9,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 20
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: const DecorationImage(
                            image: AssetImage('assets/imgs/lowcal.png'),
                            fit: BoxFit.cover
                            )
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Low Calorie",
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w500,
                                fontSize: 20,
                                color: Color.fromRGBO(23, 30, 60, 1),
                              ),
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width*0.6,
                                child: const Text(
                                  "Explore our delicious array of satisfying low-calorie options designed to support your health goals without sacrificing taste or enjoyment.",
                                  style: TextStyle(
                                    height: 1.0
                                  ),
                                  ),
                              )
                          ],
                        ),
                      ),
                      SizedBox(height:20.h),
                      Container(
                        height: 140,
                        width: MediaQuery.of(context).size.width*0.9,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 20
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: const DecorationImage(
                            image: AssetImage('assets/imgs/lowfat.png'),
                            fit: BoxFit.cover
                            )
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Low Fat",
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w500,
                                fontSize: 20,
                                color: Color.fromRGBO(23, 30, 60, 1),
                              ),
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width*0.6,
                                child: const Text(
                                  "Explore our delicious array of satisfying low-calorie options designed to support your health goals without sacrificing taste or enjoyment.",
                                  style: TextStyle(
                                    height: 1.0
                                  ),
                                  ),
                              )
                          ],
                        ),
                      ),
                      SizedBox(height:20.h),
                      const Text(
                      "Building Muscle",
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                      ),
                      SizedBox(height:20.h),
                      Container(
                        height: 140,
                        width: MediaQuery.of(context).size.width*0.9,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 20
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: const DecorationImage(
                            image: AssetImage('assets/imgs/highprot.png'),
                            fit: BoxFit.cover
                            )
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "High Protein",
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w500,
                                fontSize: 20,
                                color: Color.fromRGBO(23, 30, 60, 1),
                              ),
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width*0.6,
                                child: const Text(
                                  "Explore our delicious array of satisfying low-calorie options designed to support your health goals without sacrificing taste or enjoyment.",
                                  style: TextStyle(
                                    height: 1.0
                                  ),
                                  ),
                              )
                          ],
                        ),
                      ),
                      SizedBox(height:20.h),
                      Container(
                        height: 140,
                        width: MediaQuery.of(context).size.width*0.9,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 20
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: const DecorationImage(
                            image: AssetImage('assets/imgs/highcal.png'),
                            fit: BoxFit.cover
                            )
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "High Calcium",
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w500,
                                fontSize: 20,
                                color: Color.fromRGBO(23, 30, 60, 1),
                              ),
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width*0.6,
                                child: const Text(
                                  "Explore our delicious array of satisfying low-calorie options designed to support your health goals without sacrificing taste or enjoyment.",
                                  style: TextStyle(
                                    height: 1.0
                                  ),
                                  ),
                              )
                          ],
                        ),
                      ),
                      SizedBox(height:20.h),
            ],
          )
          ),
      ),
      floatingActionButton: InkWell(
        onTap: (){
          PageAnimateNoRep(context, PageTransitionType.fade, DietDetailPage());
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
                SizedBox(width: 10),
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