import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';

class FadeAnimation extends StatelessWidget {
  final double delay;
  final Widget child;

  FadeAnimation(this.delay, this.child);

  @override
  Widget build(BuildContext context) {
    final tween = MultiTrackTween([
      Track("opacity").add(Duration(milliseconds: 500), Tween(begin: 0.0, end: 1.0)),
      Track("translateY").add(
        Duration(milliseconds: 500), Tween(begin: -30.0, end: 0.0),
        curve: Curves.easeOut)
    ]);
return ControlledAnimation(
  delay: Duration(milliseconds: (500 * delay).round()),
  duration: tween.duration,
  tween: tween,
  child: child,
  builderWithChild: (context, child, animation) {
    if (animation is Map<String, dynamic>) {
      final opacity = animation["opacity"] as double? ?? 1.0;
      final translateY = animation["translateY"] as double? ?? 0.0;
      return Opacity(
        opacity: opacity,
        child: Transform.translate(
          offset: Offset(0, translateY),
          child: child,
        ),
      );
    } else {
      // Handle the case when animation is not a Map<String, dynamic>
      return child;
    }
  },
);
  }
}