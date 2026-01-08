import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';

class FadeAnimation extends StatelessWidget {
   double delay;
  final Widget child;
  final double offset;
  final double offsetX;

   FadeAnimation({
     this.delay = 0.5,
    required this.offset,
    required this.offsetX,
    required this.child,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // Updated MovieTween API replaces MultiTween
    final tween = MovieTween()
      ..scene(
        begin: Duration.zero,
        duration: const Duration(milliseconds: 500),
      )
          .tween(
            AniProps.opacity,
            Tween(begin: 0.0, end: 1.0),
          )
          .tween(
            AniProps.height,
            Tween(begin: Offset(offsetX, offset), end: Offset.zero),
            curve: Curves.easeOut,
          );

    return PlayAnimationBuilder<Movie>(
      tween: tween,
      duration: tween.duration,
      delay: Duration(milliseconds: (500 * delay).round()),
      builder: (context, value, _) {
        final opacity = value.get(AniProps.opacity);
        final translation = value.get(AniProps.height);

        return Opacity(
          opacity: opacity,
          child: Transform.translate(
            offset: translation,
            child: child,
          ),
        );
      },
    );
  }
}

enum AniProps { width, height, color, opacity }
