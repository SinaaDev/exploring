import 'package:flutter/material.dart';

class MyExpansionPanelList extends StatefulWidget {
  const MyExpansionPanelList({super.key});

  @override
  State<MyExpansionPanelList> createState() => _MyExpansionPanelListState();
}

class _MyExpansionPanelListState extends State<MyExpansionPanelList> {
  final List<Item> items = [
    Item('Panel 1', text),
    Item('Panel 2', text),
    Item('Panel 3', text),
    Item('Panel 4', text),
    Item('Panel 5', text),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: ExpansionPanelList(
            expansionCallback: (panelIndex, isExpanded) {
              setState(() {
                items[panelIndex].isExpanded = isExpanded;
              });
            },
            children: items.map((item) {
              return ExpansionPanel(

                headerBuilder: (context, isExpanded) {
                  return ListTile(
                    title: Text(item.header),
                  );
                },
                canTapOnHeader: true,
                body: ListTile(
                  title: Text(item.body),
                ),
                isExpanded: item.isExpanded, // Set isExpanded property here
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}

class Item {
  final String header;
  final String body;
  bool isExpanded;

  Item(this.header, this.body, {this.isExpanded = false});
}

const text = 'Some content Some content Some content Some contentSome content Some content Some content Some content Some content Some content Some content Some content Some content Some content Some content Some content Some content Some content Some content  Some content Some content Some content ';
