import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';

enum AnimProps { scale }

class ScaleWidget extends StatelessWidget {
  const ScaleWidget({
    Key? key,
    required this.child,
    required this.offsetX,
    required this.offsetY,
    required this.time,
  }) : super(key: key);

  final Widget child;
  final double offsetX, offsetY;
  final int time;

  @override
  Widget build(BuildContext context) {
    final tween = MovieTween()
      ..scene(
        begin: Duration.zero,
        duration: const Duration(milliseconds: 500),
      ).tween(
        AnimProps.scale,
        Tween(begin: 0.2, end: 0.5),
        curve: Curves.easeOut,
      )
      ..scene(
        begin: const Duration(milliseconds: 500),
        duration: const Duration(milliseconds: 500),
      ).tween(
        AnimProps.scale,
        Tween(begin: 0.5, end: 0.2),
        curve: Curves.easeOut,
      );

    return LoopAnimationBuilder<Movie>(
      tween: tween,
      duration: tween.duration * time,
      builder: (context, value, child) {
        return Transform.scale(
          scale: value.get(AnimProps.scale),
          child: child,
        );
      },
      child: child,
    );
  }
}
