import 'package:flutter/material.dart';

class AnimatedProgressIndicator extends StatelessWidget {
  const AnimatedProgressIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          height: 300,
          width: 300,
          child: TweenAnimationBuilder(
            tween: Tween(begin: 0.0,end: 0.4),
            duration: const Duration(milliseconds: 500),
            builder: (context, value, child) => CircularProgressIndicator(
              value: value,
              backgroundColor: lowPink,
              color: pink,
              strokeWidth: 20,
              strokeCap: StrokeCap.round,
            ),
          ),
        ),
      ),
    );
  }
}

Color lowPink = const Color(0xFFFCE7F3);
Color pink = const Color(0xFFEC4899);