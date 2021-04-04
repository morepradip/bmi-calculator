import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  final Color color;
  final double left;
  final double top;
  final double right;
  final double bottom;
  final double borderRadius;
  final Widget child;

  const ReusableCard({
    this.color = const Color(0XFF1D1F33),
    this.left = 8.0,
    this.top = 8.0,
    this.right = 8.0,
    this.bottom = 8.0,
    this.borderRadius = 16.0,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(
        left,
        top,
        right,
        bottom,
      ),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: child,
    );
  }
}
