

import 'package:bisa_app/ui/home/Fitness/Fitness_Profile.dart';
import 'package:bisa_app/ui/home/Fitness/Fitness_training.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FitnessHome extends StatefulWidget {
  const FitnessHome({super.key});

  @override
  State<FitnessHome> createState() => _FitnessHomeState();
}

class _FitnessHomeState extends State<FitnessHome> {


  late SharedPreferences prefs;
  late PageController pageController;
  String? gender;
  int _pageIndex = 0;
  final AudioPlayer _player = AudioPlayer();


@override
  void initState() {
    pageController = PageController();
    initialize();
    _setupplayer();
    super.initState();
  }

  Future<void>_setupplayer()async{
    _player.playbackEventStream.listen((event) { },
    onError: (Object e, StackTrace stacktrace){
      print("A Stream error occured: ${e.toString()}");
    }
  );
  try {
   _player.setAudioSource(AudioSource.asset('assets/workout/workoutintro.wav'));
   Future.delayed(const Duration(seconds: 1), () => _player.play());
  } catch (e) {
    print("Error Loading audio source: ${e.toString()}"); 
  }
  }

initialize()async{
  prefs = await SharedPreferences.getInstance();
  gender = await prefs.getString("gender") ?? "Male";
  if(mounted){
    setState(() {
      
    });
  }
}

void Navitap(int page){
  // pageController.animateToPage(
  //   page, 
  //   duration: const Duration(milliseconds: 500), 
  //   curve: Curves.elasticInOut
  //   );
  pageController.jumpToPage(page);
}

void OnpageChange(int page){
  setState(() {
    _pageIndex = pageController.page!.round();
  });
}

@override
  void dispose() {
    pageController.dispose();
    _player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pageController,
        onPageChanged: OnpageChange,
        children: [
         FitnessTraining(),
          FitnessProfile(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _pageIndex,
        onTap: Navitap,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.timer_outlined),
            label: 'Training',
          ),
          // BottomNavigationBarItem(
          //   icon: Icon(Icons.fitness_center),
          //   label: 'Fitness',
          // ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        selectedItemColor: gender == "Male" ? Colors.amber[800]:Colors.pink,
      )
    );
  }
}