import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:portfolio/main.dart';
import 'package:visibility_detector/visibility_detector.dart';

void main() {
  setUp(() {
    VisibilityDetectorController.instance.updateInterval = Duration.zero;
  });

  testWidgets('Portfolio shows RN and Flutter projects', (tester) async {
    await tester.binding.setSurfaceSize(const Size(1280, 4000));
    addTearDown(() => tester.binding.setSurfaceSize(null));

    await tester.pumpWidget(const PortfolioApp());
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 1600));

    expect(find.textContaining('Pan Myint Mo'), findsWidgets);
    expect(find.textContaining('Powerhouse'), findsWidgets);
    expect(find.textContaining('Piti Pass'), findsWidgets);
    expect(find.text('Dermaluxe'), findsWidgets);
    expect(find.textContaining('React Native'), findsWidgets);
  });
}
