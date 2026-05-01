import 'package:flutter/material.dart';
import 'package:lockin/constants/sizes.dart';

class MdRoundedCard extends StatelessWidget {
  const MdRoundedCard({
    super.key,
    this.width = 150,
    this.height = 150,
    this.padding,
    this.border,
    this.onPressed,
    this.borderRadius = UiSizes.md,
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
