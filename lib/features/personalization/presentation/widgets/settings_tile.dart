import 'package:flutter/material.dart';
import 'package:lockin/constants/colors.dart';
import 'package:lockin/constants/sizes.dart';

/// A single tappable row used inside a [SettingsSection].
///
/// Supply [icon], [label], an optional [onTap] callback and set
/// [isDestructive] to `true` for danger actions (e.g., Remove Account).
class SettingsTile extends StatelessWidget {
  const SettingsTile({
    super.key,
    required this.icon,
    required this.label,
    this.onTap,
    this.isDestructive = false,
    this.trailing,
  });

  final IconData icon;
  final String label;
  final VoidCallback? onTap;

  /// When true, renders label and icon in red to signal a destructive action.
  final bool isDestructive;

  /// Override the default chevron with any widget (e.g. a Switch).
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    final Color iconColor = isDestructive
        ? UiColors.red
        : (isDark ? UiColors.iconSecondaryDark : UiColors.iconSecondaryLight);

    final Color labelColor = isDestructive
        ? UiColors.red
        : (isDark ? UiColors.textDarkPrimary : UiColors.textPrimary);

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(UiSizes.borderRadiusMd),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: UiSizes.md,
          vertical: UiSizes.sm + 4,
        ),
        child: Row(
          children: [
            // Leading icon
            Icon(icon, size: UiSizes.iconMd, color: iconColor),
            const SizedBox(width: UiSizes.md),

            // Label
            Expanded(
              child: Text(
                label,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: labelColor,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),

            // Trailing widget (default: chevron)
            trailing ??
                Icon(
                  Icons.chevron_right_rounded,
                  size: UiSizes.iconMd,
                  color: isDark
                      ? UiColors.iconSecondaryDark
                      : UiColors.iconSecondaryLight,
                ),
          ],
        ),
      ),
    );
  }
}
