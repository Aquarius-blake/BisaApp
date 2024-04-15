

import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class CycleResult extends StatefulWidget {
  final DateTime lastperiod;
  final int? period;
  final int? cycle;
  const CycleResult({super.key, required this.lastperiod, this.period, this.cycle});

  @override
  State<CycleResult> createState() => _CycleResultState();
}

class _CycleResultState extends State<CycleResult> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.pink[100],
      appBar: AppBar(
        toolbarHeight: 30,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios_new_outlined),
          ),
      ),
      body: Container(
        padding:const EdgeInsets.symmetric(
          horizontal: 20
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TableCalendar(
                focusedDay: widget.lastperiod, 
                firstDay: DateTime(1800), 
                lastDay: widget.lastperiod.add(const Duration(days: 365)),
                rangeStartDay: widget.lastperiod,
                rangeEndDay: widget.lastperiod.add(Duration(days: widget.period!)),
                calendarStyle: CalendarStyle(
                  rangeHighlightColor: Colors.pink[200]!,
                  rangeStartDecoration: BoxDecoration(
                    color: Colors.pink[300],
                    shape: BoxShape.circle
                  ),
                  rangeEndDecoration: BoxDecoration(
                    color: Colors.pink[300],
                    shape: BoxShape.circle
                  ),
                ),
                onFormatChanged: (value){},
                )
            ],
          ),
        ),
      ),
    );
  }
}