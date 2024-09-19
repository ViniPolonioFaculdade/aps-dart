// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:calculadora/components/visor.dart';

void main(List<String> args) => runApp(Calculadora());

class Calculadora extends StatelessWidget {
  const Calculadora({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Pagina(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Pagina extends StatelessWidget {
  const Pagina({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Calculadora de Ismael',
        ),
        backgroundColor: Color.fromARGB(255, 0, 167, 28),
        shadowColor: Color.fromARGB(0, 0, 0, 0),
        centerTitle: true,
      ),
      body: Visor(),
      backgroundColor: Color.fromARGB(255, 230, 230, 230),
    );
  }
}
