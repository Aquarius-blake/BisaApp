

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
        appBar: AppBar(
          centerTitle: true,
          surfaceTintColor: Colors.transparent,
          scrolledUnderElevation: 0,
          leading: IconButton(
            onPressed: () => Navigator.pop(context), 
            icon: const Icon(
              Icons.arrow_back_ios_new_outlined,
              color: Colors.black,
              )
            ),
            title: Text('Dr.Specialist'),
            actions: [
              IconButton(
                onPressed: (){}, 
                icon: Icon(
                  Icons.more_vert_outlined
                  )
                )
            ],
        ),
        body: Container(),
      ),
    );
  }
}