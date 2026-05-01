import 'package:flutter/material.dart';
import 'package:lockin/common/widgets/custom_shapes/curved_edges/curved_edges.dart';

class UiCurvedEdgesWidget extends StatelessWidget {
  const UiCurvedEdgesWidget({super.key, this.child});

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return ClipPath(clipper: UICostomCurvedEdges(), child: child);
  }
}
