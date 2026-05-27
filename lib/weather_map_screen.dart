import 'package:flutter/material.dart';
import 'services/preferences_service.dart';
import 'package:flutter/foundation.dart';
import 'l10n/app_localizations.dart';

// Conditional imports to prevent Mapbox SDK crashes on Web
// This ensures that the 'mapbox_maps_flutter' package is NEVER loaded in the browser.
import 'ui/weather_map_view_mobile.dart'
    if (dart.library.html) 'ui/weather_map_view_web.dart';

class WeatherMapScreen extends StatefulWidget {
  final double initialLat;
  final double initialLng;

  const WeatherMapScreen({
    super.key,
    this.initialLat = 0,
    this.initialLng = 0,
  });

  @override
  State<WeatherMapScreen> createState() => _WeatherMapScreenState();
}

class _WeatherMapScreenState extends State<WeatherMapScreen> {
  bool _settingsLoaded = false;
  double _radarOpacity = 0.7;

  @override
  void initState() {
    super.initState();
    _loadSettings();
  }

  Future<void> _loadSettings() async {
    final opacity = await PreferencesService.loadMapRadarOpacity();
    if (mounted) {
      setState(() {
        _radarOpacity = opacity;
        _settingsLoaded = true;
      });
    }
  }

  void _showSettings() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setModalState) {
            return Container(
              padding: const EdgeInsets.all(24),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(AppLocalizations.of(context)!.mapSettings, style: Theme.of(context).textTheme.headlineSmall),
                  const SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: Text(AppLocalizations.of(context)!.radarOpacity, style: Theme.of(context).textTheme.labelLarge),
                  ),
                  Slider(
                    value: _radarOpacity,
                    onChanged: (val) {
                      setModalState(() => _radarOpacity = val);
                      setState(() => _radarOpacity = val);
                      PreferencesService.saveMapRadarOpacity(val);
                    },
                  ),
                  const Divider(),
                  ListTile(
                    leading: const Icon(Icons.info_outline),
                    title: Text(AppLocalizations.of(context)!.dataSources),
                    onTap: () {
                      Navigator.pop(context);
                      _showSources();
                    },
                  ),
                ],
              ),
            );
          }
        );
      },
    );
  }

  void _showSources() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(AppLocalizations.of(context)!.dataSources),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(AppLocalizations.of(context)!.mapLayers, style: const TextStyle(fontWeight: FontWeight.bold)),
            Text(AppLocalizations.of(context)!.baseMapsMapbox),
            const SizedBox(height: 12),
            Text(AppLocalizations.of(context)!.weatherData, style: const TextStyle(fontWeight: FontWeight.bold)),
            Text(AppLocalizations.of(context)!.livePrecipitationRainviewer),
            const SizedBox(height: 12),
            Text(AppLocalizations.of(context)!.attribution, style: const TextStyle(fontWeight: FontWeight.bold)),
            Text(AppLocalizations.of(context)!.attributionText),
          ],
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: Text(AppLocalizations.of(context)!.close)),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.weatherMap),
        actions: [
          if (!kIsWeb)
            IconButton(
              icon: const Icon(Icons.settings_rounded),
              onPressed: _showSettings,
            ),
        ],
      ),
      body: _settingsLoaded
          ? WeatherMapView(
              initialLat: widget.initialLat,
              initialLng: widget.initialLng,
              radarOpacity: _radarOpacity,
            )
          : const Center(child: CircularProgressIndicator()),
    );
  }
}
