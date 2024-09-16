import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';

class AvatarGlowScreen extends StatelessWidget {
  const AvatarGlowScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple[100],
      body: Center(
        child: AvatarGlow(
          glowCount: 2,
          child: Material(
            borderRadius: BorderRadius.circular(70),
            elevation: 8,
            child: CircleAvatar(
              radius: 55,
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(70),
                  child: Image.network('https://pageflows.imgix.net/media/logos/reflectly.jpg?auto=compress&ixlib=python-1.1.2&s=258b2b230e910dae442396dac2593d16')),
            ),
          ),
        ),
      ),
    );
  }
}
