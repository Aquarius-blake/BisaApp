

import 'package:flutter/material.dart';

class Fitness_fitness extends StatefulWidget {
  final dynamic workoutdata;
  const Fitness_fitness({super.key,this.workoutdata});

  @override
  State<Fitness_fitness> createState() => _Fitness_fitnessState();
}

class _Fitness_fitnessState extends State<Fitness_fitness> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(),
      ),
    );
  }
}