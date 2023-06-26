import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';


class FadeAnimation extends StatelessWidget {
  final double delay;
  final Widget child;

  FadeAnimation(this.delay, this.child);

  @override
  Widget build(BuildContext context) {
        final tween = MultiTween()
        ..add("opacity", Tween(begin: 0.0, end: 1.0) , Duration(milliseconds: 500))
        ..add("translateY", Tween(begin: -30.0, end: 0.0), Duration(milliseconds: 500), Curves.easeOut);
    // final tween = MultiTween([
    //   Track("opacity").add(Duration(milliseconds: 500), Tween(begin: 0.0, end: 1.0)),
    //   Track("translateY").add(
    //     Duration(milliseconds: 500), Tween(begin: -30.0, end: 0.0),
    //     curve: Curves.easeOut)
    // ]);
return PlayAnimation<MultiTweenValues>(
  delay: Duration(milliseconds: (500 * delay).round()),
  duration: tween.duration,
  tween: tween,
  child: child,
  builder: (context, child, animation) {
    //if (animation is Map<String, dynamic>) {
      final opacity = animation.get('opacity');
      final translateY = animation.get('translateY');
      return Opacity(
        opacity: opacity,
        child: Transform.translate(
          offset: Offset(0, translateY),
          child: child,
        ),
      );
   // } else {
      // Handle the case when animation is not a Map<String, dynamic>
     // return child!;
////}
  },
);
  }
}