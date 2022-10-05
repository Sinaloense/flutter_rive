import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:rive/rive.dart';

class SwitchDarkLight extends StatefulWidget {
  const SwitchDarkLight({Key? key}) : super(key: key);

  @override
  State<SwitchDarkLight> createState() => _SwitchDarkLightState();
}

class _SwitchDarkLightState extends State<SwitchDarkLight> {
  // Variable para almacenar artboard
  Artboard? _riveArtboard;

  // Variables para almacenar animaciones
  SimpleAnimation? _dayIdleAnimation;
  SimpleAnimation? _nightIdleAnimation;
  SimpleAnimation? _switchNightAnimation;
  SimpleAnimation? _switchDayAnimation;

  // Variable para almacenar index de animación
  int index = 0;

  // Almacenar timer
  Timer? timer;

  @override
  void initState() {
    super.initState();

    // Cargar animación desde un archivo
    rootBundle.load('assets/switch-for-dark-and-light-mode-transitions.riv').then(
      (data) async {
        // Cargar RiverFile.
        final file = RiveFile.import(data);

        // Almacenar artboard
        _riveArtboard = file.mainArtboard;

        // Almacenar animaciones
        _dayIdleAnimation     = SimpleAnimation('day_idle');
        _nightIdleAnimation   = SimpleAnimation('night_idle');
        _switchNightAnimation = SimpleAnimation('switch_night');
        _switchDayAnimation   = SimpleAnimation('switch_day');

        // Agregar controlador al artboard
        _riveArtboard!.addController(_dayIdleAnimation!);

        // Recargar widget
        setState(() {
          
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: const Text('Simple Animated Emojis'),
      ),
      body: Center(
        child: _riveArtboard == null
        ? const SizedBox()
        : GestureDetector(
          onTap: () {
            // Si existe timer y si esta activo
            if(timer != null && timer!.isActive) {
              return;
            }

            // Remover animaciones
            _riveArtboard!.removeController(_dayIdleAnimation!);
            _riveArtboard!.removeController(_nightIdleAnimation!);
            _riveArtboard!.removeController(_switchNightAnimation!);
            _riveArtboard!.removeController(_switchDayAnimation!);

            // Activar animación de noche
            if(index == 0) {
              index = 1;
              _riveArtboard!.addController(_switchNightAnimation!);

              // La animación switch dura 340 milisegundos, esperar y activar idle
              timer = Timer(const Duration(milliseconds: 340), () {
                _riveArtboard!.addController(_nightIdleAnimation!);
              });

              return;
            }

            // Activar animación de día
            index = 0;
            _riveArtboard!.addController(_switchDayAnimation!);

            /// La animación switch dura 340 milisegundos, esperar y activar idle
            timer = Timer(const Duration(milliseconds: 340), () {
              _riveArtboard!.addController(_dayIdleAnimation!);
            });
          },
          child: SizedBox(
            height: 256,
            width: 256,
            child: Rive(artboard: _riveArtboard!),
          ),
        ),
      ),
    );
  }
}