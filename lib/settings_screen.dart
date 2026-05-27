import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:weatherfast/help_screen.dart';
import 'package:package_info_plus/package_info_plus.dart';

import 'services/global_data.dart';
import 'services/preferences_service.dart';
import 'services/widget_refresh_service.dart';
import 'services/rating_service.dart';
import 'l10n/app_localizations.dart';
import 'webview_screen.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  late bool _useFahrenheit;
  bool _isRefreshingWidgets = false;

  @override
  void initState() {
    super.initState();
    _useFahrenheit = GlobalData.useFahrenheit;
  }

  Future<void> _toggleUnit(bool value) async {
    await PreferencesService.saveUseFahrenheit(value);
    await WidgetRefreshService.refreshFromBackground();
    setState(() {
      _useFahrenheit = value;
      GlobalData.useFahrenheit = value;
    });
  }


  Future<void> _forceRefreshWidgets() async {
    if (_isRefreshingWidgets) {
      return;
    }

    setState(() {
      _isRefreshingWidgets = true;
    });

    try {
      await WidgetRefreshService.refreshFromBackground();
      if (!mounted) {
        return;
      }

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Widgets refreshed')));
    } catch (error) {
      if (!mounted) {
        return;
      }

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Widget refresh failed: $error')));
    } finally {
      if (mounted) {
        setState(() {
          _isRefreshingWidgets = false;
        });
      }
    }
  }

  final Map<String, String> _languageNames = {
    'system': 'System Default',
    'en': 'English',
    'ar': 'العربية',
    'da': 'Dansk',
    'de': 'Deutsch',
    'es': 'Español',
    'fi': 'Suomi',
    'fr': 'Français',
    'hi': 'हिंदी',
    'id': 'Bahasa Indonesia',
    'it': 'Italiano',
    'ja': '日本語',
    'ko': '한국어',
    'ms': 'Bahasa Melayu',
    'nb': 'Norsk bokmål',
    'nl': 'Nederlands',
    'pt': 'Português',
    'ru': 'Русский',
    'sv': 'Svenska',
    'th': 'ไทย',
    'tl': 'Tagalog',
    'vi': 'Tiếng Việt',
    'zh': '中文',
  };

  String _getLanguageName(String? code) {
    if (code == null) return 'System Default';
    return _languageNames[code] ?? code;
  }

  Future<void> _selectLanguage() async {
    final currentLang = GlobalData.languageCodeNotifier.value ?? 'system';
    
    final selected = await showDialog<String>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Language'),
          contentPadding: const EdgeInsets.only(top: 16),
          content: SizedBox(
            width: double.maxFinite,
            child: ListView(
              shrinkWrap: true,
              children: [
                ListTile(
                  title: const Text('System Default'),
                  trailing: currentLang == 'system' ? Icon(Icons.check_rounded, color: Theme.of(context).colorScheme.primary) : null,
                  onTap: () => Navigator.pop(context, 'system'),
                ),
                ...AppLocalizations.supportedLocales.map((locale) {
                  final code = locale.languageCode;
                  final name = _languageNames[code] ?? code;
                  return ListTile(
                    title: Text(name),
                    trailing: currentLang == code ? Icon(Icons.check_rounded, color: Theme.of(context).colorScheme.primary) : null,
                    onTap: () => Navigator.pop(context, code),
                  );
                }),
              ],
            ),
          ),
        );
      },
    );

    if (selected != null && selected != currentLang) {
      final codeToSave = selected == 'system' ? null : selected;
      await PreferencesService.saveLanguageCode(codeToSave);
      GlobalData.languageCodeNotifier.value = codeToSave;
      if (mounted) setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar.large(title: const Text('Settings'), pinned: true),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Preferences Section
                  Text(
                    'Preferences',
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      color: colorScheme.primary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Card(
                    child: Column(
                      children: [
                        SwitchListTile(
                          secondary: Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: colorScheme.tertiaryContainer,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Icon(
                              Icons.thermostat_rounded,
                              color: colorScheme.onTertiaryContainer,
                            ),
                          ),
                          title: const Text('Use Fahrenheit'),
                          subtitle: Text(
                            _useFahrenheit ? 'Showing °F' : 'Showing °C',
                          ),
                          value: _useFahrenheit,
                          onChanged: _toggleUnit,
                        ),
                        const Divider(height: 1),
                        ListTile(
                          leading: Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: colorScheme.tertiaryContainer,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Icon(
                              Icons.language_rounded,
                              color: colorScheme.onTertiaryContainer,
                            ),
                          ),
                          title: const Text('Language'),
                          subtitle: Text(_getLanguageName(GlobalData.languageCodeNotifier.value)),
                          trailing: const Icon(Icons.chevron_right_rounded),
                          onTap: _selectLanguage,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),

                  // About Section
                  Text(
                    'About',
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      color: colorScheme.primary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Card(
                    child: Column(
                      children: [
                        ListTile(
                          leading: Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: colorScheme.primaryContainer,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Icon(
                              Icons.info_outline_rounded,
                              color: colorScheme.onPrimaryContainer,
                            ),
                          ),
                          title: const Text('Open-Source Licenses'),
                          subtitle: FutureBuilder<PackageInfo>(
                            future: PackageInfo.fromPlatform(),
                            builder: (context, snapshot) {
                              return Text(
                                "View licenses for open-source packages"
                                "${snapshot.hasData ? ' used in WeatherFast ${snapshot.data!.version}' : ''}.",
                              );
                            },
                          ),
                          trailing: const Icon(Icons.chevron_right_rounded),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => Theme(
                                  data: Theme.of(context),
                                  child: const LicensePage(
                                    applicationName: 'WeatherFast',
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 12),
                  const SizedBox(height: 24),

                  if (kDebugMode) ...[
                    Text(
                      'Debug',
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        color: colorScheme.primary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Card(
                      child: ListTile(
                        leading: Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: colorScheme.errorContainer,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Icon(
                            Icons.sync_rounded,
                            color: colorScheme.onErrorContainer,
                          ),
                        ),
                        title: const Text('Force refresh widgets'),
                        subtitle: const Text(
                          'Reload widget data (USE SPARINGLY!!!)',
                        ),
                        trailing: _isRefreshingWidgets
                            ? const SizedBox(
                                height: 20,
                                width: 20,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                ),
                              )
                            : const Icon(Icons.chevron_right_rounded),
                        onTap: _isRefreshingWidgets
                            ? null
                            : _forceRefreshWidgets,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Card(
                      child: ListTile(
                        leading: Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: colorScheme.errorContainer,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Icon(
                            Icons.star_rate_rounded,
                            color: colorScheme.onErrorContainer,
                          ),
                        ),
                        title: const Text('Test Rating Bottom Sheet'),
                        subtitle: const Text('Simulate successful weather fetch trigger'),
                        trailing: const Icon(Icons.chevron_right_rounded),
                        onTap: () async {
                          await RatingService.debugFastForwardTime();
                          if (context.mounted) {
                            RatingService.checkAndShowRating(context);
                          }
                        },
                      ),
                    ),
                    const SizedBox(height: 12),
                    Card(
                      child: ListTile(
                        leading: Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: colorScheme.errorContainer,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Icon(
                            Icons.restore_rounded,
                            color: colorScheme.onErrorContainer,
                          ),
                        ),
                        title: const Text('Reset Rating Preferences'),
                        subtitle: const Text('Reset shown count and timestamps'),
                        trailing: const Icon(Icons.chevron_right_rounded),
                        onTap: () async {
                          await RatingService.resetRatingPreferences();
                          if (context.mounted) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Rating preferences reset')),
                            );
                          }
                        },
                      ),
                    ),
                    const SizedBox(height: 24),
                  ],

                  // Support Section
                  Text(
                    'Support',
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      color: colorScheme.primary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Card(
                    child: Column(
                      children: [
                        ListTile(
                          leading: Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: colorScheme.secondaryContainer,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Icon(
                              Icons.monitor_heart_outlined,
                              color: colorScheme.onSecondaryContainer,
                            ),
                          ),
                          title: const Text('System Status'),
                          subtitle: const Text('Check the operational status of services'),
                          trailing: const Icon(Icons.chevron_right_rounded),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => const WebViewScreen(url: 'https://status.weatherfast.aadish.dev'),
                              ),
                            );
                          },
                        ),
                        const Divider(height: 1),
                        ListTile(
                          leading: Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: colorScheme.secondaryContainer,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Icon(
                              Icons.help_outline_rounded,
                              color: colorScheme.onSecondaryContainer,
                            ),
                          ),
                          title: const Text('Help & Feedback'),
                          subtitle: const Text('Get help or send feedback'),
                          trailing: const Icon(Icons.chevron_right_rounded),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => const HelpScreen(),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 40),

                  // Footer
                  Center(
                    child: Column(
                      children: [
                        Icon(
                          Icons.cloud_outlined,
                          size: 48,
                          color: colorScheme.onSurface.withValues(alpha: 0.3),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'WeatherFast',
                          style: Theme.of(context).textTheme.bodyMedium
                              ?.copyWith(
                                color: colorScheme.onSurface.withValues(
                                  alpha: 0.6,
                                ),
                                fontWeight: FontWeight.w500,
                              ),
                        ),
                        const SizedBox(height: 4),
                        FutureBuilder<PackageInfo>(
                          future: PackageInfo.fromPlatform(),
                          builder: (context, snapshot) {
                            if (!snapshot.hasData) {
                              return const SizedBox.shrink();
                            }
                            return Text(
                              'Version ${snapshot.data!.version} (${snapshot.data!.buildNumber})',
                              style: Theme.of(context).textTheme.bodySmall
                                  ?.copyWith(
                                    color: colorScheme.onSurface.withValues(
                                      alpha: 0.5,
                                    ),
                                  ),
                            );
                          },
                        ),
                      ],
                    ),
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
