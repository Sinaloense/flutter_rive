import 'package:flutter/material.dart';

import 'package:flutter_rive/widgets/my_rive_loading_check_error.dart';

class StateLoadingCheckError extends StatefulWidget {
  const StateLoadingCheckError({Key? key}) : super(key: key);

  @override
  State<StateLoadingCheckError> createState() => _StateLoadingCheckError();
}

class _StateLoadingCheckError extends State<StateLoadingCheckError> {
  int index = 0;
  RiveLoadingTypeEnum value = RiveLoadingTypeEnum.reset;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: const Text('State Machine - Loading Check/Error'),
      ),
      body: MyRiveLoadingCheckError(value: value),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if(index == 0) {
            value = RiveLoadingTypeEnum.check;
            index = 1;
          }
          else if(index == 1) {
            value = RiveLoadingTypeEnum.reset;
            index = 2;
          }
          else if(index == 2) {
            value = RiveLoadingTypeEnum.error;
            index = 3;
          }
          else if(index == 3) {
            value = RiveLoadingTypeEnum.reset;
            index = 0;
          }

          setState(() {
            
          });
        },
        tooltip: 'Play',
        child: const Icon(Icons.play_arrow),
      ),
    );
  }
}