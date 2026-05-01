import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lockin/constants/colors.dart';
import 'package:lockin/navigation/domain/navigation_bar_destination.dart';
import 'package:lockin/utils/helpers/helper_functions.dart';

class NavigationMainWrapper extends StatelessWidget {
  const NavigationMainWrapper({super.key, required this.navigationShell});
  final StatefulNavigationShell navigationShell;
  @override
  Widget build(BuildContext context) {
    final isDark = HelperFunctions.isDarkMode(context);
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: NavigationBar(
        backgroundColor: isDark ? UiColors.dark : UiColors.white,
        selectedIndex: navigationShell.currentIndex,
        onDestinationSelected: navigationShell.goBranch,
        indicatorColor: UiColors.grey,
        destinations: destinations
            .map(
              (destination) => NavigationDestination(
                icon: Icon(destination.icon),
                label: destination.label,
              ),
            )
            .toList(),
      ),
    );
  }
}
