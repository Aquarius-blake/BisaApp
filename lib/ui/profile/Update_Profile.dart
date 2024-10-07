
import 'package:flutter/material.dart';

class Update_Profile extends StatefulWidget {
  const Update_Profile({super.key});

  @override
  State<Update_Profile> createState() => _Update_ProfileState();
}

class _Update_ProfileState extends State<Update_Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Update Profile"),
        actions: [
          TextButton(
            onPressed: (){}, 
            child: Text("Update")
            )
        ],
      ),
      body: Container(),
    );
  }
}