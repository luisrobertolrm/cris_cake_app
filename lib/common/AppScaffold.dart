import 'package:flutter/material.dart';

class AppScaffold{
  final title;
  final content;

  AppScaffold(this.title, this.content);

  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: Text(this.title)),
      drawer: Drawer(
        child: ListView(children: <Widget>[
          ListTile(
            title: Text('Bolos'),
          ),
          ListTile(
            title: Text('Bolos no pote'),
          )
        ],),
      ),
      body: Center(
        child: this.content,
      ),
    );
  }


}