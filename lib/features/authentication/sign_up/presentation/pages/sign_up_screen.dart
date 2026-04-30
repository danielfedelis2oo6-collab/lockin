import 'package:flutter/material.dart';
import 'package:lockin/constants/sizes.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsetsGeometry.all(UiSizes.defaultSpace),
          ),
        ),
      ),
    );
  }
}
