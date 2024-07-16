
import 'package:bisa_app/animation/PageTransition.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:just_audio/just_audio.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:timer_count_down/timer_controller.dart';
import 'package:timer_count_down/timer_count_down.dart';

class WorkoutPage extends StatefulWidget {
  final dynamic workoutdatalist;
  final dynamic workoutdata;
  final int index;
  const WorkoutPage({super.key, this.workoutdata ,this.workoutdatalist,required this.index});

  @override
  State<WorkoutPage> createState() => _WorkoutPageState();
}

class _WorkoutPageState extends State<WorkoutPage> {
  final _player1 = AudioPlayer();
  final _player2 = AudioPlayer();
  final _player3 = AudioPlayer();
  final _player4 = AudioPlayer();
  final CountdownController _controller = CountdownController();
  int currentset = 1;
  late int timer;
  late SharedPreferences prefs;
  late int currentKcal;
  late int workouts;


  @override
  void initState() {
    initialize();
    _setupAudioPlayers();
    timer = widget.workoutdata['reptimer'];
    _controller.start();
    super.initState();
  }


  initialize()async{
    prefs = await SharedPreferences.getInstance();
    currentKcal = prefs.getInt('Kcal') ?? 0;
    workouts = prefs.getInt('Workouts') ?? 0;
  }

  Future<void> _setupAudioPlayers()async{
    _player1.playbackEventStream.listen((event) { },
    onError: (Object e, StackTrace stacktrace){
      print("A Stream error occured: ${e.toString()}");
    }
  );
  _player2.playbackEventStream.listen((event) { },
    onError: (Object e, StackTrace stacktrace){
      print("A Stream error occured: ${e.toString()}");
    }
  );
    _player3.playbackEventStream.listen((event) { },
      onError: (Object e, StackTrace stacktrace){
        print("A Stream error occured: ${e.toString()}");
      }
    );
     _player4.playbackEventStream.listen((event) { },
      onError: (Object e, StackTrace stacktrace){
        print("A Stream error occured: ${e.toString()}");
      }
    );
  try{
    _player1.setAudioSource(AudioSource.asset('assets/workout/nextset.mp3'));
     _player2.setAudioSource(AudioSource.asset('assets/workout/break.wav'));
     _player3.setAudioSource(AudioSource.asset('assets/workout/good.wav'));
      _player4.setAudioSource(AudioSource.asset('assets/workout/congrats1.wav'));
  }catch(e){
     print("Error Loading audio source: ${e.toString()}"); 
  }
  }


