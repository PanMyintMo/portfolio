import 'package:flutter/material.dart';
import 'package:portfolio/data/projects.dart';
import 'package:portfolio/theme/app_theme.dart';
import 'package:portfolio/widgets/animated_reveal.dart';
import 'package:portfolio/widgets/content_shell.dart';

class StatsSection extends StatelessWidget {
  const StatsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final wide = MediaQuery.sizeOf(context).width >= 800;
    final theme = Theme.of(context).textTheme;

    return ColoredBox(
      color: AppColors.ink,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: wide ? 26 : 20),
        child: ContentShell(
          child: AnimatedReveal(
            child: wide
                ? Row(
                    children: [
                      for (var i = 0; i < careerStats.length; i++) ...[
                        if (i > 0)
                          Container(
                            width: 1,
                            height: 36,
                            margin: const EdgeInsets.symmetric(horizontal: 8),
                            color: AppColors.paper.withValues(alpha: 0.12),
                          ),
                        Expanded(
                          child: _StatItem(
                            value: careerStats[i].value,
                            label: careerStats[i].label,
                            theme: theme,
                            center: true,
                          ),
                        ),
                      ],
                    ],
                  )
                : Wrap(
                    spacing: 24,
                    runSpacing: 16,
                    children: careerStats
                        .map(
                          (s) => SizedBox(
                            width: (MediaQuery.sizeOf(context).width - 64) / 2,
                            child: _StatItem(
                              value: s.value,
                              label: s.label,
                              theme: theme,
                              center: false,
                            ),
                          ),
                        )
                        .toList(),
                  ),
          ),
        ),
      ),
    );
  }
}

class _StatItem extends StatelessWidget {
  const _StatItem({
    required this.value,
    required this.label,
    required this.theme,
    required this.center,
  });

  final String value;
  final String label;
  final TextTheme theme;
  final bool center;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment:
          center ? CrossAxisAlignment.center : CrossAxisAlignment.start,
      children: [
        Text(
          value,
          style: theme.headlineMedium?.copyWith(
            color: AppColors.paper,
            fontSize: 26,
            letterSpacing: -0.5,
          ),
        ),
        const SizedBox(height: 2),
        Text(
          label,
          style: theme.bodySmall?.copyWith(
            color: AppColors.sand.withValues(alpha: 0.75),
            fontSize: 12,
            letterSpacing: 0.2,
          ),
        ),
      ],
    );
  }
}
