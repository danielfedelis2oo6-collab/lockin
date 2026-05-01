import 'package:flutter/material.dart';
import 'package:lockin/common/widgets/custom_shapes/containers/appbar_curved_edges_widget.dart';
import 'package:lockin/common/widgets/custom_shapes/containers/curved_edges_widget.dart';
import 'package:lockin/constants/colors.dart';
import 'package:lockin/constants/sizes.dart' show UiSizes;
import 'package:lockin/utils/device/device_utility.dart';
import 'package:lockin/utils/helpers/helper_functions.dart';
// import 'package:get/get.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    this.title,
    this.actions,
    this.backgroundColor,
    this.elevation = 0,
    this.leadingIcon,
    this.leadingOnPressed,
    this.showBackArrow = false,
  });
  final Widget? title;
  final List<Widget>? actions;
  final bool showBackArrow;
  final IconData? leadingIcon;
  final Color? backgroundColor;
  final VoidCallback? leadingOnPressed;
  final double elevation;

  @override
  Widget build(BuildContext context) {
    final bool isDark = HelperFunctions.isDarkMode(context);
    final bool hasLeading = showBackArrow || leadingIcon != null;
    return AppBarCurvedEdgesWidget(
      child: AppBar(
        backgroundColor: UiColors.primary,
        automaticallyImplyLeading: false,
        titleSpacing: hasLeading ? null : 0,
        title: title,
        leading: showBackArrow
            ? IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.arrow_back,
                  color: isDark ? UiColors.dark : UiColors.white,
                ),
              )
            : (leadingIcon != null
                  ? IconButton(
                      onPressed: leadingOnPressed,
                      icon: Icon(leadingIcon),
                    )
                  : null),
        actions: actions,
        // backgroundColor: backgroundColor ?? Colors.transparent,
      ),
    );
  }

  @override
  Size get preferredSize =>
      Size.fromHeight(GeneralDeviceUtils.getAppBarHeight());
}
