import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../webview_screen.dart';

class OpenMeteoAttribution extends StatefulWidget {
  const OpenMeteoAttribution({
    super.key,
    this.padding = const EdgeInsets.fromLTRB(16, 24, 16, 0),
    this.source = 'open-meteo',
  });

  final EdgeInsetsGeometry padding;
  final String source;

  @override
  State<OpenMeteoAttribution> createState() => _OpenMeteoAttributionState();
}

class _OpenMeteoAttributionState extends State<OpenMeteoAttribution> {
  late TapGestureRecognizer _tapGestureRecognizer;

  static const String _omHomeUrl = 'https://open-meteo.com/';
  static const String _omDocsUrl = 'https://open-meteo.com/en/docs';
  static const String _omTermsUrl = 'https://open-meteo.com/en/terms';

  static const String _neaUrl = 'https://www.nea.gov.sg/';
  static const String _dataGovUrl = 'https://data.gov.sg/';
  static const String _licenceUrl = 'https://data.gov.sg/open-data-licence';

  @override
  void initState() {
    super.initState();
    _tapGestureRecognizer = TapGestureRecognizer();
  }

  @override
  void dispose() {
    _tapGestureRecognizer.dispose();
    super.dispose();
  }

  void _openLink(String url) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => WebViewScreen(url: url)),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isNea = widget.source == 'nea';
    final deviceDate = DateFormat('d MMMM yyyy').format(DateTime.now());

    return Padding(
      padding: widget.padding,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (isNea)
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text:
                            'Contains information from 2-hour Weather Forecast, 24-hour Weather Forecast, 4-day Weather Forecast, Air Temperature across Singapore, Rainfall across Singapore, Relative Humidity across Singapore, Wind Speed across Singapore, and Pollutant Standards Index (PSI) accessed on $deviceDate from the National Environment Agency which is made available under the terms of the ',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      TextSpan(
                        text: 'Singapore Open Data Licence version 1.0',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Theme.of(context).colorScheme.primary,
                          decoration: TextDecoration.underline,
                          fontWeight: FontWeight.bold,
                        ),
                        recognizer: _tapGestureRecognizer
                          ..onTap = () => _openLink(_licenceUrl),
                      ),
                      TextSpan(
                        text: '.',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  ),
                )
              else
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
                children: isNea
                    ? [
                        ActionChip(
                          label: const Text('NEA Website'),
                          avatar: const Icon(Icons.public, size: 16),
                          onPressed: () => _openLink(_neaUrl),
                        ),
                        ActionChip(
                          label: const Text('Data.gov.sg'),
                          avatar: const Icon(
                            Icons.menu_book_outlined,
                            size: 16,
                          ),
                          onPressed: () => _openLink(_dataGovUrl),
                        ),
                      ]
                    : [
                        ActionChip(
                          label: const Text('Website'),
                          avatar: const Icon(Icons.public, size: 16),
                          onPressed: () => _openLink(_omHomeUrl),
                        ),
                        ActionChip(
                          label: const Text('API Docs'),
                          avatar: const Icon(
                            Icons.menu_book_outlined,
                            size: 16,
                          ),
                          onPressed: () => _openLink(_omDocsUrl),
                        ),
                        ActionChip(
                          label: const Text('Terms'),
                          avatar: const Icon(Icons.gavel_outlined, size: 16),
                          onPressed: () => _openLink(_omTermsUrl),
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
