import 'package:flutter/material.dart';
import 'package:spending_tracker/constants/dimensions.dart';

class ResponsiveLayout extends StatelessWidget {
  final Widget xs;
  final Widget? s;
  final Widget? m;
  final Widget? l;
  final Widget? xl;
  const ResponsiveLayout({
    Key? key,
    required this.xs,
    this.s,
    this.m,
    this.l,
    this.xl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < Dimensions.s) {
          return xs;
        } else if (s != null && constraints.maxWidth < Dimensions.m) {
          return s!;
        } else if (m != null && constraints.maxWidth < Dimensions.l) {
          return m!;
        } else if (l != null && constraints.maxWidth < Dimensions.xl) {
          return l!;
        } else if (xl != null && constraints.maxWidth >= Dimensions.xl) {
          return xl!;
        }
        return xs;
      },
    );
  }
}
