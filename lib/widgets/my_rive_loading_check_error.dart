import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:rive/rive.dart';

enum RiveLoadingTypeEnum {
   reset,
   check,
   error,
}

class MyRiveLoadingCheckError extends StatefulWidget {
  final RiveLoadingTypeEnum value;

  const MyRiveLoadingCheckError({
    Key? key,
    required this.value,
  }) : super(key: key);

  @override
  State<MyRiveLoadingCheckError> createState() => _MyRiveLoadingCheckErrorState();
}

class _MyRiveLoadingCheckErrorState extends State<MyRiveLoadingCheckError> {
  // Variable para almacenar artboard
  Artboard? _riveArtboard;

  // Variable para almacenar resetInput
  SMIInput<bool>? _resetInput;

  // Variable para almacenar checkInput
  SMIInput<bool>? _checkInput;

  // Variable para almacenar errorInput
  SMIInput<bool>? _errorInput;

  @override
  void initState() {
    super.initState();

    // Cargar animación desde un archivo
    rootBundle.load('assets/checkerror.riv').then(
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
          _resetInput = controller.findInput('Reset');
          _checkInput = controller.findInput('Check');
          _errorInput = controller.findInput('Error');
        }

        // Recargar widget
        setState(() {
          
        });
      },
    );
  }

  void changeState(RiveLoadingTypeEnum value) {
    if(value == RiveLoadingTypeEnum.check) {
      _checkInput!.value = true;
      return;
    }
    if(value == RiveLoadingTypeEnum.error) {
      _errorInput!.value = true;
      return;
    }

    _resetInput!.value = true;
  }

  @override
  Widget build(BuildContext context) {
    if(_riveArtboard == null) {
      return const SizedBox();
    }

    changeState(widget.value);

    return Rive(artboard: _riveArtboard!);
  }
}