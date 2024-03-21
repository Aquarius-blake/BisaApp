
import 'dart:math';

import 'package:bisa_app/animation/fade_animation.dart';
import 'package:bisa_app/services/local_notifications.dart';
import 'package:bisa_app/ui/home/Water_drinking/Water_quantity_card.dart';
import 'package:bisa_app/utils/validator.dart';
import 'package:cron/cron.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_bubble/chat_bubble.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:waterfall_flow/waterfall_flow.dart';

class WaterGoals extends StatefulWidget {
  const WaterGoals({super.key});

  @override
  State<WaterGoals> createState() => _WaterGoalsState();
}

class _WaterGoalsState extends State<WaterGoals> {

final _formkey = GlobalKey<FormState>();
TextEditingController _goalController = TextEditingController();
final goalfocusNode = FocusNode();
final cron = Cron();
 int Selectedindex = 6;
 String? dailygoal;
 Random random = Random();
 List<String> ids = [];
 List<String> reminders = [
  "Drink water now",
  "Time to drink water",
  "Hydrate yourself",
  "Drink water",
  "Water time",
  "Stay hydrated"

 ];
 late SharedPreferences prefs;
List images = [
  'assets/imgs/cup.png',
  'assets/imgs/glass1.png',
  'assets/imgs/mug.png',
  'assets/imgs/bottle1.png',
  'assets/imgs/bottle2.png',
  'assets/imgs/jar.png'
  ];

