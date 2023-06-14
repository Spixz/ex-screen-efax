import 'package:ex_screen_efax/src/common_widgets/empty_widget.dart';
import 'package:ex_screen_efax/src/constants/colors.dart';
import 'package:ex_screen_efax/src/enums/InputState.dart';
import 'package:flutter/material.dart';

class InputValidyIcon extends StatelessWidget {
  final InputState inputState;
  const InputValidyIcon({super.key, required this.inputState});

  @override
  Widget build(BuildContext context) {
    if (inputState == InputState.valid) {
      return const Icon(Icons.check, color: checkedLabelColor);
    } else if (inputState == InputState.invalid) {
      return const Icon(
        Icons.close,
        color: Colors.red,
      );
    }
    return const EmptyWidget();
  }
}
