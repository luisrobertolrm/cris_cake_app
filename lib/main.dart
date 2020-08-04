import 'package:cris_cake_app/login.dart';
import 'package:cris_cake_app/products.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

void main() => runApp(CrisCakeApp());

class Principal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(child: Login());
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
