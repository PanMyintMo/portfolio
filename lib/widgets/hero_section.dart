import 'package:flutter/material.dart';
import 'package:portfolio/data/projects.dart';
import 'package:portfolio/theme/app_theme.dart';
import 'package:portfolio/utils/launch_url.dart';
import 'package:portfolio/widgets/profile_photo.dart';
import 'package:portfolio/widgets/social_buttons.dart';

class HeroSection extends StatefulWidget {
  const HeroSection({
    super.key,
    required this.onViewWork,
    required this.onContact,
  });

  final VoidCallback onViewWork;
  final VoidCallback onContact;

  @override
  State<HeroSection> createState() => _HeroSectionState();
}

class _HeroSectionState extends State<HeroSection>
    with SingleTickerProviderStateMixin {
  late final AnimationController _entrance;
  late final List<Animation<double>> _staggers;

  @override
  void initState() {
    super.initState();
    _entrance = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 850),
    );
    _staggers = List.generate(5, (i) {
      final start = 0.04 + (i * 0.09);
      final end = (start + 0.34).clamp(0.0, 1.0);
      return CurvedAnimation(
        parent: _entrance,
        curve: Interval(start, end, curve: Curves.easeOutCubic),
      );
    });
    _entrance.forward();
  }

  @override
  void dispose() {
    _entrance.dispose();
    super.dispose();
  }

  Widget _stagger(int index, Widget child) {
    return FadeTransition(
      opacity: _staggers[index],
      child: SlideTransition(
        position: Tween<Offset>(
          begin: const Offset(0, 0.05),
          end: Offset.zero,
        ).animate(_staggers[index]),
        child: child,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final wide = width >= 900;
    final theme = Theme.of(context).textTheme;
    // Chrome / desktop: larger photo that matches text column height.
    final photoSize = width >= 1100
        ? 260.0
        : width >= 900
            ? 220.0
            : 104.0;

    return ColoredBox(
      color: AppColors.paper,
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1100),
          child: Padding(
            padding: EdgeInsets.fromLTRB(
              wide ? 40 : 20,
              wide ? 44 : 28,
              wide ? 40 : 20,
              wide ? 52 : 36,
            ),
            child: wide
                ? Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      _stagger(
                        0,
                        ProfilePhoto(size: photoSize, borderRadius: 24),
                      ),
                      const SizedBox(width: 48),
                      Expanded(
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: _introCopy(theme, wide: true),
                        ),
                      ),
                    ],
                  )
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          _stagger(
                            0,
                            ProfilePhoto(size: photoSize, borderRadius: 18),
                          ),
                          const SizedBox(width: 18),
                          Expanded(
                            child: _stagger(
                              1,
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'AVAILABLE FOR MOBILE ROLES',
                                    style: theme.labelLarge?.copyWith(
                                      color: AppColors.teal,
                                      fontSize: 10,
                                      letterSpacing: 1.2,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    developerName,
                                    style: theme.displayLarge?.copyWith(
                                      fontSize: 28,
                                      height: 1.1,
                                      letterSpacing: -0.8,
                                      color: AppColors.ink,
                                    ),
                                  ),
                                  const SizedBox(height: 6),
                                  Text(
                                    developerTitle,
                                    style: theme.titleMedium?.copyWith(
                                      color: AppColors.tealDeep,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 13,
                                      height: 1.3,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      _introCopy(theme, wide: false, skipHeader: true),
                    ],
                  ),
          ),
        ),
      ),
    );
  }

  Widget _introCopy(
    TextTheme theme, {
    required bool wide,
    bool skipHeader = false,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (!skipHeader) ...[
          _stagger(
            1,
            Text(
              'AVAILABLE FOR MOBILE ROLES',
              style: theme.labelLarge?.copyWith(
                color: AppColors.teal,
                fontSize: 11,
                letterSpacing: 1.5,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          SizedBox(height: wide ? 14 : 10),
          _stagger(
            2,
            Text(
              developerName,
              style: theme.displayLarge?.copyWith(
                fontSize: wide ? 52 : 32,
                height: 1.05,
                letterSpacing: -1.2,
                color: AppColors.ink,
              ),
            ),
          ),
          const SizedBox(height: 10),
          _stagger(
            3,
            Text(
              '$developerTitle  ·  $developerLocation',
              style: theme.titleMedium?.copyWith(
                color: AppColors.tealDeep,
                fontWeight: FontWeight.w700,
                fontSize: wide ? 15 : 13,
              ),
            ),
          ),
          SizedBox(height: wide ? 16 : 12),
        ],
        _stagger(
          skipHeader ? 2 : 3,
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 560),
            child: Text(
              'Production Flutter and React Native apps for clinics, '
              'fitness members, and multi-brand wallets—clean architecture, '
              'GraphQL, and store-ready releases.',
              style: theme.bodyLarge?.copyWith(
                fontSize: wide ? 16 : 15,
                color: AppColors.inkSoft,
                height: 1.55,
              ),
            ),
          ),
        ),
        SizedBox(height: wide ? 24 : 20),
        _stagger(
          skipHeader ? 3 : 4,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Wrap(
                spacing: 10,
                runSpacing: 10,
                children: [
                  _PrimaryCta(
                    label: 'View work',
                    onPressed: widget.onViewWork,
                  ),
                  _GhostCta(
                    label: 'Contact',
                    onPressed: widget.onContact,
                  ),
                  _GhostCta(
                    label: 'GitHub',
                    icon: Icons.code_rounded,
                    onPressed: () => openExternalUrl(githubProfileUrl),
                  ),
                ],
              ),
              const SizedBox(height: 18),
              const SocialButtons(compact: true),
            ],
          ),
        ),
      ],
    );
  }
}

class _PrimaryCta extends StatefulWidget {
  const _PrimaryCta({required this.label, required this.onPressed});

  final String label;
  final VoidCallback onPressed;

  @override
  State<_PrimaryCta> createState() => _PrimaryCtaState();
}

class _PrimaryCtaState extends State<_PrimaryCta> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: FilledButton(
        onPressed: widget.onPressed,
        style: FilledButton.styleFrom(
          backgroundColor: _hovered ? AppColors.tealDeep : AppColors.teal,
          foregroundColor: AppColors.paper,
          minimumSize: const Size(0, 42),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6),
          ),
          textStyle: Theme.of(context).textTheme.labelLarge?.copyWith(
                fontSize: 13,
              ),
        ),
        child: Text(widget.label),
      ),
    );
  }
}

class _GhostCta extends StatefulWidget {
  const _GhostCta({
    required this.label,
    required this.onPressed,
    this.icon,
  });

  final String label;
  final VoidCallback onPressed;
  final IconData? icon;

  @override
  State<_GhostCta> createState() => _GhostCtaState();
}

class _GhostCtaState extends State<_GhostCta> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    final style = TextButton.styleFrom(
      foregroundColor: AppColors.ink,
      minimumSize: const Size(0, 42),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(6),
        side: BorderSide(
          color: _hovered
              ? AppColors.ink
              : AppColors.ink.withValues(alpha: 0.35),
        ),
      ),
      textStyle: Theme.of(context).textTheme.labelLarge?.copyWith(fontSize: 13),
    );

    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: widget.icon == null
          ? TextButton(
              onPressed: widget.onPressed,
              style: style,
              child: Text(widget.label),
            )
          : TextButton.icon(
              onPressed: widget.onPressed,
              icon: Icon(widget.icon, size: 16),
              label: Text(widget.label),
              style: style,
            ),
    );
  }
}
