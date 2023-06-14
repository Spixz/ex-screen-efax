import 'package:ex_screen_efax/src/constants/colors.dart';
import 'package:flutter/material.dart';

class SubmitButton extends StatelessWidget {
  final VoidCallback onSubmit;
  const SubmitButton({super.key, required this.onSubmit});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor:
              MaterialStateProperty.all<Color>(buttonValidateBackgroundColor),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
          ),
        ),
        onPressed: onSubmit,
        child: const Text(
          'Envoyer',
          style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: buttonValidateTextColor),
        ),
      ),
    );
  }
}
