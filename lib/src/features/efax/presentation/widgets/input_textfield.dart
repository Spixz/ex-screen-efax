import 'package:ex_screen_efax/src/constants/colors.dart';
import 'package:ex_screen_efax/src/enums/InputState.dart';
import 'package:ex_screen_efax/src/features/efax/presentation/widgets/input_validity_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class InputTextField extends StatefulWidget {
  final String name;
  final String label;
  final String errorMessage;
  const InputTextField(
      {super.key,
      required this.name,
      required this.label,
      required this.errorMessage});

  @override
  State<InputTextField> createState() => _InputTextFieldState();
}

class _InputTextFieldState extends State<InputTextField> {
  InputState _inputState = InputState.empty;

  @override
  Widget build(BuildContext context) {
    return FormBuilderTextField(
      name: widget.name,
      style: const TextStyle(
          fontSize: 15, fontWeight: FontWeight.bold, color: textInputColor),
      decoration: InputDecoration(
        filled: true,
        fillColor: backgroundInputColor,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
          borderSide: BorderSide.none,
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16.0),
        suffixIcon: Padding(
          padding: const EdgeInsets.only(right: 20.0),
          child: InputValidyIcon(inputState: _inputState),
        ),
        labelText: widget.label,
        floatingLabelBehavior: FloatingLabelBehavior.never,
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          setState(() {
            _inputState = InputState.invalid;
          });
          return widget.errorMessage;
        }
        setState(() {
          _inputState = InputState.valid;
        });
        return null;
      },
    );
  }
}
