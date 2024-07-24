//  FutureBuilder(
//                 future: null, 
//                 builder: (context, future) {
//                   if(future.connectionState == ConnectionState.waiting) {
//                     return const Center(
//                       child: CircularProgressIndicator(),
//                       )
//                   }else if(!future.hasData){
//                     return const Center(
//                       child: Text("No Data Available"),
//                       );
//                   }else if(){}else{
//                     return const Center(
//                       child: Text("Oops! Something Went Wrong"),
//                       );
//                   }
//                 }
//                 ),


import 'package:flutter/material.dart';

class FutureWidget extends StatefulWidget {
  final  dynamic future;
  final Widget content;
   FutureWidget({super.key, this.future, required this.content});

  @override
  State<FutureWidget> createState() => _FutureWidgetState();
}

class _FutureWidgetState extends State<FutureWidget> {

dynamic futuredata;


@override
  void didUpdateWidget(covariant FutureWidget oldWidget) {
    futuredata = widget.future;
    super.didUpdateWidget(oldWidget);
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder(
        future: futuredata, 
        builder: (context, future) {
                  if(future.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                      );
                  }else if(!future.hasData){
                    return const Center(
                      child: Text("No Data Available"),
                      );
                  }else if(future.hasData){
                    if(future.data == []){
                      return const Center(
                      child: Text("No Data Available"),
                      );
                    }else{
                      return widget.content;
                    }
                  }else{
                    return const Center(
                      child: Text("Oops! Something Went Wrong"),
                      );
                  }
                }
        ),
    );
  }
}