import 'package:flutter/material.dart';
import 'package:lockin/constants/sizes.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          TextFormField(
            decoration: const InputDecoration(labelText: "User Name"),
          ),
          const SizedBox(height: UiSizes.spaceBtwInputFields),

          TextFormField(decoration: const InputDecoration(labelText: "Email")),

          const SizedBox(height: UiSizes.spaceBtwInputFields),

          TextFormField(
            decoration: const InputDecoration(labelText: "Password"),
          ),

          const SizedBox(height: UiSizes.spaceBtwInputFields),

          TextFormField(
            decoration: const InputDecoration(labelText: "Confirm Password"),
          ),

          const SizedBox(height: UiSizes.spaceBtwInputFields * 2),

          ///sign Up button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(onPressed: () {}, child: Text("Sign Up")),
          ),
        ],
      ),
    );
  }
}
