import 'package:ex_screen_efax/src/constants/colors.dart';
import 'package:ex_screen_efax/src/features/efax/presentation/efax_size.dart';
import 'package:flutter/material.dart';

class InputLabel extends StatelessWidget {
  final String title;
  const InputLabel({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      margin: const EdgeInsets.only(bottom: efaxLabelFieldSpaceValue),
      child: Text(
        title,
        style: const TextStyle(
            fontSize: 17, fontWeight: FontWeight.bold, color: labelInputColor),
      ),
    );
  }
}