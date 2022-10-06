import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:rive/rive.dart';

class Shapes extends StatefulWidget {
  const Shapes({Key? key}) : super(key: key);

  @override
  State<Shapes> createState() => _ShapesState();
}

class _ShapesState extends State<Shapes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: const Text('Shapes'),
      ),
      body: Stack(
        children: [
          const SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: RiveAnimation.asset(
              'assets/shapes.riv',
              fit: BoxFit.fitWidth,
            ),
          ),

          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 30, sigmaY: 30),
            child: Container(
              color: Colors.transparent
            ),
          ),
        ],
      ),
    );
  }
}