import 'package:flutter/material.dart';
import 'package:lockin/constants/image_strings.dart';
import 'package:lockin/utils/theme/helpers/helper_functions.dart';

class SignInLogoAndInfo extends StatelessWidget {
  const SignInLogoAndInfo({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = HelperFunctions.isDarkMode(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          height: 210,
          width: double.infinity,
          alignment: Alignment.center,
          child: Image(
            image: AssetImage(
              isDark ? ImageStrings.mainLogoLight : ImageStrings.mainLogoDark,
            ),
            width: 136,
            height: 69,
            fit: BoxFit.contain,
          ),
        ),
        Text("Welcome back", style: Theme.of(context).textTheme.headlineLarge),
        const SizedBox(height: 6),
        Text(
          "Sign in to continue",
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ],
    );
  }
}
