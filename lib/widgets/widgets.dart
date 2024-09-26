import 'package:flutter/material.dart';

class Widgets extends StatefulWidget {
  const Widgets({super.key});

  @override
  State<Widgets> createState() => _WidgetsState();
}

class _WidgetsState extends State<Widgets> with SingleTickerProviderStateMixin{

  late TabController _controller;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    print('built');
    return Scaffold(
      appBar: AppBar(
        bottom: TabBar(
          controller: _controller,
            tabs: [
          Tab(
            text: 'home',
            height: 25,
          ),
          Tab(
            text: 'coins',
            height: 25,
          ),
          Tab(
            text: 'private',
            height: 25,
          ),
        ]),
      ),
      body: TabBarView(
        controller: _controller,
        children: [
          FirstPage(),
          SecondPage(),
          ThirdPage()
        ],
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        _controller.animateTo(1);
      }),
    );
  }
}

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> with AutomaticKeepAliveClientMixin{
  int _number = 0;


  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Container(color: Colors.red[100],child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
      Text(_number.toString()),
        ElevatedButton(onPressed: (){
          setState(() {
            _number++;
          });
        }, child: Text('increase'))
    ],),);
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(color: Colors.blue[100],);
  }
}

class ThirdPage extends StatelessWidget {
  const ThirdPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(color: Colors.purple[100],);
  }
}


