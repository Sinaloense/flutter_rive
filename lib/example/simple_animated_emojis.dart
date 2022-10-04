import 'package:flutter/material.dart';

import 'package:rive/rive.dart';

class SimpleAnimatedEmojis extends StatefulWidget {
  const SimpleAnimatedEmojis({Key? key}) : super(key: key);

  @override
  State<SimpleAnimatedEmojis> createState() => _StateAnimatedEmojis();
}

class _StateAnimatedEmojis extends State<SimpleAnimatedEmojis> {
  @override
  void initState() {
    super.initState();
  }

  Widget emoji(String artboard, List<String> animations) {
    return SizedBox(
      height: 256,
      width: 256,
      child: RiveAnimation.asset(
        'assets/animated-emojis.riv',
        fit: BoxFit.contain,
        artboard: artboard,
        animations: animations,
      ),
    );
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: const Text('Simple Animated Emojis'),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          width: double.infinity,
          child: Wrap(
            alignment: WrapAlignment.center,
            children: [
              emoji('joy', [ 'idle' ]),
              emoji('Tada', [ 'Dart_board_play' ]),
              emoji('Bullseye', [ 'Dart_board_play' ]),
              emoji('love', [ 'Heart_play' ]),
              emoji('Onfire', [ 'idle' ]),
              emoji('Mindblown', [ 'Brain_play' ]),
            ],
          ),
        ),
      ),
    );
  }
}