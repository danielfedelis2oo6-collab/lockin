import 'package:flutter/material.dart';
import 'package:lockin/common/widgets/custom_shapes/curved_edges/appbar_curved_edges.dart';

class AppBarCurvedEdgesWidget extends StatelessWidget {
  const AppBarCurvedEdgesWidget({super.key, this.child});

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return ClipPath(clipper: AppbarCurvedEdges(), child: child);
  }
}
