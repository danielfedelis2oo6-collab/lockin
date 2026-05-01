import 'package:flutter/material.dart';
import 'package:lockin/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:lockin/common/widgets/custom_shapes/containers/curved_edges_widget.dart';
import 'package:lockin/constants/colors.dart';

class OyPrimaryHeaderContainer extends StatelessWidget {
  const OyPrimaryHeaderContainer({
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
        color: isdark ? UiColors.white : UiColors.dark,
        padding: const EdgeInsets.all(0),
        child: SizedBox(
          width: double.infinity,
          height: 400,
          child: Stack(
            children: [
              Positioned(
                top: -150,
                right: -250,
                child: OycirculerContainer(
                  backgroundColor: isdark
                      ? UiColors.dark.withAlpha(6)
                      : UiColors.white.withAlpha(3),
                ),
              ),

              Positioned(
                top: 100,
                right: -300,
                child: OycirculerContainer(
                  backgroundColor: isdark
                      ? UiColors.dark.withAlpha(6)
                      : UiColors.white.withAlpha(3),
                ),
              ),

              child,
            ],
          ),
        ),
      ),
    );
  }
}
