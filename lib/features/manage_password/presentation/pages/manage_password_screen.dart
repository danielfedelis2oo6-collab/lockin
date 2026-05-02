import 'package:flutter/material.dart';
import 'package:lockin/constants/colors.dart';
import 'package:lockin/constants/sizes.dart';
import 'package:lockin/features/manage_password/presentation/widgets/password_health_bar.dart';
import 'package:lockin/features/manage_password/presentation/widgets/password_manage_tile.dart';

// ---------------------------------------------------------------------------
// ManagePasswordScreen
//
// Layout
// ──────
//   Scaffold
//   └─ SafeArea
//      └─ SingleChildScrollView
//         └─ Padding
//            └─ Column
//               ├─ _NewPasswordCard        ← dark card with input + add button
//               ├─ _PasswordHealthSection  ← labelled progress bar
//               └─ _ManagePasswordSection  ← list of PasswordManageTile rows
//
// How to add a new manage-password category
// ─────────────────────────────────────────
// Open _ManagePasswordSection and add another [PasswordManageTile] to the
// `_tiles` list. No other files need to change.
//
// How to adjust password health
// ─────────────────────────────
// Pass a different `healthFraction` (0.0–1.0) and `label` to
// [PasswordHealthBar] inside _PasswordHealthSection.
// ---------------------------------------------------------------------------

class ManagePasswordScreen extends StatelessWidget {
  const ManagePasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _ManagePasswordAppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(
            horizontal: UiSizes.defaultSpace,
            vertical: UiSizes.spaceBtwItems,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _NewPasswordCard(context),
              const SizedBox(height: UiSizes.spaceBtwSections),
              _PasswordHealthSection(context),
              const SizedBox(height: UiSizes.spaceBtwSections),
              _ManagePasswordSection(context),
            ],
          ),
        ),
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// AppBar
// ---------------------------------------------------------------------------

class _ManagePasswordAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const _ManagePasswordAppBar();

  @override
  Size get preferredSize => const Size.fromHeight(UiSizes.appBarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('Password'),
      centerTitle: false,
      automaticallyImplyLeading: false,
    );
  }
}

// ---------------------------------------------------------------------------
// Section widgets
// ---------------------------------------------------------------------------

/// Dark card at the top: password text field + generate + add button.
Widget _NewPasswordCard(BuildContext context) {
  // Using a local controller so the card is self-contained.
  // Replace with a proper controller / state management when wiring up logic.
  final TextEditingController controller = TextEditingController();

  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        'New Password',
        style: Theme.of(
          context,
        ).textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w600),
      ),
      const SizedBox(height: UiSizes.sm),
      Container(
        padding: const EdgeInsets.all(UiSizes.md),
        decoration: BoxDecoration(
          // Always dark to match the design (visually distinct from page bg)
          color: UiColors.darkGrey,
          borderRadius: BorderRadius.circular(UiSizes.cardRadiusLg),
          image: const DecorationImage(
            image: AssetImage('assets/images/password_card_bg.png'),
            fit: BoxFit.cover,
            opacity: 0.25,
          ),
        ),
        child: Column(
          children: [
            // ── Text field row ───────────────────────────────────────
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: controller,
                    style: const TextStyle(color: UiColors.white),
                    decoration: InputDecoration(
                      hintText: 'Enter password',
                      hintStyle: const TextStyle(
                        color: UiColors.textDarkSecondary,
                      ),
                      filled: true,
                      fillColor: UiColors.darkGrey10,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                          UiSizes.borderRadiusMd,
                        ),
                        borderSide: BorderSide.none,
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: UiSizes.md,
                        vertical: UiSizes.sm,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: UiSizes.sm),
                // Wand / generate icon
                _DarkIconButton(
                  icon: Icons.auto_fix_high_rounded,
                  onTap: () {
                    // TODO: generate a strong password
                  },
                ),
              ],
            ),
            const SizedBox(height: UiSizes.sm),
            // ── Bottom row: refresh + add ────────────────────────────
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _DarkIconButton(
                  icon: Icons.refresh_rounded,
                  onTap: () {
                    // TODO: refresh / re-generate
                  },
                ),
                _AddButton(
                  onTap: () {
                    // TODO: save new password
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    ],
  );
}

/// "Password Health" section with labelled progress bar.
/// Swap [healthFraction] with a live value from your state layer.
Widget _PasswordHealthSection(BuildContext context) {
  const double healthFraction = 0.80; // ← replace with data from controller
  const String healthLabel = '80% Safe';

  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        'Password Health',
        style: Theme.of(
          context,
        ).textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w600),
      ),
      const SizedBox(height: UiSizes.sm),
      const PasswordHealthBar(
        healthFraction: healthFraction,
        label: healthLabel,
      ),
    ],
  );
}

/// "Manage Password" section containing all category tiles.
///
/// ── To add a new category ────────────────────────────────────────────────
/// Add another [PasswordManageTile] to `_tiles`.
Widget _ManagePasswordSection(BuildContext context) {
  final _tiles = <PasswordManageTile>[
    PasswordManageTile(
      icon: Icons.info_outline_rounded,
      title: 'Weak Passwords',
      subtitle: 'Password strength less than optimal',
      onTap: () {
        // TODO: navigate to WeakPasswordsScreen
      },
    ),
    PasswordManageTile(
      icon: Icons.lock_outline_rounded,
      title: 'Overused Passwords',
      subtitle: 'Same Password, multiple platforms',
      onTap: () {
        // TODO: navigate to OverusedPasswordsScreen
      },
    ),
    PasswordManageTile(
      icon: Icons.phonelink_lock_rounded,
      title: 'Enable Two factor Auth',
      subtitle: 'Double protection with 2FA',
      onTap: () {
        // TODO: navigate to TwoFactorAuthScreen
      },
    ),
    PasswordManageTile(
      icon: Icons.link_off_rounded,
      title: 'No Passwords',
      subtitle: 'Accounts without passwords',
      onTap: () {
        // TODO: navigate to NoPasswordsScreen
      },
    ),
  ];

  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        'Manage Password',
        style: Theme.of(
          context,
        ).textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w600),
      ),
      const SizedBox(height: UiSizes.sm),
      ..._tiles,
    ],
  );
}

// ---------------------------------------------------------------------------
// Small helper widgets (private – only used in this file)
// ---------------------------------------------------------------------------

/// A small square-ish button with a dark background used inside the card.
class _DarkIconButton extends StatelessWidget {
  const _DarkIconButton({required this.icon, this.onTap});

  final IconData icon;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(UiSizes.sm),
        decoration: BoxDecoration(
          color: UiColors.darkGrey10,
          borderRadius: BorderRadius.circular(UiSizes.borderRadiusMd),
        ),
        child: Icon(icon, color: UiColors.white, size: UiSizes.iconMd),
      ),
    );
  }
}

/// The "Add" pill-button inside the new-password card.
class _AddButton extends StatelessWidget {
  const _AddButton({this.onTap});

  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: UiSizes.xl,
          vertical: UiSizes.sm,
        ),
        decoration: BoxDecoration(
          color: UiColors.teal20,
          borderRadius: BorderRadius.circular(UiSizes.borderRadiusMd),
        ),
        child: const Text(
          'Add',
          style: TextStyle(color: UiColors.white, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
