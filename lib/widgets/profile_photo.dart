import 'package:flutter/material.dart';
import 'package:portfolio/data/projects.dart';
import 'package:portfolio/theme/app_theme.dart';

class ProfilePhoto extends StatelessWidget {
  const ProfilePhoto({
    super.key,
    this.size = 180,
    this.borderRadius,
    this.circular = false,
  });

  final double size;
  final double? borderRadius;
  final bool circular;

  @override
  Widget build(BuildContext context) {
    final radius = circular ? size / 2 : (borderRadius ?? 20);

    return Semantics(
      label: '$developerName profile photo',
      image: true,
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          shape: circular ? BoxShape.circle : BoxShape.rectangle,
          borderRadius: circular ? null : BorderRadius.circular(radius),
          border: Border.all(
            color: AppColors.ink.withValues(alpha: 0.10),
            width: 1.5,
          ),
          boxShadow: size >= 120
              ? [
                  BoxShadow(
                    color: AppColors.ink.withValues(alpha: 0.08),
                    blurRadius: 24,
                    offset: const Offset(0, 10),
                  ),
                ]
              : null,
        ),
        clipBehavior: Clip.antiAlias,
        child: Image.asset(
          profilePhotoAsset,
          fit: BoxFit.cover,
          width: size,
          height: size,
          alignment: const Alignment(0, -0.15),
          errorBuilder: (context, error, stackTrace) => ColoredBox(
            color: AppColors.mist,
            child: Center(
              child: Text(
                'PMM',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: AppColors.teal,
                    ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
