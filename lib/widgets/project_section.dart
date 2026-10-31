import 'package:flutter/material.dart';
import 'package:portfolio/data/projects.dart';
import 'package:portfolio/theme/app_theme.dart';
import 'package:portfolio/utils/launch_url.dart';
import 'package:portfolio/widgets/animated_reveal.dart';
import 'package:portfolio/widgets/content_shell.dart';

class ProjectSection extends StatefulWidget {
  const ProjectSection({super.key});

  @override
  State<ProjectSection> createState() => _ProjectSectionState();
}

class _ProjectSectionState extends State<ProjectSection> {
  String _filter = 'All';

  static const _filters = <String>[
    'All',
    'React Native',
    'Flutter',
    'Full-stack',
  ];

  List<AppProject> get _visible {
    if (_filter == 'All') return projects;
    return projects.where((p) => p.stack.label == _filter).toList();
  }

  @override
  Widget build(BuildContext context) {
    final wide = MediaQuery.sizeOf(context).width >= 960;
    final theme = Theme.of(context).textTheme;
    final visible = _visible;

    return ColoredBox(
      color: AppColors.mist,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: wide ? 64 : 48),
        child: ContentShell(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AnimatedReveal(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'SELECTED WORK',
                      style: theme.labelLarge?.copyWith(
                        color: AppColors.teal,
                        letterSpacing: 1.6,
                        fontSize: 12,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      'Flutter + React Native products that ship.',
                      style: theme.displaySmall?.copyWith(
                        fontSize: wide ? 36 : 28,
                      ),
                    ),
                    const SizedBox(height: 12),
                    ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 640),
                      child: Text(
                        'White-label clinic wallets, fitness members, staff POS/workflow, '
                        'and content apps—across React Native, Expo, and Flutter.',
                        style: theme.bodyLarge?.copyWith(color: AppColors.muted),
                      ),
                    ),
                    const SizedBox(height: 24),
                    Wrap(
                      spacing: 10,
                      runSpacing: 10,
                      children: _filters.map((label) {
                        final selected = _filter == label;
                        final count = label == 'All'
                            ? projects.length
                            : projects
                                .where((p) => p.stack.label == label)
                                .length;
                        return ChoiceChip(
                          label: Text('$label ($count)'),
                          selected: selected,
                          onSelected: (_) => setState(() => _filter = label),
                          selectedColor: AppColors.ink,
                          backgroundColor: AppColors.paper,
                          labelStyle: theme.labelLarge?.copyWith(
                            color:
                                selected ? AppColors.paper : AppColors.inkSoft,
                            fontSize: 12,
                          ),
                          side: BorderSide(
                            color: selected
                                ? AppColors.ink
                                : AppColors.ink.withValues(alpha: 0.12),
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(999),
                          ),
                          showCheckmark: false,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 2,
                          ),
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 32),
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 280),
                switchInCurve: Curves.easeOut,
                switchOutCurve: Curves.easeIn,
                child: Column(
                  key: ValueKey(_filter),
                  children: [
                    for (var i = 0; i < visible.length; i++)
                      Padding(
                        padding: EdgeInsets.only(
                          bottom: i == visible.length - 1 ? 0 : 24,
                        ),
                        child: AnimatedReveal(
                          delay: Duration(milliseconds: 60 * i),
                          child: _ProjectBlock(
                            project: visible[i],
                            index: i + 1,
                            wide: wide,
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ProjectBlock extends StatefulWidget {
  const _ProjectBlock({
    required this.project,
    required this.index,
    required this.wide,
  });

  final AppProject project;
  final int index;
  final bool wide;

  @override
  State<_ProjectBlock> createState() => _ProjectBlockState();
}

class _ProjectBlockState extends State<_ProjectBlock> {
  bool _expanded = false;
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    final project = widget.project;
    final theme = Theme.of(context).textTheme;
    final accent = Color(project.accent);

    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 220),
        transformAlignment: Alignment.center,
        transform: Matrix4.translationValues(0, _hovered ? -4 : 0, 0),
        decoration: BoxDecoration(
          color: AppColors.paper,
          borderRadius: BorderRadius.circular(18),
          border: Border.all(
            color: _hovered
                ? accent.withValues(alpha: 0.45)
                : AppColors.ink.withValues(alpha: 0.06),
          ),
          boxShadow: [
            BoxShadow(
              color: AppColors.ink.withValues(alpha: _hovered ? 0.10 : 0.04),
              blurRadius: _hovered ? 28 : 16,
              offset: Offset(0, _hovered ? 14 : 8),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(18),
          child: widget.wide
              ? Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _AccentRail(
                      accent: accent,
                      index: widget.index,
                      name: project.name,
                      stack: project.stack.label,
                    ),
                    Expanded(child: _body(theme, accent, project)),
                  ],
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(height: 8, color: accent),
                    _body(theme, accent, project),
                  ],
                ),
        ),
      ),
    );
  }

  Widget _body(TextTheme theme, Color accent, AppProject project) {
    return Padding(
      padding: EdgeInsets.all(widget.wide ? 34 : 22),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Wrap(
            spacing: 10,
            runSpacing: 8,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              _MetaPill(label: project.stack.label, color: accent),
              _MetaPill(label: project.status, color: AppColors.inkSoft),
              _MetaPill(label: project.year, color: AppColors.muted),
              ...project.platforms.map(
                (p) => _MetaPill(label: p, color: AppColors.inkSoft),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text(project.name, style: theme.headlineMedium),
          const SizedBox(height: 6),
          Text(
            project.role,
            style: theme.bodySmall?.copyWith(
              color: accent,
              fontWeight: FontWeight.w700,
              letterSpacing: 0.2,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            project.tagline,
            style: theme.titleLarge?.copyWith(
              fontWeight: FontWeight.w500,
              height: 1.35,
            ),
          ),
          const SizedBox(height: 14),
          Text(project.overview, style: theme.bodyLarge),
          const SizedBox(height: 18),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: project.tech
                .take(7)
                .map((t) => _TechChip(label: t, accent: accent))
                .toList(),
          ),
          const SizedBox(height: 22),
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: [
              TextButton.icon(
                onPressed: () => setState(() => _expanded = !_expanded),
                icon: AnimatedRotation(
                  turns: _expanded ? 0.5 : 0,
                  duration: const Duration(milliseconds: 200),
                  child: const Icon(Icons.expand_more_rounded),
                ),
                label: Text(_expanded ? 'Hide details' : 'Features & stack'),
                style: TextButton.styleFrom(foregroundColor: AppColors.tealDeep),
              ),
              if (project.githubUrl != null)
                FilledButton.tonalIcon(
                  onPressed: () => openExternalUrl(project.githubUrl!),
                  icon: const Icon(Icons.code_rounded, size: 16),
                  label: const Text('View on GitHub'),
                  style: FilledButton.styleFrom(
                    foregroundColor: AppColors.ink,
                    backgroundColor: AppColors.sand.withValues(alpha: 0.65),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),
                  ),
                ),
            ],
          ),
          AnimatedSize(
            duration: const Duration(milliseconds: 280),
            curve: Curves.easeOutCubic,
            alignment: Alignment.topCenter,
            child: _expanded
                ? _ExpandedDetails(project: project, accent: accent)
                : const SizedBox(width: double.infinity),
          ),
        ],
      ),
    );
  }
}

class _AccentRail extends StatelessWidget {
  const _AccentRail({
    required this.accent,
    required this.index,
    required this.name,
    required this.stack,
  });

