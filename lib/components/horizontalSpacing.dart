import 'package:flutter/material.dart';
class HorizontalSpacing extends StatelessWidget {
  final double width;
  const HorizontalSpacing({super.key, required this.width});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
    );
  }
}
