import 'package:flutter/material.dart';
import 'package:flutter_controle_scroll/models/restaurantes.dart';
import 'package:flutter_controle_scroll/repositories/restaurantes_repository.dart';

void main() {
  runApp(myApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build (BuildContext context) {
    title: 'Controle de Scroll',
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      primarySwatch: Colors.blue,
      appBarTheme: AppBarTheme.of(context).copyWith(
        labelcolor: Colors.blue,
        unselectedLabelColor: Colors.grey[500],
        labelStyle: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
      )
    ),
    home: Detalhes(),
  }
}