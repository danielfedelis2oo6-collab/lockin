import 'package:flutter/material.dart';
import 'package:lockin/constants/colors.dart';
import 'package:lockin/constants/sizes.dart';

class CustomVaultAppBar extends StatelessWidget {
  const CustomVaultAppBar({super.key, required this.isDark});

  final bool isDark;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(24),
        bottomRight: Radius.circular(24),
      ),
      child: Container(
        decoration: BoxDecoration(
          color: UiColors.primaryBackground,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withAlpha(200),
              blurRadius: 100,
              spreadRadius: 10,
              offset: Offset(0, 8),
            ),
          ],
        ),

        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
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
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                ),
                const SizedBox(width: UiSizes.md),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Franklin Emmanuel",
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    Text(
                      "Welcome back",
                      style: Theme.of(context).textTheme.bodyMedium,
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
    );
  }
}
