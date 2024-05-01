
import 'dart:convert';

import 'package:flutter/services.dart';

class WorkoutService{
  

  Future getMaleWorkouts()async{
    try{
      final String response =
          await rootBundle.loadString('assets/workout/database.json');
      final data = await jsonDecode(response);
      print(data.toString());
      return data['male'];
    }catch(e){
      print(e.toString());
    }
  }

   Future getfemaleWorkouts()async{
    try{
      final String response =
          await rootBundle.loadString('assets/workout/database.json');
      final data = await jsonDecode(response);
      print(data.toString());
      return data['female'];
    }catch(e){
      print(e.toString());
    }
  }



}

