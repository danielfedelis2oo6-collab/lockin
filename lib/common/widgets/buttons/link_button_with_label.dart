import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lockin/constants/sizes.dart' show UiSizes;

class LinkButtonWithLabel extends StatelessWidget {
  const LinkButtonWithLabel({
    super.key,
    required this.labelTexts,
    required this.buttonTexts,
    required this.route,
  });

  final String labelTexts;
  final String buttonTexts;
  final String route;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(labelTexts),
        TextButton(
          onPressed: () => context.push(route),
          style: TextButton.styleFrom(
            textStyle: const TextStyle(fontSize: UiSizes.fontSizeSm),
          ),
          child: Text(buttonTexts),
        ),
      ],
    );
  }
}
