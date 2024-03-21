

import 'package:flutter/material.dart';
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


@override
  void initState() {
    pageController = PageController();
    initialize();
    super.initState();
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
  pageController.animateToPage(
    page, 
    duration: const Duration(milliseconds: 500), 
    curve: Curves.bounceIn
    );
}

void OnpageChange(int page){
  setState(() {
    _pageIndex = pageController.page!.round();
  });
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _pageIndex,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.timer_outlined),
            label: 'Training',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.fitness_center),
            label: 'Fitness',
          ),
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