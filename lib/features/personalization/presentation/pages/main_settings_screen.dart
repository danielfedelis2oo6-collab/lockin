import 'package:flutter/material.dart';
import 'package:lockin/constants/sizes.dart';
import 'package:lockin/features/personalization/presentation/widgets/settings_section.dart';
import 'package:lockin/features/personalization/presentation/widgets/settings_tile.dart';

class MainSettingsScreen extends StatelessWidget {
  const MainSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _SettingsAppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(
            horizontal: UiSizes.defaultSpace,
            vertical: UiSizes.spaceBtwItems,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: _buildSections(context),
          ),
        ),
      ),
    );
  }

  /// Add, remove, or reorder sections here without touching anything else.
  List<Widget> _buildSections(BuildContext context) {
    const gap = SizedBox(height: UiSizes.spaceBtwSections);

    return [
      _SettingsHubSection(context),
      gap,
      _SupportsAndFaqsSection(context),
      gap,
      _AccountManagementSection(context),
      gap,
      _AppSection(context),
      gap,
    ];
  }
}

// ---------------------------------------------------------------------------
// AppBar
// ---------------------------------------------------------------------------

class _SettingsAppBar extends StatelessWidget implements PreferredSizeWidget {
  const _SettingsAppBar();

  @override
  Size get preferredSize => const Size.fromHeight(UiSizes.appBarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('Settings'),
      centerTitle: false,
      automaticallyImplyLeading: false,
    );
  }
}

// Section widgets
// Each section is a standalone widget → easy to locate and edit.

/// "Settings hub" section.
Widget _SettingsHubSection(BuildContext context) {
  return SettingsSection(
    title: 'Settings hub',
    children: [
      SettingsTile(
        icon: Icons.person_outline_rounded,
        label: 'Personal Information',
        onTap: () {
          // TODO: navigate to PersonalInformationScreen
        },
      ),
      SettingsTile(
        icon: Icons.shield_outlined,
        label: 'Account security',
        onTap: () {
          // TODO: navigate to AccountSecurityScreen
        },
      ),
      SettingsTile(
        icon: Icons.notifications_none_rounded,
        label: 'Notifications',
        onTap: () {
          // TODO: navigate to NotificationsScreen
        },
      ),
      SettingsTile(
        icon: Icons.tune_rounded,
        label: 'Permissions & Controls',
        onTap: () {
          // TODO: navigate to PermissionsScreen
        },
      ),
    ],
  );
}

/// "Supports and FAQs" section.
Widget _SupportsAndFaqsSection(BuildContext context) {
  return SettingsSection(
    title: 'Supports and FAQs',
    children: [
      SettingsTile(
        icon: Icons.headset_mic_outlined,
        label: 'Contact Support',
        onTap: () {
          // TODO: navigate to ContactSupportScreen
        },
      ),
      SettingsTile(
        icon: Icons.help_outline_rounded,
        label: 'Search FAQ',
        onTap: () {
          // TODO: navigate to FaqScreen
        },
      ),
    ],
  );
}

/// "Account Management" section.
Widget _AccountManagementSection(BuildContext context) {
  return SettingsSection(
    title: 'Account Management',
    children: [
      SettingsTile(
        icon: Icons.swap_horiz_rounded,
        label: 'Account Switching',
        onTap: () {
          // TODO: show account switcher
        },
      ),
      SettingsTile(
        icon: Icons.person_remove_outlined,
        label: 'Remove Account',
        isDestructive: true,
        onTap: () {
          // TODO: show remove-account confirmation dialog
        },
      ),
    ],
  );
}

/// "App" section.
Widget _AppSection(BuildContext context) {
  return SettingsSection(
    title: 'App',
    children: [
      SettingsTile(
        icon: Icons.contrast_rounded,
        label: 'Change Theme',
        onTap: () {
          // TODO: navigate to ThemeSelectionScreen or show bottom sheet
        },
      ),
      SettingsTile(
        icon: Icons.system_update_outlined,
        label: 'App Update',
        onTap: () {
          // TODO: trigger update check
        },
      ),
    ],
  );
}
