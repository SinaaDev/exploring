import 'package:everyting_test/routes/error_screen.dart';
import 'package:everyting_test/routes/route_screen.dart';
import 'package:flutter/material.dart';

class Routes{

  static const String firstPage = '/';
  static const String secondPage = '/second-page';

  static Route<dynamic> generateRoute(RouteSettings settings){
    switch(settings.name){
      case firstPage:
        return MaterialPageRoute(builder: (context) => RouteScreen(),);
      case secondPage:
        return MaterialPageRoute(builder: (context) => NextPage(),);
      default:
        return MaterialPageRoute(builder: (context) => ErrorScreen(routeName: ' this ',),);
    }
  }

}