import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';

enum AniProps { offset }

class LoopWidget extends StatelessWidget {
  final Widget child;
  final double offset;
  final int time;

  const LoopWidget(this.offset, this.child, this.time, {super.key});

  @override
  Widget build(BuildContext context) {
    final tween = MovieTween()
      ..scene(
        begin: Duration.zero,
        duration: Duration(milliseconds: time),
      ).tween(
        AniProps.offset,
        Tween(begin: Offset(0, offset), end: Offset.zero),
        curve: Curves.easeInOut,
      )
      ..scene(
        begin: Duration(milliseconds: time),
        duration: Duration(milliseconds: time),
      ).tween(
        AniProps.offset,
        Tween(begin: Offset.zero, end: Offset(0, offset)),
        curve: Curves.easeInOut,
      );

    return LoopAnimationBuilder<Movie>(
      tween: tween,
      duration: tween.duration * 5,
      builder: (context, value, child) {
        return Transform.translate(
          offset: value.get(AniProps.offset),
          child: child,
        );
      },
      child: child,
    );
  }
}
