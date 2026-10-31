import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio/data/projects.dart';
import 'package:portfolio/theme/app_theme.dart';
import 'package:portfolio/utils/launch_url.dart';

class SocialButtons extends StatelessWidget {
  const SocialButtons({super.key, this.compact = false, this.light = false});

  final bool compact;
  final bool light;

  Widget _iconFor(String key) {
    switch (key) {
      case 'github':
        return const Icon(Icons.code_rounded);

      case 'email':
        return const Icon(Icons.mail_outline_rounded);

      case 'linkedin':
        return const FaIcon(FontAwesomeIcons.linkedin);

      default:
        return const Icon(Icons.link_rounded);
    }
  }

  @override
  Widget build(BuildContext context) {
    final fg = light ? AppColors.paper : AppColors.ink;

    final border = light
        ? AppColors.paper.withValues(alpha: 0.28)
        : AppColors.ink.withValues(alpha: 0.18);

    return Wrap(
      spacing: 10,
      runSpacing: 10,
      children: socialLinks.map((link) {
        return _HoverScale(
          child: OutlinedButton.icon(
            onPressed: () => openExternalUrl(link.url),
            icon: SizedBox(
              width: compact ? 16 : 18,
              height: compact ? 16 : 18,
              child: Center(child: _iconFor(link.iconKey)),
            ),
            label: Text(link.label),
            style: OutlinedButton.styleFrom(
              foregroundColor: fg,
              side: BorderSide(color: border),
              minimumSize: const Size(0, 36),
              padding: EdgeInsets.symmetric(
                horizontal: compact ? 12 : 14,
                vertical: compact ? 8 : 10,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6),
              ),
              textStyle: Theme.of(context).textTheme.labelLarge?.copyWith(
                    fontSize: 12,
                  ),
            ),
          ),
        );
      }).toList(),
    );
  }
}

class _HoverScale extends StatefulWidget {
  const _HoverScale({required this.child});

  final Widget child;

  @override
  State<_HoverScale> createState() => _HoverScaleState();
}

class _HoverScaleState extends State<_HoverScale> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: AnimatedScale(
        scale: _hovered ? 1.04 : 1,
        duration: const Duration(milliseconds: 180),
        curve: Curves.easeOut,
        child: widget.child,
      ),
    );
  }
}
