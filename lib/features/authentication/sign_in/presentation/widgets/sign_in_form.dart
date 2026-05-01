import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lockin/common/widgets/buttons/link_button_with_label.dart';
import 'package:lockin/constants/sizes.dart';
import 'package:lockin/routing/routes.dart';

class SignInForm extends StatelessWidget {
  const SignInForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextFormField(
            decoration: const InputDecoration(labelText: "User Name or Email"),
          ),
          const SizedBox(height: UiSizes.spaceBtwInputFields),

          TextFormField(
            decoration: const InputDecoration(labelText: "Password"),
          ),

          const SizedBox(height: UiSizes.spaceBtwInputFields * 2),

          ///sign In button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () => context.push(AppRoutes.vault),
              child: Text("Sign In"),
            ),
          ),

          /// Go to Sign Up Button
          LinkButtonWithLabel(
            labelTexts: "Don't have an account?",
            buttonTexts: "Sign Up",
            route: AppRoutes.signUp,
          ),
        ],
      ),
    );
  }
}
