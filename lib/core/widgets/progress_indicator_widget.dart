import 'package:flutter/material.dart';

class ProgressIndicatorWidget extends StatelessWidget {
  final bool showWidget;
  final Color color;
  final double size;

  const ProgressIndicatorWidget({
    super.key,
    this.showWidget = true,
    this.color = Colors.white,
    this.size = 28,
  });

  @override
  Widget build(BuildContext context) {
    if (!showWidget) return const Offstage();
    return SizedBox(
      width: size,
      height: size,
      child: CircularProgressIndicator(
        color: color,
        strokeWidth: 3,
      ),
    );
  }
}