import 'package:ex_screen_efax/src/common_widgets/space_wiget.dart';
import 'package:ex_screen_efax/src/constants/colors.dart';
import 'package:flutter/material.dart';

class AttachmentSelectMediaButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final Function onPressed;
  const AttachmentSelectMediaButton({
    super.key,
    required this.icon,
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(20),
      onTap: () {
        onPressed();
      },
      child: Container(
          height: 130,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: selectDocumentBackgroundColor,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, color: selectTextColor, size: 25),
              const SpaceWidget(
                height: 15,
              ),
              Text(
                label,
                textAlign: TextAlign.center,
              )
            ],
          )),
    );
  }
}