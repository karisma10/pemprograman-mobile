import 'package:flutter/material.dart';

class Listview extends StatelessWidget {
  const Listview({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('ListView')),
      body: ListView(
        children: [
          ListTile(
            leading: Icon(Icons.person),
            title: Text('List 1')
            ,
          )
        ],
      ),
    );
  }
}