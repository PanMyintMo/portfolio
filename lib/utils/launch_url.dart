import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> openExternalUrl(String url) async {
  try {
    final uri = Uri.parse(url);

    if (!uri.hasScheme) {
      throw FormatException('Invalid URL: $url');
    }

    final success = await launchUrl(uri, mode: LaunchMode.externalApplication);

    if (!success) {
      debugPrint('Could not launch URL: $url');
    }
  } catch (e) {
    debugPrint('URL launch error: $e');
  }
}
