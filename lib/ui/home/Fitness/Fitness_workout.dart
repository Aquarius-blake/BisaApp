
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

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


  @override
  void initState() {
    
    super.initState();
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
  try{
    _player1.setAudioSource(AudioSource.asset('assets/workout/nextset.mp3'));
     _player2.setAudioSource(AudioSource.asset('assets/workout/break.wav'));
  }catch(e){
     print("Error Loading audio source: ${e.toString()}"); 
  }
  }


  @override
  void dispose() {
    _player1.dispose();
    _player2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          widget.index == 0 ?Container():FloatingActionButton(
            onPressed: (){}
            ),
            widget.index == widget.workoutdatalist.length-1 ?Container():FloatingActionButton(
            onPressed: (){}
            )
        ],
      ),
    );
  }
}