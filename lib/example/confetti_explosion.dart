import 'package:flutter/material.dart';

import 'package:flutter_rive/widgets/my_confetti_explosion.dart';

class ConfettiExplosion extends StatefulWidget {
  const ConfettiExplosion({Key? key}) : super(key: key);

  @override
  State<ConfettiExplosion> createState() => _ConfettiExplosionState();
}

class _ConfettiExplosionState extends State<ConfettiExplosion> {
  bool value = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: const Text('Confetti Explosion'),
      ),
      body: MyConfettiExplosion(
        value: value,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            value = !value;
          });
        },
        tooltip: 'Play',
        child: const Icon(Icons.play_arrow),
      ),
    );
  }
}
