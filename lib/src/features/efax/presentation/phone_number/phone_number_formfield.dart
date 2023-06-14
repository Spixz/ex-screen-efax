import 'package:country_picker/country_picker.dart';
import 'package:ex_screen_efax/src/features/efax/presentation/phone_number/country_picker.dart';
import 'package:ex_screen_efax/src/features/efax/presentation/phone_number/phone_number_text_input.dart';
import 'package:flutter/material.dart';

class PhoneNumberFormField extends StatefulWidget {
  final String defaultCountryCode;
  const PhoneNumberFormField({super.key, required this.defaultCountryCode});

  @override
  State<PhoneNumberFormField> createState() => _PhoneNumberFormFieldState();
}

class _PhoneNumberFormFieldState extends State<PhoneNumberFormField> {
  late Country country;

  @override
  void initState() {
    super.initState();
    country = CountryService().findByCode(widget.defaultCountryCode)!;
  }

  void changeCountryCode(Country newCountry) {
    setState(() {
      country = newCountry;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Row(
        children: [
          CountryPicker(
              countryCode: country.countryCode, onChanged: changeCountryCode),
          const SizedBox(
            width: 5,
          ),
          PhoneNumberTextInput(
            name: 'recipient_phone_number',
            label: '6 12 34 56 78',
            errorMessage: 'Le numéro est incorrect',
            country: country,
          )
        ],
      ),
    );
  }
}
