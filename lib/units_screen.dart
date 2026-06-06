// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:m3e_core/m3e_core.dart';
import 'package:weatherfast/services/global_data.dart';
import 'package:weatherfast/services/preferences_service.dart';
import 'package:weatherfast/services/widget_refresh_service.dart';

class UnitsScreen extends StatefulWidget {
  const UnitsScreen({super.key});

  @override
  State<UnitsScreen> createState() => _UnitsScreenState();
}

class _UnitsScreenState extends State<UnitsScreen> {
  late bool _useFahrenheit;
  late String _windUnit;
  late String _visibilityUnit;

  @override
  void initState() {
    super.initState();
    _useFahrenheit = GlobalData.useFahrenheit;
    _windUnit = GlobalData.windUnit;
    _visibilityUnit = GlobalData.visibilityUnit;
  }

  void _setTemperatureUnit(bool useFahrenheit) {
    setState(() {
      _useFahrenheit = useFahrenheit;
      GlobalData.useFahrenheit = useFahrenheit;
    });
    PreferencesService.saveUseFahrenheit(useFahrenheit);
    WidgetRefreshService.refreshFromBackground(); // Fire asynchronously
  }

  void _setWindUnit(String unit) {
    setState(() {
      _windUnit = unit;
      GlobalData.windUnit = unit;
    });
    PreferencesService.saveWindUnit(unit);
    WidgetRefreshService.refreshFromBackground(); // Fire asynchronously
  }

  void _setVisibilityUnit(String unit) {
    setState(() {
      _visibilityUnit = unit;
      GlobalData.visibilityUnit = unit;
    });
    PreferencesService.saveVisibilityUnit(unit);
    WidgetRefreshService.refreshFromBackground(); // Fire asynchronously
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final cardTheme = Theme.of(context).cardTheme;
    final cardColor = ElevationOverlay.applySurfaceTint(
      cardTheme.color ?? Theme.of(context).colorScheme.surface,
      cardTheme.surfaceTintColor,
      cardTheme.elevation ?? 2.0,
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Units'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          Text(
            'Temperature',
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
              color: colorScheme.primary,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          M3ECardColumn(
            padding: EdgeInsets.zero,
            innerRadius: 12.0,
            color: cardColor,
            children: [
                RadioListTile<bool>(
                  title: const Text('Celsius (°C)'),
                  value: false,
                  groupValue: _useFahrenheit,
                  onChanged: (val) => _setTemperatureUnit(val!),
                ),
                RadioListTile<bool>(
                  title: const Text('Fahrenheit (°F)'),
                  value: true,
                  groupValue: _useFahrenheit,
                  onChanged: (val) => _setTemperatureUnit(val!),
                ),
            ],
          ),
          const SizedBox(height: 24),

          Text(
            'Wind Speed',
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
              color: colorScheme.primary,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          M3ECardColumn(
            padding: EdgeInsets.zero,
            innerRadius: 12.0,
            color: cardColor,
            children: [
                RadioListTile<String>(
                  title: const Text('km/h'),
                  value: 'km/h',
                  groupValue: _windUnit,
                  onChanged: (val) => _setWindUnit(val!),
                ),
                RadioListTile<String>(
                  title: const Text('mph'),
                  value: 'mph',
                  groupValue: _windUnit,
                  onChanged: (val) => _setWindUnit(val!),
                ),
                RadioListTile<String>(
                  title: const Text('m/s'),
                  value: 'm/s',
                  groupValue: _windUnit,
                  onChanged: (val) => _setWindUnit(val!),
                ),
                RadioListTile<String>(
                  title: const Text('knots'),
                  value: 'knots',
                  groupValue: _windUnit,
                  onChanged: (val) => _setWindUnit(val!),
                ),
            ],
          ),
          const SizedBox(height: 24),

          Text(
            'Visibility',
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
              color: colorScheme.primary,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          M3ECardColumn(
            padding: EdgeInsets.zero,
            innerRadius: 12.0,
            color: cardColor,
            children: [
                RadioListTile<String>(
                  title: const Text('Kilometers (km)'),
                  value: 'km',
                  groupValue: _visibilityUnit,
                  onChanged: (val) => _setVisibilityUnit(val!),
                ),
                RadioListTile<String>(
                  title: const Text('Miles (mi)'),
                  value: 'mi',
                  groupValue: _visibilityUnit,
                  onChanged: (val) => _setVisibilityUnit(val!),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
