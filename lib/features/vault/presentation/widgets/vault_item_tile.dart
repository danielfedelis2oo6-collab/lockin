import 'package:flutter/material.dart';
import 'package:lockin/constants/colors.dart';
import 'package:lockin/constants/sizes.dart';

/// A single password-vault entry row.
///
/// Supply:
///  [logoWidget]  – any widget shown as the left icon (brand logo, initials, etc.)
///  [accountName] – e.g. "Google Account"
///  [accountDetail] – e.g. "sodehl38@gmail.com"
///  [onTap]       – opens the detail screen
///  [onMoreTap]   – opens a context menu (⋮)
///  [isSelected]  – drives the checkbox state
///  [onSelectionChanged] – checkbox callback
class VaultItemTile extends StatelessWidget {
  const VaultItemTile({
    super.key,
    required this.logoWidget,
    required this.accountName,
    required this.accountDetail,
    this.onTap,
    this.onMoreTap,
    this.isSelected = false,
    this.onSelectionChanged,
  });

  final Widget logoWidget;
  final String accountName;
  final String accountDetail;
  final VoidCallback? onTap;
  final VoidCallback? onMoreTap;
  final bool isSelected;
  final ValueChanged<bool?>? onSelectionChanged;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    final Color tileBg = isDark
        ? UiColors.darkContainer
        : UiColors.lightContainer;

    final Color nameColor = isDark
        ? UiColors.textDarkPrimary
        : UiColors.textPrimary;

    final Color detailColor = isDark
        ? UiColors.textDarkSecondary
        : UiColors.textSecondary;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: UiSizes.sm),
        padding: const EdgeInsets.symmetric(
          horizontal: UiSizes.md,
          vertical: UiSizes.sm + 4,
        ),
        decoration: BoxDecoration(
          color: tileBg,
          borderRadius: BorderRadius.circular(UiSizes.cardRadiusLg + 4),
        ),
        child: Row(
          children: [
            // ── Brand logo / avatar ──────────────────────────────────
            SizedBox(width: 38, height: 38, child: logoWidget),

            const SizedBox(width: UiSizes.md),

            // ── Account name + detail ───────────────────────────────
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    accountName,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: nameColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    accountDetail,
                    style: Theme.of(
                      context,
                    ).textTheme.bodySmall?.copyWith(color: detailColor),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),

            // ── Checkbox ─────────────────────────────────────────────
            SizedBox(
              width: 24,
              height: 24,
              child: Checkbox(
                value: isSelected,
                onChanged: onSelectionChanged,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                ),
                side: BorderSide(
                  color: isDark ? UiColors.borderDark : UiColors.borderPrimary,
                ),
              ),
            ),

            // ── More (⋮) ─────────────────────────────────────────────
            IconButton(
              onPressed: onMoreTap,
              icon: Icon(
                Icons.more_vert_rounded,
                color: isDark
                    ? UiColors.iconSecondaryDark
                    : UiColors.iconSecondaryLight,
                size: UiSizes.iconMd,
              ),
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(),
            ),
          ],
        ),
      ),
    );
  }
}
