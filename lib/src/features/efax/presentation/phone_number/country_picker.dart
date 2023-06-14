import 'package:country_picker/country_picker.dart';
import 'package:ex_screen_efax/src/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flag/flag.dart';

class CountryPicker extends StatefulWidget {
  String countryCode;
  final Function onChanged;
  CountryPicker(
      {super.key, required this.countryCode, required this.onChanged});

  @override
  State<CountryPicker> createState() => _CountryPickerState();
}

class _CountryPickerState extends State<CountryPicker> {
  double flagHeight = 23;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: InkWell(
        borderRadius: BorderRadius.circular(18),
        onTap: () {
          showCountryPicker(
            context: context,
            showPhoneCode:
                true, // optional. Shows phone code before the country name.
            onSelect: (Country country) {
              setState(() {
                widget.countryCode = country.countryCode;
              });
              widget.onChanged(country);
            },
          );
        },
        child: Container(
          width: 100,
          height: 50,
          padding: const EdgeInsets.only(left: 10, right: 0),
          decoration: BoxDecoration(
              color: countrySelectorButtonBackgroundColor,
              borderRadius: BorderRadius.circular(18)),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: Flag.fromString(widget.countryCode,
                    height: flagHeight, width: flagHeight * 4 / 3)),
            Text(widget.countryCode,
                style: const TextStyle(fontSize: 15, color: textInputColor)),
            const Icon(
              Icons.arrow_drop_down,
              color: countrySelectorButtonForegroundColor,
              weight: 100,
            ),
          ]),
        ),
      ),
    );
  }
}
