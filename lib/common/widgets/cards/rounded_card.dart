import 'package:flutter/material.dart';
import 'package:lockin/constants/sizes.dart';

class RoundedCard extends StatelessWidget {
  const RoundedCard({
    super.key,
    this.width = 120,
    this.height = 120,
    this.padding,
    this.border,
    this.onPressed,
    this.borderRadius = UiSizes.lg,
    this.applyCardRadius = true,
    this.fit = BoxFit.contain,
    this.backgroundColor = Colors.white,
    required this.cardContents,
  });
  final double? width, height;
  final String cardContents;
  final bool applyCardRadius;
  final BoxBorder? border;
  final Color backgroundColor;
  final BoxFit fit;
  final EdgeInsetsGeometry? padding;
  final VoidCallback? onPressed;
  final double borderRadius;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: width,
        height: height,
        padding: padding,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          border: border,
          color: backgroundColor,
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        child: ClipRRect(
          borderRadius: applyCardRadius
              ? BorderRadiusGeometry.circular(borderRadius)
              : BorderRadius.zero,
          child: Text(cardContents),
        ),
      ),
    );
  }
}
