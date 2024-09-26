import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


class HeroAnimations extends StatefulWidget {
  const HeroAnimations({super.key});

  @override
  State<HeroAnimations> createState() => _HeroAnimationsState();
}

class _HeroAnimationsState extends State<HeroAnimations> {
  Color color = Colors.purple;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: InkWell(
        onTap: () {
          setState(() {
            // color == Colors.purple? color = Colors.blue : color = Colors.purple;
          });
        },
        child: Ink(
          height: 200,
          width: 200,
          color: color,
        ),
      ),),
    );
  }
}

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Image.network('https://images.unsplash.com/photo-1726942371143-3afca583a72f?q=80&w=3270&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',fit: BoxFit.fitHeight,),
      ),
    );
  }
}

