import 'package:flutter/material.dart';
import 'package:lockin/constants/colors.dart';
import 'package:lockin/constants/sizes.dart';

// ---------------------------------------------------------------------------
// CustomVaultAppBar
//
// Matches the design: white/dark card with rounded bottom corners, subtle
// drop-shadow, avatar badge, name + greeting, and a hamburger icon.
//
// Shadow is intentionally soft (low alpha, low spread) so it reads as a
// "floating card" effect without being heavy.
// ---------------------------------------------------------------------------

class CustomVaultAppBar extends StatelessWidget {
  const CustomVaultAppBar({
    super.key,
    required this.isDark,

    /// Initials shown in the avatar badge.  Replace with a real avatar widget.
    this.initials = 'FE',
    this.userName = 'Franklin Emmanuel',
    this.greeting = 'Welcome back',
    this.onMenuTap,
  });

  final bool isDark;
  final String initials;
  final String userName;
  final String greeting;
  final VoidCallback? onMenuTap;

  @override
  Widget build(BuildContext context) {
    // Background: always the opposite of the page so the card "pops"
    final Color cardBg = isDark ? UiColors.darkGrey : UiColors.white;
    final Color textColor = isDark
        ? UiColors.textDarkPrimary
        : UiColors.textPrimary;
    final Color subtitleColor = isDark
        ? UiColors.textDarkSecondary
        : UiColors.textSecondary;
    final Color avatarBg = isDark
        ? UiColors.darkerGrey
        : UiColors.lightContainer;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        horizontal: UiSizes.defaultSpace,
        vertical: UiSizes.sm + 4,
      ),
      decoration: BoxDecoration(
        color: cardBg,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(UiSizes.cardRadiusLg + 4),
          bottomRight: Radius.circular(UiSizes.cardRadiusLg + 4),
        ),
        boxShadow: [
          BoxShadow(
            // Subtle: low alpha (30 / 255 ≈ 12 %), small blur, zero spread
            color: Colors.black.withAlpha(30),
            blurRadius: 8,
            spreadRadius: 0,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // ── Avatar + name ───────────────────────────────────────────
          Row(
            children: [
              // Avatar badge
              Container(
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                  color: avatarBg,
                  shape: BoxShape.circle,
                ),
                alignment: Alignment.center,
                child: Text(
                  initials,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: textColor,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              const SizedBox(width: UiSizes.sm),
              // Name + greeting
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    userName,
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      color: textColor,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    greeting,
                    style: Theme.of(
                      context,
                    ).textTheme.bodySmall?.copyWith(color: subtitleColor),
                  ),
                ],
              ),
            ],
          ),

          // ── Hamburger menu ──────────────────────────────────────────
          IconButton(
            onPressed: onMenuTap ?? () {},
            icon: Icon(
              Icons.menu_rounded,
              color: isDark
                  ? UiColors.iconPrimaryDark
                  : UiColors.iconPrimaryLight,
            ),
          ),
        ],
      ),
    );
  }
}
