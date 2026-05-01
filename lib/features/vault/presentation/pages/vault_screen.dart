import 'package:flutter/material.dart';
import 'package:lockin/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:lockin/constants/colors.dart';
import 'package:lockin/constants/sizes.dart';
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
                    ClipRRect(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20),
                      ),
                      child: Container(
                        color: UiColors.primaryBackground,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 10,
                        ),
                        height: 100,
                        width: double.infinity,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  padding: EdgeInsets.all(UiSizes.md),
                                  decoration: BoxDecoration(
                                    color: UiColors.grey,
                                    borderRadius: BorderRadius.circular(100),
                                  ),
                                  child: Text(
                                    "FE",
                                    style: Theme.of(
                                      context,
                                    ).textTheme.headlineSmall,
                                  ),
                                ),
                                const SizedBox(width: UiSizes.md),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Franklin Emmanuel",
                                      style: Theme.of(
                                        context,
                                      ).textTheme.headlineSmall,
                                    ),
                                    Text(
                                      "Welcome back",
                                      style: Theme.of(
                                        context,
                                      ).textTheme.bodyMedium,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.menu,
                                color: isDark ? UiColors.white : UiColors.dark,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Text(
                      "Store, manage and secure all your password in one secure vault.",
                    ),
                  ],
                ),
              ),

              const SizedBox(height: UiSizes.spaceBtwSections),

              const SizedBox(height: UiSizes.spaceBtwItems),
            ],
          ),
        ),
      ),
    );
  }
}
