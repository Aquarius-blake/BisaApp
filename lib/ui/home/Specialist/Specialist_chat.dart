

import 'package:flutter/material.dart';

class SpecialistChat extends StatefulWidget {
  const SpecialistChat({super.key});

  @override
  State<SpecialistChat> createState() => _SpecialistChatState();
}

class _SpecialistChatState extends State<SpecialistChat> {
  @override
  Widget build(BuildContext context) {
    return Container(
       padding: const EdgeInsets.only(
        top:0
      ),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
           begin: AlignmentDirectional.topCenter,
           end: Alignment.bottomCenter,
          colors: [
            Colors.white,
            Color.fromARGB(255, 247, 245, 245),
            Color.fromARGB(255, 232, 232, 232),
            Color.fromARGB(255, 232, 232, 232)
          ]
          )
      ),
      child: Scaffold(
        body: Container(),
      ),
    );
  }
}