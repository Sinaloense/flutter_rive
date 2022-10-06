import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:rive/rive.dart';

class MySwitchDarkLight extends StatefulWidget {
  final bool value;

  const MySwitchDarkLight({
    Key? key,
    required this.value,
  }) : super(key: key);

  @override
  State<MySwitchDarkLight> createState() => _MySwitchDarkLightState();
}

class _MySwitchDarkLightState extends State<MySwitchDarkLight> {
  // Variable para almacenar artboard
  Artboard? _riveArtboard;

  // Variables para almacenar animaciones
  SimpleAnimation? _dayIdleAnimation;
  SimpleAnimation? _nightIdleAnimation;
  SimpleAnimation? _switchNightAnimation;
  SimpleAnimation? _switchDayAnimation;

  // Almacenar timer
  Timer? timer;

  // Almacenar si es el primer dibujado del widget
  bool isFirstDraw = true;

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
        if(widget.value) {
          _riveArtboard!.addController(_dayIdleAnimation!);
        }
        else {
          _riveArtboard!.addController(_nightIdleAnimation!);
        }

        // Recargar widget
        setState(() {
          
        });
      },
    );
  }

  void changeState() {
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
    if(widget.value == false) {
      _riveArtboard!.addController(_switchNightAnimation!);

      // La animación switch dura 340 milisegundos, esperar y activar idle
      timer = Timer(const Duration(milliseconds: 340), () {
        _riveArtboard!.addController(_nightIdleAnimation!);
      });

      return;
    }

    // Activar animación de día
    _riveArtboard!.addController(_switchDayAnimation!);

    // La animación switch dura 340 milisegundos, esperar y activar idle
    timer = Timer(const Duration(milliseconds: 340), () {
      _riveArtboard!.addController(_dayIdleAnimation!);
    });
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