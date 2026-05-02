import 'package:flutter/material.dart';
import 'package:lockin/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:lockin/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:lockin/constants/colors.dart';
import 'package:lockin/constants/sizes.dart';
import 'package:lockin/features/vault/presentation/widgets/custom_vault_appbar.dart';
import 'package:lockin/features/vault/presentation/widgets/vault_item_tile.dart';
import 'package:lockin/features/vault/presentation/widgets/vault_slider.dart';
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // appbar and hero slider ────────────────────────
              PrimaryHeaderContainer(
                isdark: isDark,
                child: Column(
                  children: [
                    CustomVaultAppBar(isDark: isDark),
                    const SizedBox(height: UiSizes.spaceBtwItems),
                    VaultSlider(
                      contents: [
                        'Store, manage and secure all your\npassword in one secure vault.',
                        'Keep your digital life locked tight.',
                        'One vault to rule them all.',
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: UiSizes.spaceBtwItems),

              // ── Search bar ──────────────────────────────────────────
              SearchContainer(
                text: 'Search account, name',
                onTap: () {
                  // TODO: open full-screen search
                },
              ),

              const SizedBox(height: UiSizes.sm),

              // ── Auto-fill banner ────────────────────────────────────
              _AutoFillBanner(
                isDark: isDark,
                onTap: () {
                  // TODO: open auto-fill setup
                },
              ),

              const SizedBox(height: UiSizes.spaceBtwItems),

              // ── Tab bar + list ──────────────────────────────────────
              _VaultTabSection(isDark: isDark),
            ],
          ),
        ),
      ),
    );
  }
}

// Auto-fill banner

class _AutoFillBanner extends StatelessWidget {
  const _AutoFillBanner({required this.isDark, this.onTap});

