import 'package:flutter/material.dart';

import '../webview_screen.dart';

class OpenMeteoAttribution extends StatelessWidget {
  const OpenMeteoAttribution({
    super.key,
    this.padding = const EdgeInsets.symmetric(horizontal: 16),
  });

  final EdgeInsetsGeometry padding;

  static const String _homeUrl = 'https://open-meteo.com/';
  static const String _docsUrl = 'https://open-meteo.com/en/docs';
  static const String _termsUrl = 'https://open-meteo.com/en/terms';

  static void _openLink(BuildContext context, String url) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => WebViewScreen(url: url)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Card(
        margin: const EdgeInsets.only(top: 4, bottom: 8),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Weather data provided by Open-Meteo',
                style: Theme.of(
                  context,
                ).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 8),
              Wrap(
                spacing: 8,
                runSpacing: 6,
                children: [
                  ActionChip(
                    label: const Text('Website'),
                    avatar: const Icon(Icons.public, size: 16),
                    onPressed: () => _openLink(context, _homeUrl),
                  ),
                  ActionChip(
                    label: const Text('API Docs'),
                    avatar: const Icon(Icons.menu_book_outlined, size: 16),
                    onPressed: () => _openLink(context, _docsUrl),
                  ),
                  ActionChip(
                    label: const Text('Terms'),
                    avatar: const Icon(Icons.gavel_outlined, size: 16),
                    onPressed: () => _openLink(context, _termsUrl),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
