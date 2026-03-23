// core/widgets/wave_loading_icons.dart
import 'package:flutter/material.dart';

class WaveLoadingIcons extends StatelessWidget {
  final AnimationController controller;
  final double iconSize;
  final double spacing;
  final Color? iconColor;
  final List<IconData> icons;

  const WaveLoadingIcons({
    super.key,
    required this.controller,
    this.iconSize = 32,
    this.spacing = 40,
    this.iconColor,
    this.icons = const [
      Icons.sports_volleyball_rounded,
      Icons.sports_basketball_rounded,
      Icons.sports_soccer_rounded,
      Icons.sports_cricket_rounded,
    ],
  });

  @override
  Widget build(BuildContext context) {
   final animations = List.generate(
  icons.length,
  (index) {
    final delay = index * 0.15;

    return Tween<double>(
      begin: 0,
      end: -14,
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(
          delay,
          (delay + 0.5).clamp(0.0, 1.0),
          curve: Curves.easeInOut,
        ),
      ),
    );
  },
);

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(
        icons.length,
        (index) => Padding(
          padding: EdgeInsets.symmetric(horizontal: spacing / 2),
          child: AnimatedBuilder(
            animation: animations[index],
            builder: (_, child) {
              return Transform.translate(
                offset: Offset(0, animations[index].value),
                child: child,
              );
            },
            child: Icon(
              icons[index],
              size: iconSize,
              color: iconColor ?? Colors.white.withOpacity(0.9),
            ),
          ),
        ),
      ),
    );
  }
}