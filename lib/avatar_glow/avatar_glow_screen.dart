import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';

class AvatarGlowScreen extends StatelessWidget {
  const AvatarGlowScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple[100],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 170,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(24)
              ),
              child: Row(children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: AvatarGlow(
                      glowColor: Colors.green,
                      child: CircleAvatar(
                        backgroundColor: Colors.green,
                    radius: 6,
                  )),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Available for work'),
                ),
              ],),
            ),
            SizedBox(height: 50,),
            AvatarGlow(
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
          ],
        ),
      ),
    );
  }
}
