

import 'package:bisa_app/animation/PageTransition.dart';
import 'package:bisa_app/services/local_notifications.dart';
import 'package:bisa_app/ui/home/Water_drinking/Set_water_goals.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WaterDash extends StatefulWidget {
  const WaterDash({super.key});

  @override
  State<WaterDash> createState() => _WaterDashState();
}

class _WaterDashState extends State<WaterDash> {
 late  SharedPreferences prefrences;
 String? goal;



  @override
  void initState() {
    initPrefs();  
    super.initState();
   
  }

 Future initPrefs() async{
    prefrences = await SharedPreferences.getInstance();
    goal = prefrences.getString('Watergoal') ?? "0";
    goal = "${goal!} ml/day";
    if(mounted){
      setState(() {
        
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.lightBlueAccent,
      body: Container(
        color: Colors.lightBlueAccent,
        padding: const EdgeInsets.symmetric(
          vertical: 0
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10
                ),
                width: MediaQuery.of(context).size.width,
                height: 100,
                decoration: const BoxDecoration(
                  color: Colors.lightBlueAccent,
                  // borderRadius: BorderRadius.only(
                  //   bottomLeft: Radius.circular(30),
                  //   bottomRight: Radius.circular(30)
                  // )
                ),
                child: Row(
                  children: [
                    GestureDetector(
            onTap: (){
              Navigator.pop(context);
            },
            child: Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Icon(
                            Icons.arrow_back_ios_outlined,
                            color: Colors.white,
                          ),
                        ),
          ),
                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height - 100,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50)
                  )
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 20
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                     const SizedBox(
                        height: 40,
                      ),
                      TextButton(
                        onPressed: (){
                          PageAnimateNoRep(context, PageTransitionType.fade, WaterGoals());
                        },
                        child: const Text(
                          "Set your daily goal",
                          style: TextStyle(
                            color: Colors.lightBlueAccent,
                            fontSize: 20,
                            fontWeight: FontWeight.bold
                            ),
                          ),
                      ),
                     const SizedBox(
                        height: 30,
                        ),
                      Center(
                        child: Column(
                          children: [
                           const Text(
                              "Current Daily Goal",
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 18
                              ),
                              ),
                              SizedBox(
                                height: 10,
                                ),
                                Text(
                            goal ??  "1500ml/day",
                                  style: TextStyle(
                                    fontSize: 38
                                  ),
                                  )
                          ],
                        ),
                      ),
                     const SizedBox(
                        height: 30,
                      ),
                      TextButton(
                        onPressed: (){
                          LocalNotifications.cancelNotification(1).then(
                            (value){
                              ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text("Reminders disabled successfully!"),
                                        duration: Duration(seconds: 3),
                                        backgroundColor: Colors.lightBlueAccent,
                                      )
                                    );
                            }
                            );
                        },
                        child: const Text(
                          "Disable reminders",
                          style: TextStyle(
                            color: Colors.lightBlueAccent,
                            fontSize: 20,
                            fontWeight: FontWeight.bold
                            ),
                          ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: InkWell(
        onTap: (){
          PageAnimateNoRep(context, PageTransitionType.fade, WaterGoals());
        },
        child: Container(
          height: 200,
          width: 200,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/imgs/waterdrop.png'),
              fit: BoxFit.cover
              )
          ),
        ),
      ),
      );
  }
}