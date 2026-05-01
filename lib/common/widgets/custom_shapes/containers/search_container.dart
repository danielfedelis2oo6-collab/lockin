import 'package:flutter/material.dart';
import 'package:lockin/constants/colors.dart';
import 'package:lockin/constants/sizes.dart';
import 'package:lockin/utils/device/device_utility.dart';
import 'package:lockin/utils/helpers/helper_functions.dart';

class SearchContainer extends StatelessWidget {
  const SearchContainer({
    super.key,
    this.icon = Icons.search,
    this.showBackground = true,
    this.showBorder = true,
    this.onTap,
    required this.text,
  });
  final String text;
  final IconData? icon;
  final bool showBackground, showBorder;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    final bool isDark = HelperFunctions.isDarkMode(context);

    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: UiSizes.defaultSpace),
        child: Container(
          width: GeneralDeviceUtils.getScreenWidth(context),
          padding: EdgeInsets.all(UiSizes.md),
          decoration: BoxDecoration(
            color: isDark ? UiColors.darkGrey10 : UiColors.grey,
            borderRadius: BorderRadius.circular(100),
          ),
          child: Row(
            children: [
              Icon(
                icon,
                color: isDark ? UiColors.textDarkPrimary : UiColors.textPrimary,
              ),

              //horizontal spacing
              const SizedBox(width: UiSizes.spaceBtwItems),
              //horizontal spacing
              Text(text, style: Theme.of(context).textTheme.bodyMedium),
            ],
          ),
        ),
      ),
    );
  }
}
