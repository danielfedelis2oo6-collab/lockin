import 'package:flutter/material.dart';
import 'package:lockin/constants/colors.dart';
import 'package:lockin/constants/sizes.dart';

/// A titled card that groups a list of setting rows.
///
/// Add as many [children] (typically [SettingsTile] widgets) as needed.
/// A thin divider is automatically inserted between consecutive tiles.
class SettingsSection extends StatelessWidget {
  const SettingsSection({
    super.key,
    required this.title,
    required this.children,
  });

  /// Section heading shown above the card (e.g. "Settings hub").
  final String title;

  /// The rows inside this section (usually [SettingsTile] widgets).
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    final Color cardColor = isDark
        ? UiColors.darkContainer
        : UiColors.lightContainer;

    final Color dividerColor = isDark
        ? UiColors.borderDark
        : UiColors.borderSecondary;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Section title
        Padding(
          padding: const EdgeInsets.only(left: UiSizes.xs, bottom: UiSizes.sm),
          child: Text(
            title,
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
              fontWeight: FontWeight.w600,
              color: isDark ? UiColors.textDarkPrimary : UiColors.textPrimary,
            ),
          ),
        ),

        // Card containing the tiles
        Container(
          decoration: BoxDecoration(
            color: cardColor,
            borderRadius: BorderRadius.circular(UiSizes.cardRadiusLg),
          ),
          child: Column(
            children: _buildTilesWithDividers(children, dividerColor),
          ),
        ),
      ],
    );
  }

  /// Inserts a [Divider] between every consecutive pair of tiles.
  List<Widget> _buildTilesWithDividers(List<Widget> tiles, Color dividerColor) {
    final result = <Widget>[];
    for (int i = 0; i < tiles.length; i++) {
      result.add(tiles[i]);
      if (i < tiles.length - 1) {
        result.add(
          Divider(
            height: 1,
            thickness: 1,
            indent:
                UiSizes.md + UiSizes.iconMd + UiSizes.md, // aligns under text
            endIndent: UiSizes.md,
            color: dividerColor,
          ),
        );
      }
    }
    return result;
  }
}
