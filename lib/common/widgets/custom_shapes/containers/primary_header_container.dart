import 'package:flutter/material.dart';
import 'package:lockin/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:lockin/common/widgets/custom_shapes/containers/curved_edges_widget.dart';
import 'package:lockin/constants/colors.dart';

class PrimaryHeaderContainer extends StatelessWidget {
  const PrimaryHeaderContainer({
    super.key,
    required this.isdark,
    required this.child,
  });

  final bool isdark;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return UiCurvedEdgesWidget(
      child: Container(
        color: isdark ? UiColors.darkGrey10 : UiColors.grey10,
        padding: const EdgeInsets.all(0),
        child: IntrinsicHeight(
          child: SizedBox(width: double.infinity, child: child),
        ),
      ),
    );
  }
}
