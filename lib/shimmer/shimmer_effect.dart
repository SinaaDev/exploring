import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerEffect extends StatelessWidget {
  const ShimmerEffect({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Shimmer Effect'),backgroundColor: Colors.grey[100],),
      backgroundColor: background,
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: 80,
              decoration: decoration(Colors.white),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Gap(34),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      shimmerContainer(35, 10),
                      SizedBox(height: 10,),
                      shimmerContainer(35, 10),
                    ],
                  ),
                  Gap(10),
                  shimmerContainer(40, 40),
                  Gap(40),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      shimmerContainer(180, 5),
                      Gap(6),
                      Row(
                        children: [
                          shimmerContainer(130, 40),
                          Gap(12),
                          CircleAvatar(
                            backgroundColor: shimmerGrey,
                          )
                        ],
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}


class shimmerContainer extends StatefulWidget {
  final double width;
  final double height;
  const shimmerContainer(this.width,this.height, {super.key});

  @override
  State<shimmerContainer> createState() => _shimmerContainerState();
}

class _shimmerContainerState extends State<shimmerContainer> with SingleTickerProviderStateMixin{

  late AnimationController controller;
  late Animation<Color?> colorAnimation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = AnimationController(vsync: this,duration: Duration(seconds: 1));

    colorAnimation = ColorTween(begin: shimmerGrey, end: Colors.grey.shade50).animate(controller);

    controller.forward();

    controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        controller.reverse();
      } else if (status == AnimationStatus.dismissed) {
        controller.forward();
      }
    });


  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: colorAnimation,
      builder: (context, child) =>Container(
        width: widget.width,
        height: widget.height,
        decoration: decoration(colorAnimation.value).copyWith(borderRadius: BorderRadius.circular(6)),
      ),
    );
  }
}


BoxDecoration decoration(Color? color){
  return BoxDecoration(
    color: color ?? Colors.white,
    borderRadius: BorderRadius.circular(16)
  );
}

// Widget shimmerContainer(double width,double height){
//   return Container(
//     width: width,
//     height: height,
//     decoration: decoration(shimmerGrey).copyWith(borderRadius: BorderRadius.circular(6)),
//   );
// }

Color background = const Color.fromRGBO(241, 243, 249, 1);
Color shimmerGrey = const Color.fromRGBO(232, 232, 232, 1);