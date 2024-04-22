
import 'package:bisa_app/animation/fade_animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Babyinput extends StatefulWidget {
  const Babyinput({super.key});

  @override
  State<Babyinput> createState() => _BabyinputState();
}

class _BabyinputState extends State<Babyinput> {

  final TextEditingController _DOB = TextEditingController();
  final TextEditingController _weight = TextEditingController();
  final  TextEditingController _sleep = TextEditingController();  
  DateTime? BDOB;
  late SharedPreferences prefs;

  @override
  void initState() {
    initialize();
    super.initState();
  }

  initialize()async{
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
        padding: EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 10
        ),
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
                                'Kindly tell us about \n your child',
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w600,
                                  fontSize: 22.sp,
                                  color: const Color.fromRGBO(23, 30, 60, 1),
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                      ),
               ),
               const SizedBox(
                height: 30,
                ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10
                ),
                child: TextFormField(
                  controller: _DOB,
                  keyboardType: TextInputType.datetime,
                  decoration: InputDecoration(
                    label: Text(
                      "When was the child born?",
                      ),
                    suffix: IconButton(
                      onPressed: (){
                        showDatePicker(
                          context: context, 
                          firstDate: DateTime(1800), 
                          lastDate: DateTime.now(),
                          builder: (context, child)=>Theme(
                            data: ThemeData(
                            colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFFB5E255),)
                            ), 
                            child: child!
                            )
                          ).then((value) {
                           if(value !=null){
                              BDOB = value;
                              _DOB.text =  DateFormat('dd-MM-yyyy').format(value);
                            }
                          });
                      },
                    icon: const Icon(
                      Icons.calendar_today,
                      color: Colors.black,
                      ),
                      )
                  ),
                )
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                  horizontal: 10
                ),
                margin: const EdgeInsets.only(
                  top: 40
                ),
                  child: TextFormField(
                    controller: _weight,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      label: Text(
                        "How many kilograms does he/she weigh?",
                        )
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                  horizontal: 10
                ),
                margin: const EdgeInsets.only(
                  top: 40
                ),
                  child: TextFormField(
                    controller: _sleep,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      label: Text(
                        "How many hours does he/she sleep?",
                        )
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
      floatingActionButton:  Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InkWell(
            onTap: (){
              if(_DOB.text.isNotEmpty){

              }
            },
            child: Container(
                        height: 50,
                        width: 200,
                        margin: const EdgeInsets.only(
                          top: 10,
                          bottom: 10,
                          left:30
                          ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30),
                          boxShadow: const [
                            BoxShadow(
                              color: Color(0xFFB5E255),
                              spreadRadius: 1,
                              blurRadius: 2,
                              offset:  Offset(0, 2), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Center(
                          child: Text(
                            "Update info",
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 20.sp,
                              color:  Colors.black,
                            ),
                          ),
                        ),
                      ),
          ),
        ],
      ),
    );
  }
}