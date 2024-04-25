

import 'package:flutter/material.dart';

class Physic extends StatefulWidget {
  const Physic({super.key});

  @override
  State<Physic> createState() => _PhysicState();
}

class _PhysicState extends State<Physic> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: (){},
          icon: const Icon(
            Icons.arrow_back_ios_new_outlined,
            color: Color.fromRGBO(23, 30, 60, 1),
            ),
          ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 15
        ),
        child: Column(
          children: [
            
          ],
        ),
      ),
    );
  }
}