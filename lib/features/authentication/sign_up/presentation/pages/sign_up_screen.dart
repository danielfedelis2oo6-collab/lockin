import 'package:flutter/material.dart';
import 'package:lockin/constants/sizes.dart';
import 'package:lockin/features/authentication/sign_up/presentation/widgets/sign_up_form.dart';
import 'package:lockin/features/authentication/sign_up/presentation/widgets/sign_up_logo_and_info.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsetsGeometry.all(UiSizes.authPadding),
            child: Column(
              children: [
                //logo and title
                const SignUpLogoAndInfo(),
                const SizedBox(height: UiSizes.spaceBtwSections),

                /// sign up form field
                SignUpForm(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
