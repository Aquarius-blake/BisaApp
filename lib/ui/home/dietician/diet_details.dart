
import 'package:flutter/material.dart';

class DietDetailPage extends StatefulWidget {
  const DietDetailPage({super.key});

  @override
  State<DietDetailPage> createState() => _DietDetailPageState();
}

class _DietDetailPageState extends State<DietDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 230, 229, 229),
      body: Container(),
       floatingActionButton: InkWell(
        onTap: (){},
        child: Container(
          height: 50,
          margin: EdgeInsets.only(
            left: 30
          ),
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 10,
          ),
          decoration: BoxDecoration(
            color: Color(0xFFB5E255),
            borderRadius: BorderRadius.circular(15)
          ),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/imgs/dietimage.png")
                      )
                  ),
                  child: Text(""),
                ),
                Text(
                  "SPEAK TO A DIETICIAN",
                  style: TextStyle(
                    color: Colors.white
                  ),
                  textAlign: TextAlign.center,
                  ),
              ],
            )
          ),
        )
        ),
    );
  }
}