import 'package:flutter/material.dart';

class SpaceWidget extends StatelessWidget {
  final double height;
  final double width;
  const SpaceWidget({super.key, this.height = 0, this.width = 0});

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: height, width: width);
  }
}