  @override
  void initState() {
    _initPrefs();
    super.initState();
  }

Future <void> _initPrefs() async{
  prefs = await SharedPreferences.getInstance();
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      body: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 10
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
                child:  Row(
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
                padding: const EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 10
                ),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height - 100,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50)
                  )
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                   const SizedBox(
                      height: 20,
                    ),
                   const Center(
                      child: Text(
                        "Set Water Goals",
                        style: TextStyle(
                          color: Colors.lightBlueAccent,
                          fontSize: 30,
                          fontWeight: FontWeight.bold
                          )
                        ),
                    ),
                  const  SizedBox(
                      height: 20,
                    ),
                    Center(
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: Form(
                          key: _formkey,
                          // child: CustomTextField(
                          //   isEnabled: true,
                          //   fieldController: _goalController, 
                          //   fieldValidator: Validator.textValidator, 
                          //   currentFocus: goalfocusNode, 
                          //   fieldHintText: "Set your daily goal", 
                          //   fieldTextInputAction: TextInputAction.done
                          //   ),
                          child: TextFormField(
                            controller: _goalController,
                              validator:(text) => Validator.textValidator(text),
                              keyboardType: TextInputType.number,
                                decoration:  InputDecoration(
                                  filled: true,
                                  fillColor: Color.fromRGBO(255, 255, 255, 1),
                                  labelText: 'Set your daily goal',
                                  hintText: 'Enter your goal in ml',
                                   border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10)
                                )
                            ),
                          )
                          ),
                      ),
                    ),
                   const SizedBox(
                      height: 40,
                    ),
                  const  Text(
                      "Choose your water container size:",
                      style: TextStyle(
                        color: Colors.lightBlueAccent,
                        fontSize: 17,
                        fontWeight: FontWeight.bold
                        ),
                        textAlign: TextAlign.start,
                      ),
                    const SizedBox(
                      height: 20,
                    ),
                    WaterfallFlow.builder(
      shrinkWrap: true,
    //  physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 10,
      ),
      gridDelegate: const SliverWaterfallFlowDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 15.0,
        mainAxisSpacing: 55.0,
      ),
      itemCount: 6,
      itemBuilder: (BuildContext context, int index) {
        return InkWell(
          onTap: (){
            setState(() {
              Selectedindex = index;
            });
          },
          child: Container(
            decoration: BoxDecoration(
              boxShadow: Selectedindex == index? [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 7,
                  offset: const Offset(0, 3), // changes position of shadow
                ),
              ]:null,
            ),
            child: WaterQuantity(
              image: images[index],
              quantity: (index + 1) * 100,
            ),
          ),
        );
      },
    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: InkWell(
        onTap: (){

          if(_formkey.currentState!.validate()){
            if(Selectedindex < 6){
              var Noiterations = int.parse(_goalController.text)/((Selectedindex + 1) * 100);
              dailygoal = _goalController.text;
              if(Noiterations.runtimeType == double){
               var iterations = Noiterations.round();

               if(iterations == 0){
                iterations++;
               }

               for( int i = 1 ; i <= iterations ; i++ ){
                //Schedule the notifications here
                var interval1 = (16*60)/iterations;
               var duration = interval1*i;
               ids.add(i.toString());
                print(duration);


              // Schedule a task that will run every 1 day
                  cron.schedule(Schedule(minutes: duration.round()), () async {
                    // Schedule a notification right now
                    LocalNotifications.showSimpleNotification(
                      id: i,
                      title: "Bisa Hydration Reminder",
                      body: reminders[random.nextInt(reminders.length)], 
                      payload: "Water Reminder",);
                      //Schedules a notification 24hr later
                    LocalNotifications.showPeriodicNotifications(
                      title: "Bisa Hydration Reminder", 
                      body: reminders[random.nextInt(reminders.length)], 
                      payload: "Water Reminder", 
                      id: i, 
                      interval: RepeatInterval.daily);
                      // LocalNotifications.showScheduledNotification(
                      //     title: "Bisa Hydration Reminder", 
                      //     body: reminders[random.nextInt(reminders.length)], 
                      //     payload: "Water Reminder", 
                      //     id: i, 
                      //     interval: duration.round()
                      //     );
                  });

              

               }

              }else if(Noiterations.runtimeType == int){
                 for( int i = 1 ; i <= Noiterations ; i++ ){
                //Schedule the notifications here
                 var interval1 = (16*60)/Noiterations;
               var duration = interval1*i;
               ids.add(i.toString());
                print(duration);

               // Schedule a task that will run every 1 day
                  cron.schedule(Schedule(minutes: duration.round()), () async {
                    // Schedule a notification right now
                    LocalNotifications.showSimpleNotification(
                      id: i,
                      title: "Bisa Hydration Reminder",
                      body: reminders[random.nextInt(reminders.length)], 
                      payload: "Water Reminder",);
                       //Schedules a notification 24hr later
                    LocalNotifications.showPeriodicNotifications(
                      title: "Bisa Hydration Reminder", 
                      body: reminders[random.nextInt(reminders.length)], 
                      payload: "Water Reminder", 
                      id: i, 
                      interval: RepeatInterval.daily);
                      // LocalNotifications.showScheduledNotification(
                      //     title: "Bisa Hydration Reminder", 
                      //     body: reminders[random.nextInt(reminders.length)], 
                      //     payload: "Water Reminder", 
                      //     id: i, 
                      //     interval: duration.round()
                      //     );
                  });

               }
              }else{
                //Error message
                print(Noiterations.runtimeType);
              }
            }else{
               ScaffoldMessenger.of(context).showSnackBar(
                   const SnackBar(
                      content: Text("Please choose your water container size"),
                      duration: Duration(seconds: 3),
                      backgroundColor: Colors.redAccent,
                    )
                  );
            }
            prefs.setStringList("Water", ids);
            prefs.setString('Watergoal', dailygoal!);
            ScaffoldMessenger.of(context).showSnackBar(
                        const  SnackBar(
                            content: Text("Hydration goal set successfully"),
                            duration: Duration(seconds: 3),
                            backgroundColor: Colors.lightBlueAccent,
                          )
                        );
        //    Navigator.pop(context);
          }

         // LocalNotifications.showSimpleNotification(title: "Bisa test", body: "testing", payload: "Bisa Test");
        // LocalNotifications.showPeriodicNotifications(title: "Hydration test", body: "Test Message", payload: "DATA", id: 1, interval: RepeatInterval.everyMinute);
        // ScaffoldMessenger.of(context).showSnackBar(
        //   SnackBar(
        //     content: Text("Water goal set successfully"),
        //     duration: Duration(seconds: 3),
        //     backgroundColor: Colors.lightBlueAccent,
        //   )
        // );
        },
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              height: 170,
              width: 170,
              decoration:const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/imgs/waterdrop.png'),
                  fit: BoxFit.cover
                  )
              ),
            ),
             Positioned(
              top: 6,
              left: -20,
              child: _goalController.text.isNotEmpty && Selectedindex < 6 ? FadeAnimation(
                      1.2,
                        0,
                        30,
                 ChatBubble(
                  backGroundColor: Colors.lightBlueAccent,
                  clipper: ChatBubbleClipper9(type: BubbleType.sendBubble),
                  child: Text(
                    "Tap on me",
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.bold
                      )
                    ),
                ),
              ):Container()
            )
          ],
        ),
      ),
    );
  }
}