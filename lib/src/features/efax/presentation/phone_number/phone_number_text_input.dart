import 'package:country_picker/country_picker.dart';
import 'package:ex_screen_efax/src/constants/colors.dart';
import 'package:ex_screen_efax/src/enums/InputState.dart';
import 'package:ex_screen_efax/src/features/efax/presentation/widgets/input_validity_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_multi_formatter/flutter_multi_formatter.dart';
import 'package:phone_numbers_parser/phone_numbers_parser.dart';

class PhoneNumberTextInput extends StatefulWidget {
  final String name;
  final String label;
  final String errorMessage;
  final Country country;

  const PhoneNumberTextInput(
      {super.key,
      required this.name,
      required this.label,
      required this.errorMessage,
      required this.country});

  @override
  State<PhoneNumberTextInput> createState() => _PhoneNumberTextInputState();
}

class _PhoneNumberTextInputState extends State<PhoneNumberTextInput> {
  InputState _inputState = InputState.empty;

  @override
  Widget build(BuildContext context) {
    // return const SizedBox(width: 300, child: Text("lol"));
    return Expanded(
      child: FormBuilderTextField(
        keyboardType: TextInputType.phone,
        inputFormatters: [
          PhoneInputFormatter(
            allowEndlessPhone: false,
            defaultCountryCode: widget.country.countryCode,
          ),
        ],
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
          prefixIcon: Container(
            width: 50,
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.only(left: 16.0),
            child: Opacity(
              opacity: 0.5,
              child: Text(
                widget.country.phoneCode,
                style: const TextStyle(
                    fontSize: 15,
                    // fontWeight: FontWeight.bold,
                    color: textInputColor),
              ),
            ),
          ),
          labelText: widget.label,
          floatingLabelBehavior: FloatingLabelBehavior.never,
        ),
        validator: (value) {
          if (value == null) return null;
          String phoneNumber =
              "+${widget.country.phoneCode}${value.replaceAll(' ', '')}";
          PhoneNumber phone = PhoneNumber.parse(phoneNumber,
              callerCountry: IsoCode.fromJson(widget.country.countryCode));
          if (value.isEmpty || !phone.isValid()) {
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
      ),
    );
  }
}
