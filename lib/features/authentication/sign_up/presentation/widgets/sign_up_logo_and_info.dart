import 'package:flutter/material.dart';
import 'package:lockin/constants/image_strings.dart';
import 'package:lockin/constants/sizes.dart';

class SignUpLogoAndInfo extends StatelessWidget {
  const SignUpLogoAndInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 140,
          width: double.infinity,
          alignment: Alignment.centerRight,
          child: Image(
            image: AssetImage(ImageStrings.mainLogo),
            width: 80,
            height: 80,
            fit: BoxFit.contain,
          ),
        ),
        Text(
          "Create account",
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        Text(
          "Fill the following field to continue",
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ],
    );
  }
}
