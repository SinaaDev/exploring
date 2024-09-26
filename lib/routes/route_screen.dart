import 'package:everyting_test/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RouteScreen extends StatelessWidget {
  const RouteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: ElevatedButton(child: Text('screen 1'),onPressed: (){
          Navigator.pushNamed(context, Routes.secondPage);
        },),
      ),
    );
  }
}

class NextPage extends StatelessWidget {
  const NextPage({super.key});

  Future<bool?> showErrorDialog(BuildContext context) {
    return showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Error'),
          content: Text('Are you sure you want to exit?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(false); // Stay on the page
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(true); // Allow the pop
              },
              child: Text('Exit'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: true,
      child: Scaffold(
        appBar: AppBar(),
        body: Center(child: ElevatedButton(child: Text('go back'),onPressed: (){
          context.go('/');
        },),),
      ),
    );
  }
}
