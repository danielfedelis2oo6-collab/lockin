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
    final bool isdark = HelperFunctions.isDarkMode(context);

    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: UiSizes.defaultSpace),
        child: Container(
          width: GeneralDeviceUtils.getScreenWidth(context),
          padding: EdgeInsets.all(UiSizes.md),
          decoration: BoxDecoration(
            color: showBackground ? UiColors.textDarkPrimary : null,
            borderRadius: BorderRadius.circular(UiSizes.cardRadiusLg),
            border: showBorder ? Border.all(color: UiColors.grey) : null,
          ),
          child: Row(
            children: [
              Icon(icon, color: isdark ? UiColors.darkerGrey : UiColors.grey),

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
