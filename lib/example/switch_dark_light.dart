import 'package:flutter/material.dart';

import 'package:flutter_rive/widgets/my_switch_dark_light.dart';

class SwitchDarkLight extends StatefulWidget {
  const SwitchDarkLight({Key? key}) : super(key: key);

  @override
  State<SwitchDarkLight> createState() => _SwitchDarkLightState();
}

class _SwitchDarkLightState extends State<SwitchDarkLight> {
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
        title: const Text('Simple Animated Emojis'),
      ),
      body: Center(
        child: GestureDetector(
          onTap: () {
            setState(() {
              value = !value;
            });
          },
          child: SizedBox(
            height: 256,
            width: 256,
            child: MySwitchDarkLight(value: value),
          ),
        ),
      ),
    );
  }
}