  final Color accent;
  final int index;
  final String name;
  final String stack;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 148,
      constraints: const BoxConstraints(minHeight: 280),
      padding: const EdgeInsets.fromLTRB(22, 28, 18, 28),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            accent,
            Color.lerp(accent, AppColors.ink, 0.35)!,
          ],
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            index.toString().padLeft(2, '0'),
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  color: AppColors.paper.withValues(alpha: 0.9),
                ),
          ),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: AppColors.paper.withValues(alpha: 0.18),
              borderRadius: BorderRadius.circular(999),
            ),
            child: Text(
              stack,
              style: Theme.of(context).textTheme.labelLarge?.copyWith(
                    color: AppColors.paper,
                    fontSize: 10,
                    letterSpacing: 0.4,
                  ),
            ),
          ),
          const SizedBox(height: 48),
          Text(
            name,
            style: Theme.of(context).textTheme.labelLarge?.copyWith(
                  color: AppColors.paper.withValues(alpha: 0.9),
                  letterSpacing: 0.4,
                  fontSize: 12,
                  height: 1.3,
                ),
          ),
        ],
      ),
    );
  }
}

class _ExpandedDetails extends StatelessWidget {
  const _ExpandedDetails({required this.project, required this.accent});

  final AppProject project;
  final Color accent;

  @override
  Widget build(BuildContext context) {
    final wide = MediaQuery.sizeOf(context).width >= 900;

    return Padding(
      padding: const EdgeInsets.only(top: 12),
      child: wide
          ? Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: _FeatureList(title: 'Features', items: project.features),
                ),
                const SizedBox(width: 28),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _FeatureList(title: 'Tech stack', items: project.tech),
                      const SizedBox(height: 24),
                      _FeatureList(
                        title: 'Highlights',
                        items: project.highlights,
                        bulletColor: accent,
                      ),
                    ],
                  ),
                ),
              ],
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _FeatureList(title: 'Features', items: project.features),
                const SizedBox(height: 22),
                _FeatureList(title: 'Tech stack', items: project.tech),
                const SizedBox(height: 22),
                _FeatureList(
                  title: 'Highlights',
                  items: project.highlights,
                  bulletColor: accent,
                ),
              ],
            ),
    );
  }
}

class _FeatureList extends StatelessWidget {
  const _FeatureList({
    required this.title,
    required this.items,
    this.bulletColor = AppColors.teal,
  });

  final String title;
  final List<String> items;
  final Color bulletColor;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title.toUpperCase(),
          style: theme.labelLarge?.copyWith(
            color: AppColors.muted,
            letterSpacing: 1.2,
            fontSize: 11,
          ),
        ),
        const SizedBox(height: 12),
        ...items.map(
          (item) => Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 7),
                  child: Container(
                    width: 6,
                    height: 6,
                    decoration: BoxDecoration(
                      color: bulletColor,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(child: Text(item, style: theme.bodyMedium)),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _MetaPill extends StatelessWidget {
  const _MetaPill({required this.label, required this.color});

  final String label;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(999),
        border: Border.all(color: color.withValues(alpha: 0.35)),
      ),
      child: Text(
        label,
        style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: color,
              fontWeight: FontWeight.w700,
              fontSize: 11,
            ),
      ),
    );
  }
}

class _TechChip extends StatelessWidget {
  const _TechChip({required this.label, required this.accent});

  final String label;
  final Color accent;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
      color: accent.withValues(alpha: 0.08),
      child: Text(
        label,
        style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: AppColors.inkSoft,
              fontWeight: FontWeight.w600,
            ),
      ),
    );
  }
}