  final bool isDark;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: UiSizes.defaultSpace),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: UiSizes.md,
            vertical: UiSizes.sm + 4,
          ),
          decoration: BoxDecoration(
            // Always dark pill to match the design
            color: isDark ? UiColors.darkGrey : UiColors.dark,
            borderRadius: BorderRadius.circular(100),
          ),
          child: Row(
            children: [
              // Wand icon — fixed, never shrinks
              const Icon(
                Icons.auto_fix_high_rounded,
                color: UiColors.white,
                size: UiSizes.iconMd,
              ),
              const SizedBox(width: UiSizes.sm),
              // Text fills remaining space → no overflow
              Expanded(
                child: Text(
                  'Not secured enough? try auto-fill',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: UiColors.white,
                    fontWeight: FontWeight.w500,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              ),
              const SizedBox(width: UiSizes.sm),
              // Arrow — fixed, always visible
              const Icon(
                Icons.arrow_forward_rounded,
                color: UiColors.white,
                size: UiSizes.iconMd,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Tab bar (Recent Updates | All passwords) + vault list
// Kept as a StatefulWidget so it owns the tab state locally.
// Swap for your preferred state management when ready.
// ---------------------------------------------------------------------------

class _VaultTabSection extends StatefulWidget {
  const _VaultTabSection({required this.isDark});
  final bool isDark;

  @override
  State<_VaultTabSection> createState() => _VaultTabSectionState();
}

class _VaultTabSectionState extends State<_VaultTabSection> {
  // 0 = Recent Updates, 1 = All passwords
  int _selectedTab = 0;

  /// ── Add / remove entries here ──────────────────────────────────────────
  /// Each entry maps to one [VaultItemTile] row.
  final List<_VaultEntry> _entries = const [
    _VaultEntry(
      logoIcon: Icons.g_mobiledata_rounded, // replace with brand image widget
      logoColor: Color(0xFF4285F4),
      accountName: 'Google Account',
      accountDetail: 'sodehl38@gmail.com',
    ),
    _VaultEntry(
      logoIcon: Icons.bolt_rounded,
      logoColor: Color(0xFF3FCF8E),
      accountName: 'Supabase Dashboard',
      accountDetail: 'project/kldaeoljhumowuegwjyq',
    ),
    _VaultEntry(
      logoIcon: Icons.play_arrow_rounded,
      logoColor: Color(0xFFE50914),
      accountName: 'Netflix Account',
      accountDetail: 'Netflix/sodehl38@gmail.com',
    ),
    _VaultEntry(
      logoIcon: Icons.camera_alt_rounded,
      logoColor: Color(0xFFE1306C),
      accountName: 'Instagram',
      accountDetail: 'Instagram/sodehl38@gmail.com',
    ),
    _VaultEntry(
      logoIcon: Icons.code_rounded,
      logoColor: Color(0xFF24292E),
      accountName: 'Github Account',
      accountDetail: 'github/wayne-2.git',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final isDark = widget.isDark;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: UiSizes.defaultSpace),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ── Pill tab bar ──────────────────────────────────────────
          _PillTabBar(
            isDark: isDark,
            selectedIndex: _selectedTab,
            labels: const ['Recent Updates', 'All passwords'],
            onTabChanged: (i) => setState(() => _selectedTab = i),
          ),
          const SizedBox(height: UiSizes.spaceBtwItems),

          // ── Password list ─────────────────────────────────────────
          // Currently shows the same entries for both tabs.
          // Filter _entries based on _selectedTab when backend is ready.
          ..._entries.map(
            (e) => VaultItemTile(
              logoWidget: _LogoBadge(icon: e.logoIcon, color: e.logoColor),
              accountName: e.accountName,
              accountDetail: e.accountDetail,
              onTap: () {
                // TODO: navigate to VaultItemDetailScreen
              },
              onMoreTap: () {
                // TODO: show bottom sheet with edit/delete options
              },
            ),
          ),
        ],
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Pill tab bar
// ---------------------------------------------------------------------------

class _PillTabBar extends StatelessWidget {
  const _PillTabBar({
    required this.isDark,
    required this.selectedIndex,
    required this.labels,
    required this.onTabChanged,
  });

  final bool isDark;
  final int selectedIndex;
  final List<String> labels;
  final ValueChanged<int> onTabChanged;

  @override
  Widget build(BuildContext context) {
    final Color pillBg = isDark
        ? UiColors.darkContainer
        : UiColors.lightContainer;
    final Color activeBg = isDark ? UiColors.darkerGrey : UiColors.dark;
    final Color activeText = UiColors.white;
    final Color inactiveText = isDark
        ? UiColors.textDarkSecondary
        : UiColors.textSecondary;

    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: pillBg,
        borderRadius: BorderRadius.circular(100),
      ),
      child: Row(
        children: [
          for (int i = 0; i < labels.length; i++)
            Expanded(
              child: GestureDetector(
                onTap: () => onTabChanged(i),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  padding: const EdgeInsets.symmetric(vertical: UiSizes.sm),
                  decoration: BoxDecoration(
                    color: selectedIndex == i ? activeBg : Colors.transparent,
                    borderRadius: BorderRadius.circular(100),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    labels[i],
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: selectedIndex == i ? activeText : inactiveText,
                      fontWeight: selectedIndex == i
                          ? FontWeight.w600
                          : FontWeight.normal,
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Small helpers
// ---------------------------------------------------------------------------

/// A circular coloured badge with an icon, used as the logo placeholder.
/// Replace with a real brand image (Image.asset / CachedNetworkImage) by
/// passing your own logoWidget to [VaultItemTile].
class _LogoBadge extends StatelessWidget {
  const _LogoBadge({required this.icon, required this.color});

  final IconData icon;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: color, shape: BoxShape.circle),
      child: Icon(icon, color: UiColors.white, size: UiSizes.iconMd),
    );
  }
}

/// Pure data model for a vault entry.
/// Extend this when you wire up a real data layer.
class _VaultEntry {
  const _VaultEntry({
    required this.logoIcon,
    required this.logoColor,
    required this.accountName,
    required this.accountDetail,
  });

  final IconData logoIcon;
  final Color logoColor;
  final String accountName;
  final String accountDetail;
}