  @override
  void dispose() {
    _player1.dispose();
    _player2.dispose();
    _player3.dispose();
    _player4.dispose();
    
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
   Future.delayed(Duration(seconds: 3),(){
     _controller.start();
   });
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_outlined),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 25,
          vertical: 10,
        ),
        child: SingleChildScrollView(
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.workoutdata['name'],
                    style: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    widget.workoutdata['description'],
                    style: const TextStyle(
                      fontSize: 18,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10.h,),
              Container(
                child: Image.asset(
                  widget.workoutdata['gif'],
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height:  20.h,),
              Countdown(
                seconds: timer, 
                controller: _controller,
                onFinished: (){
                  workouts++;
                  currentKcal = currentKcal + widget.workoutdata['Kcal'] as int;
                  print(currentKcal);
                  prefs.setInt('Kcal',  currentKcal);
                  prefs.setInt('Workouts', workouts);
                if(currentset == 0){
                    if(widget.index == widget.workoutdatalist.length-1){
                     
                       _player4.play();
                    Future.delayed(const Duration(seconds: 7),(){
                      Navigator.pop(context);
                    });
                    }else{
                        _player3.play();
                    Future.delayed(const Duration(seconds: 7),(){
                      PagetransAnimate(context, PageTransitionType.fade, WorkoutPage(index: widget.index+1, workoutdatalist: widget.workoutdatalist, workoutdata: widget.workoutdatalist[widget.index+1]));
                    });
                      
                    }
                  }else if(currentset < widget.workoutdata['sets']){
                    currentset++;
                    setState(() {
                      timer = widget.workoutdata['reptimer'];
                    });
                    _controller.restart();
                    _controller.pause();
                    _player1.play();
                    Future.delayed(Duration(seconds: 10),(){
                      _player1.stop();
                      _player1.seek(Duration.zero);
                    });
                  }else{
                   
                    setState(() {
                      timer = widget.workoutdata['breaktimer'];
                       currentset = 0; 
                    });
                    _controller.restart();
                    _controller.pause();
                    _player2.play();
                    Future.delayed(Duration(seconds: 10),(){
                      _player2.stop();
                      _player2.seek(Duration.zero);
                    });
                  }
                },
                build: (BuildContext context,double time) => Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Set: ',
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        currentset.toString(),
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Next Set in: ',
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "${time}s",
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                )
                )
              // Row(
              //   crossAxisAlignment: CrossAxisAlignment.start,
              //   children: [
              //     Column(
              //       children: [
              //         Container(
              //           padding: const EdgeInsets.all(15),
              //           decoration: BoxDecoration(
              //             shape: BoxShape.circle,
              //             color: Color(0xFFB5E255),
              //           ),
              //           child: Icon(
              //             Icons.play_arrow,
              //             color: Colors.white,
              //           ),
              //         ),
              //         const SizedBox(height: 10),
              //         Text(
              //           'Start Workout',
              //           style: const TextStyle(
              //             fontSize: 20,
              //             fontWeight: FontWeight.bold,
              //           ),
              //         ),
              //       ],
              //     ),
              //      Column(
              //   children: [
              //     Container(
              //       padding: const EdgeInsets.all(15),
              //       decoration: BoxDecoration(
              //         shape: BoxShape.circle,
              //         color: Color(0xFFB5E255),
              //       ),
              //       child: Icon(
              //         Icons.pause,
              //         color: Colors.white,
              //       ),
              //     ),
              //     const SizedBox(height: 10),
              //     Text(
              //       'Pause Workout',
              //       style: const TextStyle(
              //         fontSize: 20,
              //         fontWeight: FontWeight.bold,
              //       ),
              //     ),
              //   ],
              // ),
              // Column(
              //   children: [
              //     Container(
              //       padding: const EdgeInsets.all(15),
              //       decoration: BoxDecoration(
              //         shape: BoxShape.circle,
              //         color: Color(0xFFB5E255),
              //       ),
              //       child: Icon(
              //         Icons.stop,
              //         color: Colors.white,
              //       ),
              //     ),
              //     const SizedBox(height: 10),
              //     Text(
              //       'Stop Workout',
              //       style: const TextStyle(
              //         fontSize: 20,
              //         fontWeight: FontWeight.bold,
              //       ),
              //     ),
              //   ],
              // ),
              //   ],
              // ),
             
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 25,
          vertical: 10,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            widget.index == 0 ?Container():InkWell(
              onTap: (){
                PagetransAnimate(context, PageTransitionType.fade, WorkoutPage(index: widget.index-1, workoutdatalist: widget.workoutdatalist, workoutdata: widget.workoutdatalist[widget.index-1]));
              },
              child: Container(
                padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xFFB5E255),
                  ),
                  child: Icon(
                    Icons.arrow_back_ios_outlined,
                    color: Colors.white,
                    ),
                  ),
            ),
              widget.index == widget.workoutdatalist.length-1 ?Container():InkWell(
                onTap: (){
                  PagetransAnimate(context, PageTransitionType.fade, WorkoutPage(index: widget.index+1, workoutdatalist: widget.workoutdatalist, workoutdata: widget.workoutdatalist[widget.index+1]));
                },
                child: Container(
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xFFB5E255),
                  ),
                  child: Icon(
                    Icons.arrow_forward_ios_outlined,
                    color: Colors.white,
                    ),
                  
                ),
              )
          ],
        ),
      ),
    );
  }
}