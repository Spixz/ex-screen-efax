import 'package:ex_screen_efax/src/constants/colors.dart';
import 'package:ex_screen_efax/src/localization/string_hardcoded.dart';
import 'package:flutter/material.dart';

class EfaxHeader extends StatelessWidget {
  const EfaxHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Envoyer un efax".hardcoded,
          style: const TextStyle(
              fontSize: 23,
              fontWeight: FontWeight.bold,
              color: labelInputColor),
        ),
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: closeButtonBackgroundColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: InkWell(
            onTap: () {
              // Action à effectuer lorsque le bouton est pressé
            },
            borderRadius: BorderRadius.circular(10),
            child: const Icon(
              Icons.close,
              color: closeButtonForegroundColor,
            ),
          ),
        )
      ],
    );
  }
}
