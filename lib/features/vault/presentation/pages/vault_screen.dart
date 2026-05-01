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
                    Padding(
                      padding: EdgeInsetsGeometry.all(UiSizes.defaultSpace),
                      child: VaultSlider(contents: ["1", "2", "3"]),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: UiSizes.spaceBtwItems),

              SearchContainer(text: "Search account, name"),
            ],
          ),
        ),
      ),
    );
  }
}
