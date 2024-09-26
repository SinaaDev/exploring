import 'package:flutter/material.dart';

class Animation2 extends StatefulWidget {
  const Animation2({super.key});

  @override
  State<Animation2> createState() => _Animation2State();
}

class _Animation2State extends State<Animation2> with SingleTickerProviderStateMixin {

  late AnimationController controller;
  int counter = 0;

  double width = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    controller = AnimationController(vsync: this,duration: Duration(seconds: 1));

    controller.addListener(() {
      setState(() {
        width = controller.value * MediaQuery.of(context).size.width;
      });
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
        width: width,
        color: Colors.purple[100 ],
      ),

    );
  }
}
