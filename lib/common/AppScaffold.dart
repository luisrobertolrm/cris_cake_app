import 'package:cris_cake_app/common/userLoggedIn.dart';
import 'package:cris_cake_app/products.dart';
import 'package:flutter/material.dart';

class AppScaffold {
  final String title;
  final Widget content;

  AppScaffold(this.title, this.content);

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(this.title)),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(5.0),
              alignment: Alignment(0.9, 0.7),
              child: UserLoggedIn.url != null
                  ? Image.network(UserLoggedIn.url, height: 60, width: 60)
                  : Image.asset("assets/notLogged.png", height: 60, width: 60),
            ),
            GestureDetector(
              child: ListTile(
                title: Text('Bolos'),
              ),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Produtos()));
              },
            ),
            ListTile(
              title: Text('Bolos no pote'),
            )
          ],
        ),
      ),
      body: Center(
        child: this.content,
      ),
    );
  }
}
