import 'package:flutter/material.dart';

class Animation2 extends StatefulWidget {
  const Animation2({super.key});

  @override
  State<Animation2> createState() => _Animation2State();
}

class _Animation2State extends State<Animation2> with SingleTickerProviderStateMixin {

  late AnimationController controller;
  int counter = 0;
  Color color = Colors.white;
  late Animation<double> widthAnimation;

  double width = 400;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    controller = AnimationController(vsync: this,duration: Duration(seconds: 1));
    final widthTween = Tween<double>(begin: 0,end: 400).chain(CurveTween(curve: Curves.slowMiddle));
    final colorTween = ColorTween(begin: Colors.red,end: Colors.blue);

    widthAnimation = widthTween.animate(controller);

    controller.addListener(() {
      setState(() {
        // width = widthTween.evaluate(controller);
        color = colorTween.evaluate(controller)!;
      });
    },);

    controller.addStatusListener((status) {
      print(status);
      // if(status == AnimationStatus.completed){
      //   controller.reverse();
      // }
    },);

    //
    // controller.addStatusListener((status) {
    //   print(status);
    //   if(status == AnimationStatus.completed){
    //     controller.reverse();
    //   }else if(status == AnimationStatus.dismissed){
    //     controller.forward();
    //   }
    // },);

    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: 300,
        width: widthAnimation.value,
        color: color,
      ),

    );
  }
}
