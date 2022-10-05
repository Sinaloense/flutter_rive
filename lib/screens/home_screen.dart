import 'package:flutter/material.dart';

import 'package:flutter_rive/example/custom_controller.dart';
import 'package:flutter_rive/example/example_state_machine.dart';
import 'package:flutter_rive/example/liquid_download.dart';
import 'package:flutter_rive/example/little_machine.dart';
import 'package:flutter_rive/example/play_one_shot_animation.dart';
import 'package:flutter_rive/example/play_pause_animation.dart';
import 'package:flutter_rive/example/shapes.dart';
import 'package:flutter_rive/example/simple_animated_emojis.dart';
import 'package:flutter_rive/example/simple_animation.dart';
import 'package:flutter_rive/example/simple_machine_listener.dart';
import 'package:flutter_rive/example/simple_state_machine.dart';
import 'package:flutter_rive/example/state_loading_check_error.dart';
import 'package:flutter_rive/example/state_machine_skills.dart';
import 'package:flutter_rive/example/switch_dark_light.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Home();
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rive Examples'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ElevatedButton(
                child: const Text('Simple Animation'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute<void>(
                      builder: (context) => const SimpleAnimation(),
                    ),
                  );
                },
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                child: const Text('Play/Pause Animation'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute<void>(
                      builder: (context) => const PlayPauseAnimation(),
                    ),
                  );
                },
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                child: const Text('Play One-Shot Animation'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute<void>(
                      builder: (context) => const PlayOneShotAnimation(),
                    ),
                  );
                },
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                child: const Text('Button State Machine'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute<void>(
                      builder: (context) => const ExampleStateMachine(),
                    ),
                  );
                },
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                child: const Text('Skills Machine'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute<void>(
                      builder: (context) => const StateMachineSkills(),
                    ),
                  );
                },
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                child: const Text('Little Machine'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute<void>(
                      builder: (context) => const LittleMachine(),
                    ),
                  );
                },
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                child: const Text('Liquid Download'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute<void>(
                      builder: (context) => const LiquidDownload(),
                    ),
                  );
                },
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                child: const Text('Custom Controller - Speed'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute<void>(
                      builder: (context) => const SpeedyAnimation(),
                    ),
                  );
                },
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                child: const Text('Simple State Machine'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute<void>(
                      builder: (context) => const SimpleStateMachine(),
                    ),
                  );
                },
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                child: const Text('State Machine with Listener'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute<void>(
                      builder: (context) => const StateMachineListener(),
                    ),
                  );
                },
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                child: const Text('State Machine - Loading Check/Error'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute<void>(
                      builder: (context) => const StateLoadingCheckError(),
                    ),
                  );
                },
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                child: const Text('Simple Animated Emojis'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute<void>(
                      builder: (context) => const SimpleAnimatedEmojis(),
                    ),
                  );
                },
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                child: const Text('Switch Dark Light'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute<void>(
                      builder: (context) => const SwitchDarkLight(),
                    ),
                  );
                },
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                child: const Text('Shapes'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute<void>(
                      builder: (context) => const Shapes(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}