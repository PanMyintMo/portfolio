import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:portfolio/data/projects.dart';
import 'package:portfolio/theme/app_theme.dart';
import 'package:portfolio/utils/launch_url.dart';
import 'package:portfolio/widgets/animated_reveal.dart';
import 'package:portfolio/widgets/content_shell.dart';
import 'package:portfolio/widgets/social_buttons.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    final wide = MediaQuery.sizeOf(context).width >= 900;
    final theme = Theme.of(context).textTheme;

    return DecoratedBox(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [AppColors.ink, Color(0xFF1B2C24)],
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: wide ? 64 : 48),
        child: ContentShell(
          child: AnimatedReveal(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'CONTACT',
                  style: theme.labelLarge?.copyWith(
                    color: const Color(0xFF8FCBB8),
                    letterSpacing: 1.6,
                    fontSize: 12,
                  ),
                ),
                const SizedBox(height: 14),
                Text(
                  'Let’s build something solid.',
                  style: theme.displaySmall?.copyWith(
                    color: AppColors.paper,
                    fontSize: wide ? 40 : 28,
                  ),
                ),
                const SizedBox(height: 14),
                ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 520),
                  child: Text(
                    'Open to Flutter & React Native roles—clinic platforms, '
                    'fitness members, content apps, and multi-brand clients.',
                    style: theme.bodyLarge?.copyWith(
                      color: AppColors.sand.withValues(alpha: 0.9),
                    ),
                  ),
                ),
                const SizedBox(height: 28),
                Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  children: [
                    FilledButton.icon(
                      onPressed: () => openExternalUrl(githubProfileUrl),
                      icon: const Icon(Icons.code_rounded, size: 18),
                      label: const Text('github.com/PanMyintMo'),
                      style: FilledButton.styleFrom(
                        backgroundColor: AppColors.paper,
                        foregroundColor: AppColors.ink,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 18,
                          vertical: 14,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6),
                        ),
                      ),
                    ),
                    OutlinedButton.icon(
                      onPressed: () =>
                          openExternalUrl('mailto:$developerEmail'),
                      icon: const Icon(Icons.mail_outline_rounded, size: 18),
                      label: Text(developerEmail),
                      style: OutlinedButton.styleFrom(
                        foregroundColor: AppColors.paper,
                        side: BorderSide(
                          color: AppColors.paper.withValues(alpha: 0.4),
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 18,
                          vertical: 14,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6),
                        ),
                      ),
                    ),
                    OutlinedButton.icon(
                      onPressed: () async {
                        await Clipboard.setData(
                          const ClipboardData(text: developerEmail),
                        );
                        if (context.mounted) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Email copied to clipboard'),
                              behavior: SnackBarBehavior.floating,
                              duration: Duration(seconds: 2),
                            ),
                          );
                        }
                      },
                      icon: const Icon(Icons.copy_rounded, size: 16),
                      label: const Text('Copy email'),
                      style: OutlinedButton.styleFrom(
                        foregroundColor: AppColors.sand,
                        side: BorderSide(
                          color: AppColors.paper.withValues(alpha: 0.22),
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 14,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                const SocialButtons(light: true, compact: true),
                const SizedBox(height: 40),
                Divider(color: AppColors.sand.withValues(alpha: 0.18)),
                const SizedBox(height: 16),
                Text(
                  '© ${DateTime.now().year} $developerName · Built with Flutter',
                  style: theme.bodySmall?.copyWith(
                    color: AppColors.sand.withValues(alpha: 0.55),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
