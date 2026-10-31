import 'package:flutter/material.dart';
import 'package:portfolio/theme/app_theme.dart';
import 'package:portfolio/widgets/about_section.dart';
import 'package:portfolio/widgets/contact_section.dart';
import 'package:portfolio/widgets/hero_section.dart';
import 'package:portfolio/widgets/project_section.dart';
import 'package:portfolio/widgets/site_nav.dart';
import 'package:portfolio/widgets/stats_section.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _scrollController = ScrollController();
  final _workKey = GlobalKey();
  final _aboutKey = GlobalKey();
  final _contactKey = GlobalKey();
  bool _navElevated = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    final elevated = _scrollController.offset > 12;
    if (elevated != _navElevated) {
      setState(() => _navElevated = elevated);
    }
  }

  Future<void> _scrollTo(GlobalKey key) async {
    final target = key.currentContext;
    if (target == null) return;
    await Scrollable.ensureVisible(
      target,
      duration: const Duration(milliseconds: 650),
      curve: Curves.easeInOutCubic,
      alignment: 0.02,
    );
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_onScroll)
      ..dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.paper,
      body: Column(
        children: [
          SiteNav(
            elevated: _navElevated,
            onWork: () => _scrollTo(_workKey),
            onAbout: () => _scrollTo(_aboutKey),
            onContact: () => _scrollTo(_contactKey),
          ),
          Expanded(
            child: SingleChildScrollView(
              controller: _scrollController,
              child: Column(
                children: [
                  HeroSection(
                    onViewWork: () => _scrollTo(_workKey),
                    onContact: () => _scrollTo(_contactKey),
                  ),
                  const StatsSection(),
                  KeyedSubtree(
                    key: _workKey,
                    child: const ProjectSection(),
                  ),
                  KeyedSubtree(
                    key: _aboutKey,
                    child: const AboutSection(),
                  ),
                  KeyedSubtree(
                    key: _contactKey,
                    child: const ContactSection(),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
