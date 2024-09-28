import 'dart:math';

import 'package:flutter/material.dart';

class Animation3 extends StatefulWidget {
  const Animation3({super.key});

  @override
  State<Animation3> createState() => _Animation3State();
}

class _Animation3State extends State<Animation3> with SingleTickerProviderStateMixin{

  late AnimationController controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = AnimationController(vsync: this,duration: Duration(seconds: 1))..repeat();
    // controller.repeat();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedBuilder(
          animation: controller,
          builder: (context, child) => Transform.rotate(
            angle: controller.value * 1 * pi,
            child: Container(
              width: 100,
              height: 100,
              child: Icon(Icons.ac_unit_sharp,size: 100,color: Colors.purple,),
            ),
          ),
        ),
      ),
    );
  }
}
