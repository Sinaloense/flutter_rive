import 'package:flutter/material.dart';

import 'package:rive/rive.dart';

class SimpleLoader extends StatelessWidget {
  const SimpleLoader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Simple Loader'),
      ),
      body: const Center(
        child: RiveAnimation.asset(
          'assets/simple-loader.riv',
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}