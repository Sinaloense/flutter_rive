import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:rive/rive.dart';

class MyConfettiExplosion extends StatefulWidget {
  final bool value;

  const MyConfettiExplosion({
    Key? key,
    required this.value,
  }) : super(key: key);

  @override
  State<MyConfettiExplosion> createState() => _MyConfettiExplosionState();
}

class _MyConfettiExplosionState extends State<MyConfettiExplosion> {
  // Variable para almacenar artboard
  Artboard? _riveArtboard;

  // Variable para almacenar resetInput
  SMIInput<bool>? _inputExplosion;

  // Almacenar si es el primer dibujado del widget
  bool isFirstDraw = true;

  void changeState() {
    _inputExplosion!.value = true;
  }

  @override
  void initState() {
    super.initState();

    // Cargar animación desde un archivo
    rootBundle.load('assets/confetti-explosion.riv').then(
      (data) async {
        // Cargar RiverFile.
        final file = RiveFile.import(data);

        // Almacenar artboard
        _riveArtboard = file.mainArtboard;

        // Almacenar controlador de stateMachine
        final controller = StateMachineController.fromArtboard(_riveArtboard!, 'State Machine 1');

        // Si se encontro el stateMachine
        if(controller != null) {
          // Agregar controlador al artboard
          _riveArtboard!.addController(controller);

          // Almacenar inputs para controlar animación
          _inputExplosion = controller.findInput('Trigger explosion');
        }

        // Recargar widget
        setState(() {
          
        });
      },
    );
  }

  @override
  void reassemble() {
    super.reassemble();

    isFirstDraw = true;
  }

  @override
  Widget build(BuildContext context) {
    if(_riveArtboard == null) {
      return const SizedBox();
    }

    // Si no es la primera vez que se dibujara el widget
    if(!isFirstDraw) {
      changeState();
    }

    isFirstDraw = false;

    return Rive(artboard: _riveArtboard!);
  }
}