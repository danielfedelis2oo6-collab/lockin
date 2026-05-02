import 'package:flutter/material.dart';
import 'package:lockin/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:lockin/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:lockin/constants/colors.dart';
import 'package:lockin/constants/sizes.dart';
import 'package:lockin/features/vault/presentation/widgets/custom_vault_appbar.dart';
import 'package:lockin/features/vault/presentation/widgets/vault_slider.dart';
import 'package:lockin/utils/helpers/helper_functions.dart';

class VaultScreen extends StatelessWidget {
  const VaultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = HelperFunctions.isDarkMode(context);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              PrimaryHeaderContainer(
                isdark: isDark,
                child: Column(
                  children: [
                    CustomVaultAppBar(isDark: isDark),
                    VaultSlider(contents: ["1", "2", "3"]),
                  ],
                ),
              ),

              const SizedBox(height: UiSizes.spaceBtwItems),

              SearchContainer(text: "Search account, name"),

              const SizedBox(height: UiSizes.spaceBtwItems / 2),
              Padding(
                padding: const EdgeInsets.all(UiSizes.defaultSpace),
                child: Container(
                  padding: EdgeInsets.all(UiSizes.md),
                  decoration: BoxDecoration(
                    color: UiColors.grey,
                    borderRadius: BorderRadius.circular(100),
                  ),
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(Icons.workspaces),
                          const SizedBox(width: UiSizes.sm),
                          Text("Not secured enough? try auto-fill"),
                        ],
                      ),
                      Icon(Icons.arrow_forward),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
