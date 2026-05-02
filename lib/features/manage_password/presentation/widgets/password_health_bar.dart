import 'package:flutter/material.dart';
import 'package:lockin/constants/colors.dart';
import 'package:lockin/constants/sizes.dart';

/// Displays a coloured progress bar representing password health.
///
/// [healthFraction] – value from 0.0 (worst) to 1.0 (best).
/// [label]          – text shown on the right (e.g. "80% Safe").
///
/// The bar colour automatically transitions:
///   ≤ 0.33  → red    (poor)
///   ≤ 0.66  → orange (moderate)
///   > 0.66  → green  (good)
class PasswordHealthBar extends StatelessWidget {
  const PasswordHealthBar({
    super.key,
    this.healthFraction = 0.80,
    this.label = '80% Safe',
  });

  final double healthFraction;
  final String label;

  Color _barColor() {
    if (healthFraction <= 0.33) return UiColors.red;
    if (healthFraction <= 0.66) return UiColors.warning;
    return UiColors.success;
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final Color trackColor = isDark
        ? UiColors.darkContainer
        : UiColors.lightContainer;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // ── Progress track ──────────────────────────────────────────────
        ClipRRect(
          borderRadius: BorderRadius.circular(100),
          child: LinearProgressIndicator(
            value: healthFraction.clamp(0.0, 1.0),
            minHeight: 12,
            backgroundColor: trackColor,
            valueColor: AlwaysStoppedAnimation<Color>(_barColor()),
          ),
        ),

        const SizedBox(height: UiSizes.xs),

        // ── Label ────────────────────────────────────────────────────────
        Align(
          alignment: Alignment.centerRight,
          child: Text(
            label,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: isDark
                  ? UiColors.textDarkSecondary
                  : UiColors.textSecondary,
            ),
          ),
        ),
      ],
    );
  }
}
