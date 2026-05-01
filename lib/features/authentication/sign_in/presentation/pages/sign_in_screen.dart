import 'package:flutter/material.dart';
import 'package:lockin/constants/sizes.dart' show UiSizes;
import 'package:lockin/features/authentication/sign_in/presentation/widgets/sign_in_form.dart';
import 'package:lockin/features/authentication/sign_in/presentation/widgets/sign_in_logo_and_info.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(UiSizes.authPadding),
            child: Column(
              children: [
                //logo and title
                const SignInLogoAndInfo(),

                /// seperator
                const SizedBox(height: UiSizes.spaceBtwSections),

                /// sign up form field
                SignInForm(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
