import 'package:axis/constants.dart';
import 'package:flutter/material.dart';

class StandardSpacer extends StatelessWidget {
  const StandardSpacer({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: standartSpacerHeight,
    );
  }
}
