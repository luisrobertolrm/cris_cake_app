import 'package:cris_cake_app/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

void main() => runApp(CrisCakeApp());

class Principal extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Scaffold(
      appBar: AppBar(
        title: Text('Cris Cakes'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            FlatButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Login()));
                },
                child: Text('Nova Tela')),
            FlatButton(
              onPressed: null,
              child: Text('Google Sigin'),
            ),
          ],
        ),
      ),
    ));
  }
  
}

class CrisCakeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cris Cake',
      home: Principal(),
    );
  }
}
