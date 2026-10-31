import 'package:flutter/material.dart';
import 'package:portfolio/data/projects.dart';
import 'package:portfolio/theme/app_theme.dart';
import 'package:portfolio/utils/launch_url.dart';
import 'package:portfolio/widgets/profile_photo.dart';

class SiteNav extends StatelessWidget {
  const SiteNav({
    super.key,
    required this.onWork,
    required this.onAbout,
    required this.onContact,
    required this.elevated,
  });

  final VoidCallback onWork;
  final VoidCallback onAbout;
  final VoidCallback onContact;
  final bool elevated;

  @override
  Widget build(BuildContext context) {
    final wide = MediaQuery.sizeOf(context).width >= 860;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 180),
      decoration: BoxDecoration(
        color: AppColors.paper,
        border: Border(
          bottom: BorderSide(
            color: elevated
                ? AppColors.ink.withValues(alpha: 0.10)
                : AppColors.ink.withValues(alpha: 0.06),
          ),
        ),
        boxShadow: elevated
            ? [
                BoxShadow(
                  color: AppColors.ink.withValues(alpha: 0.04),
                  blurRadius: 12,
                  offset: const Offset(0, 4),
                ),
              ]
            : null,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1080),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: wide ? 40 : 16,
              vertical: 10,
            ),
            child: Row(
              children: [
                const ProfilePhoto(size: 28, borderRadius: 8),
                const SizedBox(width: 10),
                Text(
                  'PMM',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontFamily: 'Fraunces',
                        fontWeight: FontWeight.w700,
                        letterSpacing: 1.2,
                        fontSize: 15,
                      ),
                ),
                if (wide) ...[
                  const SizedBox(width: 12),
                  Container(
                    width: 1,
                    height: 14,
                    color: AppColors.ink.withValues(alpha: 0.15),
                  ),
                  const SizedBox(width: 12),
                  Text(
                    'Mobile Engineer',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: AppColors.muted,
                          fontWeight: FontWeight.w500,
                          fontSize: 12,
                        ),
                  ),
                ],
                const Spacer(),
                if (wide) ...[
                  _NavLink(label: 'Work', onTap: onWork),
                  const SizedBox(width: 22),
                  _NavLink(label: 'About', onTap: onAbout),
                  const SizedBox(width: 22),
                  _NavLink(label: 'Contact', onTap: onContact),
                  const SizedBox(width: 18),
                  FilledButton(
                    onPressed: () => openExternalUrl(githubProfileUrl),
                    style: FilledButton.styleFrom(
                      backgroundColor: AppColors.ink,
                      foregroundColor: AppColors.paper,
                      minimumSize: const Size(0, 34),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 14,
                        vertical: 8,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6),
                      ),
                      textStyle:
                          Theme.of(context).textTheme.labelLarge?.copyWith(
                                fontSize: 12,
                                letterSpacing: 0.2,
                              ),
                    ),
                    child: const Text('GitHub'),
                  ),
                ] else
                  PopupMenuButton<String>(
                    icon: const Icon(
                      Icons.menu_rounded,
                      color: AppColors.ink,
                      size: 22,
                    ),
                    color: AppColors.paper,
                    onSelected: (value) {
                      switch (value) {
                        case 'work':
                          onWork();
                        case 'about':
                          onAbout();
                        case 'contact':
                          onContact();
                        case 'github':
                          openExternalUrl(githubProfileUrl);
                      }
                    },
                    itemBuilder: (_) => const [
                      PopupMenuItem(value: 'work', child: Text('Work')),
                      PopupMenuItem(value: 'about', child: Text('About')),
                      PopupMenuItem(value: 'contact', child: Text('Contact')),
                      PopupMenuItem(value: 'github', child: Text('GitHub')),
                    ],
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _NavLink extends StatefulWidget {
  const _NavLink({required this.label, required this.onTap});

  final String label;
  final VoidCallback onTap;

  @override
  State<_NavLink> createState() => _NavLinkState();
}

class _NavLinkState extends State<_NavLink> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedDefaultTextStyle(
          duration: const Duration(milliseconds: 140),
          style: Theme.of(context).textTheme.labelLarge!.copyWith(
                color: _hovered ? AppColors.teal : AppColors.inkSoft,
                fontSize: 13,
                fontWeight: FontWeight.w600,
                letterSpacing: 0.1,
              ),
          child: Text(widget.label),
        ),
      ),
    );
  }
}
