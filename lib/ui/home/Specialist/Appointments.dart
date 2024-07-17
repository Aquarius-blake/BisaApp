
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppointmentList extends StatefulWidget {
  const AppointmentList({super.key});

  @override
  State<AppointmentList> createState() => _AppointmentListState();
}

class _AppointmentListState extends State<AppointmentList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new_outlined,
            color: Colors.white,
            ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: const Color.fromRGBO(23, 30, 60, 1),
        title: Text(
          'Appointments',
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'Poppins',
            fontSize: 20.sp,
          ),
          ),
          centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 10,
        ),
        child: FutureBuilder(
          future: null, 
          builder: (context, future) {
            if(future.connectionState == ConnectionState.waiting){
              return const Center(
                child: CircularProgressIndicator(),
              );
            }else if(!future.hasData){
              return const Center(
                child: Text(
                  "No Appointments",
                  style: TextStyle(
                    fontSize: 26,
                    color:  Color.fromRGBO(23, 30, 60, 1),
                  ),
                  ),
              );
            }else if(future.hasData){
              if(future.data == []){
                return const Center(
                child: Text(
                  "No Appointments",
                  style: TextStyle(
                    fontSize: 26,
                    color:  Color.fromRGBO(23, 30, 60, 1),
                  ),
                  ),
              );
              }else{
                return Container();
              }
            }else{
                return const Center(
                child: Text(
                  "Oops! Something went wrong",
                  style: TextStyle(
                    fontSize: 21,
                    color:  Color.fromRGBO(23, 30, 60, 1),
                  ),
                  ),
              );
            }
          }
          ),
      ),
    );
  }
}