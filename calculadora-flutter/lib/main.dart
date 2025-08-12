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
        title: const Text(
          'Calculadora Científica',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 0, 167, 28),
        shadowColor: Colors.black26,
        elevation: 4,
        centerTitle: true,
      ),
      body: Visor(),
      backgroundColor: const Color.fromARGB(255, 240, 240, 240),
    );
  }
}
