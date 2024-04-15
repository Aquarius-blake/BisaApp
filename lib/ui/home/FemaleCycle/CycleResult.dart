

import 'package:flutter/material.dart';

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
    return Scaffold();
  }
}