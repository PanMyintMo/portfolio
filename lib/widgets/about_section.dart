import 'package:flutter/material.dart';
import 'package:portfolio/data/projects.dart';
import 'package:portfolio/theme/app_theme.dart';
import 'package:portfolio/utils/launch_url.dart';
import 'package:portfolio/widgets/animated_reveal.dart';
import 'package:portfolio/widgets/content_shell.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    final wide = MediaQuery.sizeOf(context).width >= 960;
    final theme = Theme.of(context).textTheme;

    return ColoredBox(
      color: AppColors.paper,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: wide ? 64 : 48),
        child: ContentShell(
          child: wide
              ? Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 5,
                      child: AnimatedReveal(child: _AboutCopy(theme: theme)),
                    ),
                    const SizedBox(width: 48),
                    Expanded(
                      flex: 4,
                      child: AnimatedReveal(
                        delay: const Duration(milliseconds: 120),
                        child: _SkillsPanel(theme: theme),
                      ),
                    ),
                  ],
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AnimatedReveal(child: _AboutCopy(theme: theme)),
                    const SizedBox(height: 36),
                    AnimatedReveal(
                      delay: const Duration(milliseconds: 100),
                      child: _SkillsPanel(theme: theme),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}

class _AboutCopy extends StatelessWidget {
  const _AboutCopy({required this.theme});

  final TextTheme theme;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'ABOUT',
          style: theme.labelLarge?.copyWith(
            color: AppColors.teal,
            letterSpacing: 1.6,
            fontSize: 12,
          ),
        ),
        const SizedBox(height: 14),
        Text(
          'Cross-stack mobile engineer.',
          style: theme.displaySmall?.copyWith(fontSize: 34),
        ),
        const SizedBox(height: 20),
        Text(developerBio, style: theme.bodyLarge),
        const SizedBox(height: 18),
        Text(
          'Comfortable deep in Flutter clean architecture and modern React Native '
          '(Expo, Redux, Apollo, TanStack Query)—especially multi-brand Great Time products.',
          style: theme.bodyLarge?.copyWith(color: AppColors.muted),
        ),
        const SizedBox(height: 28),
        Wrap(
          spacing: 12,
          runSpacing: 12,
          children: [
            FilledButton.icon(
              onPressed: () => openExternalUrl(githubProfileUrl),
              icon: const Icon(Icons.code_rounded, size: 18),
              label: const Text('GitHub profile'),
              style: FilledButton.styleFrom(
                backgroundColor: AppColors.ink,
                foregroundColor: AppColors.paper,
                padding: const EdgeInsets.symmetric(
                  horizontal: 18,
                  vertical: 14,
                ),
              ),
            ),
            OutlinedButton.icon(
              onPressed: () => openExternalUrl('mailto:$developerEmail'),
              icon: const Icon(Icons.mail_outline_rounded, size: 18),
              label: const Text('Email me'),
              style: OutlinedButton.styleFrom(
                foregroundColor: AppColors.ink,
                side: const BorderSide(color: AppColors.ink),
                padding: const EdgeInsets.symmetric(
                  horizontal: 18,
                  vertical: 14,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _SkillsPanel extends StatelessWidget {
  const _SkillsPanel({required this.theme});

  final TextTheme theme;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(28),
      decoration: BoxDecoration(
        color: AppColors.mist,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: AppColors.line),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'CAPABILITIES',
            style: theme.labelLarge?.copyWith(
              color: AppColors.muted,
              letterSpacing: 1.2,
              fontSize: 11,
            ),
          ),
          const SizedBox(height: 18),
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: [
              for (var i = 0; i < developerSkills.length; i++)
                TweenAnimationBuilder<double>(
                  tween: Tween(begin: 0, end: 1),
                  duration: Duration(milliseconds: 350 + (i * 40)),
                  curve: Curves.easeOut,
                  builder: (context, value, child) {
                    return Opacity(
                      opacity: value,
                      child: Transform.translate(
                        offset: Offset(0, 8 * (1 - value)),
                        child: child,
                      ),
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 14,
                      vertical: 10,
                    ),
                    color: AppColors.paper,
                    child: Text(
                      developerSkills[i],
                      style: theme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                        color: AppColors.ink,
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
