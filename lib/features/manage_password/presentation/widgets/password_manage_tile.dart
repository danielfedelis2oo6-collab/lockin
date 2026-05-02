import 'package:flutter/material.dart';
import 'package:lockin/constants/colors.dart';
import 'package:lockin/constants/sizes.dart';

/// A single row inside the "Manage Password" section.
///
/// Each tile shows:
///  - A circular icon badge (dark background)
///  - A [title] and [subtitle] describing the category
///  - A trailing chevron
///
/// Set [isDestructive] to `true` for danger-level items.
class PasswordManageTile extends StatelessWidget {
  const PasswordManageTile({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    this.onTap,
    this.isDestructive = false,
  });

  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback? onTap;
  final bool isDestructive;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    // Card background adapts to theme
    final Color cardBg = isDark
        ? UiColors.darkContainer
        : UiColors.lightContainer;

    // Icon badge is always a solid dark circle (matches the design)
    final Color badgeBg = isDark ? UiColors.darkerGrey : UiColors.dark;
    final Color badgeIcon = UiColors.white;

    final Color titleColor = isDestructive
        ? UiColors.red
        : (isDark ? UiColors.textDarkPrimary : UiColors.textPrimary);

    final Color subtitleColor = isDark
        ? UiColors.textDarkSecondary
        : UiColors.textSecondary;

    final Color chevronColor = isDark
        ? UiColors.iconSecondaryDark
        : UiColors.iconSecondaryLight;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: UiSizes.sm),
        padding: const EdgeInsets.symmetric(
          horizontal: UiSizes.md,
          vertical: UiSizes.md,
        ),
        decoration: BoxDecoration(
          color: cardBg,
          borderRadius: BorderRadius.circular(UiSizes.cardRadiusLg + 4),
        ),
        child: Row(
          children: [
            // ── Circular icon badge ──────────────────────────────────────
            Container(
              width: 42,
              height: 42,
              decoration: BoxDecoration(color: badgeBg, shape: BoxShape.circle),
              child: Icon(icon, size: UiSizes.iconSm + 4, color: badgeIcon),
            ),

            const SizedBox(width: UiSizes.md),

            // ── Title + subtitle ─────────────────────────────────────────
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: titleColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    subtitle,
                    style: Theme.of(
                      context,
                    ).textTheme.bodySmall?.copyWith(color: subtitleColor),
                  ),
                ],
              ),
            ),

            // ── Chevron ──────────────────────────────────────────────────
            Icon(
              Icons.chevron_right_rounded,
              color: chevronColor,
              size: UiSizes.iconMd,
            ),
          ],
        ),
      ),
    );
  }
}
