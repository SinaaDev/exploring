
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TestApp extends StatefulWidget {
  const TestApp({super.key});

  @override
  State<TestApp> createState() => _TestAppState();
}

class _TestAppState extends State<TestApp> with TickerProviderStateMixin {

  late AnimationController controller;
  late AnimationController controller2;
  late Animation<double> fadeAnimation;
  late Animation<Offset> slideAnimation;
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    controller = AnimationController(vsync: this,duration: Duration(seconds: 1))..forward();
    controller2 = AnimationController(vsync: this,duration: Duration(seconds: 1))..forward();

    fadeAnimation = CurvedAnimation(parent: controller, curve: Curves.easeOut);
    slideAnimation = Tween<Offset>(
      begin: Offset(0, 1),
      end: Offset(0, 0),
    ).animate(CurvedAnimation(parent: controller2, curve: Curves.easeOut));

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
      body: Stack(
        children: [
          Padding(
            padding:  EdgeInsets.only(top: MediaQuery.of(context).padding.top),
            child: AnimatedBuilder(
              animation: controller,
              builder: (context, child) => FadeTransition(
                opacity: fadeAnimation,
                child: Transform.scale(
                  scale: controller.value,
                  child: Image.network('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQwUpEMwgW1GW90ll7R8K8giU4NABNgYlcm8A&s',
                    width: double.infinity,
                  ),
                ),
              ),
            ),
          ),

          SlideTransition(
            position: slideAnimation,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: MediaQuery.of(context).size.height * 0.7,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(35)),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      spreadRadius: 4,
                      blurRadius: 30
                    )
                  ]
                ),
                child: Padding(
                  padding: const EdgeInsets.all(32.0),
                  child: AnimatedBuilder(
                    animation: controller,
                    builder: (context, child) {
                      final space = 20 * (1 - controller.value) + 30;
                      return FadeTransition(
                      opacity: fadeAnimation,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text('LOGIN',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),

                          SizedBox(height: space,),

                          TextField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: 'username',
                            ),
                          ),

                          SizedBox(height: space,),

                          TextField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: 'password',
                            ),
                          ),

                          SizedBox(height: space,),

                          Align(
                            alignment: Alignment.centerRight,
                            child: Text('Forgot Password'),
                          ),

                          SizedBox(height: space,),

                          ElevatedButton(onPressed: (){}, child: Text('LOGIN',style: TextStyle(fontWeight: FontWeight.bold),),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12)
                            ),
                            minimumSize: Size(double.infinity, 60)
                          ),
                          ),
                        ],
                      ),
                    );}
                  ),
                ),
              ),
            ),
          )

        ],
      ),
    );
  }
}
