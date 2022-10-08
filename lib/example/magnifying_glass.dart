import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class MagnifyingGlass extends StatefulWidget {
  const MagnifyingGlass({Key? key}) : super(key: key);

  @override
  State<MagnifyingGlass> createState() => _MagnifyingGlassState();
}

class _MagnifyingGlassState extends State<MagnifyingGlass> {
  RiveAnimationController? _controller;

  @override
  void initState() {
    super.initState();

    _controller = SimpleAnimation('Spinning');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Magnifying Glass'),
      ),
      body: Center(
          child: SizedBox(
            height: 300,
            width: 300,
            child: MouseRegion(
              onEnter: (_) {
                // _controller!.isActive = true;
              },
              onExit: (_) {
                // _controller!.isActive = false;

              },
              child: RiveAnimation.asset(
                'assets/magnifying-glass.riv',
                controllers: [ _controller! ],
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
    );
  }
}