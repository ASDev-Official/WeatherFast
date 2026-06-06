import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:weatherfast/help_screen.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'services/global_data.dart';
import 'services/preferences_service.dart';
import 'services/widget_refresh_service.dart';
import 'services/rating_service.dart';
import 'l10n/app_localizations.dart';
import 'webview_screen.dart';
import 'units_screen.dart';
class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  late bool _performanceMode;
  bool _isRefreshingWidgets = false;

  @override
  void initState() {
    super.initState();
    _performanceMode = GlobalData.performanceModeNotifier.value;
  }

  Future<void> _togglePerformanceMode(bool value) async {
    await PreferencesService.savePerformanceMode(value);
    setState(() {
      _performanceMode = value;
      GlobalData.performanceModeNotifier.value = value;
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
      ).showSnackBar(SnackBar(content: Text(AppLocalizations.of(context)!.widgetsRefreshed)));
    } catch (error) {
      if (!mounted) {
        return;
      }

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(AppLocalizations.of(context)!.widgetRefreshFailed(error.toString()))));
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

  String _getLanguageName(String? code, BuildContext context) {
    if (code == null) return AppLocalizations.of(context)!.systemDefault;
    return _languageNames[code] ?? code;
  }

  Future<Map<String, double>> _fetchWeblateStats() async {
    try {
      final response = await http.get(Uri.parse('https://hosted.weblate.org/api/components/asdev-weatherfast/app/statistics/'));
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final results = data['results'] as List;
        final map = <String, double>{};
        for (final r in results) {
          final code = r['code'] as String;
          final langCode = code.split('_')[0];
          map[langCode] = (r['translated_percent'] as num).toDouble();
        }
        return map;
      }
    } catch (e) {
      // ignore errors
    }
    return {};
  }

  Future<void> _selectLanguage() async {
    final currentLang = GlobalData.languageCodeNotifier.value ?? 'system';
    final statsFuture = _fetchWeblateStats();
    
    final selected = await showDialog<String>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(AppLocalizations.of(context)!.language),
          contentPadding: const EdgeInsets.only(top: 16),
          content: FutureBuilder<Map<String, double>>(
            future: statsFuture,
            builder: (context, snapshot) {
              final stats = snapshot.data ?? {};
              
              Widget buildSubtitle(double? percent) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 4.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(2),
                            child: const LinearProgressIndicator(
                              minHeight: 4,
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          '--%',
                          style: Theme.of(context).textTheme.labelSmall?.copyWith(
                            color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.6),
                          ),
                        ),
                      ],
                    ),
                  );
                } else if (percent != null) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 4.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(2),
                            child: LinearProgressIndicator(
                              value: percent / 100,
                              minHeight: 4,
                              color: percent == 100 ? Colors.green : Theme.of(context).colorScheme.primary,
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          '${percent.toInt()}%',
                          style: Theme.of(context).textTheme.labelSmall?.copyWith(
                            color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.6),
                          ),
                        ),
                      ],
                    ),
                  );
                } else {
                  return Padding(
                    padding: const EdgeInsets.only(top: 4.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(2),
                            child: LinearProgressIndicator(
                              value: 0,
                              minHeight: 4,
                              color: Theme.of(context).colorScheme.primary,
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          '0%',
                          style: Theme.of(context).textTheme.labelSmall?.copyWith(
                            color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.6),
                          ),
                        ),
                      ],
                    ),
                  );
                }
              }

              final systemLangCode = WidgetsBinding.instance.platformDispatcher.locale.languageCode;
              final systemPercent = stats[systemLangCode];

              return SizedBox(
                width: double.maxFinite,
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    ListTile(
                      title: Text(AppLocalizations.of(context)!.systemDefault),
                      subtitle: buildSubtitle(systemPercent),
                      trailing: currentLang == 'system' ? Icon(Icons.check_rounded, color: Theme.of(context).colorScheme.primary) : null,
                      onTap: () => Navigator.pop(context, 'system'),
                    ),
                    ...AppLocalizations.supportedLocales.map((locale) {
                      final code = locale.languageCode;
                      final name = _languageNames[code] ?? code;
                      final percent = stats[code];

                      return ListTile(
                        title: Text(name),
                        subtitle: buildSubtitle(percent),
                        trailing: currentLang == code ? Icon(Icons.check_rounded, color: Theme.of(context).colorScheme.primary) : null,
                        onTap: () => Navigator.pop(context, code),
                      );
                    }),
                  ],
                ),
              );
            },
          ),
        );
      },
    );

    if (selected != null && selected != currentLang) {
      final codeToSave = selected == 'system' ? null : selected;
      await PreferencesService.saveLanguageCode(codeToSave);
      GlobalData.languageCodeNotifier.value = codeToSave;
      if (mounted) setState(() {});

      final stats = await statsFuture;
      final percent = stats[selected];
      
      if (percent != null && percent < 75 && mounted) {
        final languageName = _languageNames[selected] ?? selected;
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text(AppLocalizations.of(context)!.language),
              content: Text(AppLocalizations.of(context)!.incompleteLocalisationMessage(languageName)),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                    launchUrl(
                      Uri.parse('https://hosted.weblate.org/engage/asdev-shopsync/'),
                      mode: LaunchMode.externalApplication,
                    );
                  },
                  child: Text(AppLocalizations.of(context)!.helpLocalizeWeatherFast),
                ),
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text(AppLocalizations.of(context)!.ok),
                ),
              ],
            );
          },
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar.large(title: Text(AppLocalizations.of(context)!.settings), pinned: true),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Preferences Section
                  Text(
                    AppLocalizations.of(context)!.preferences,
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
                              color: colorScheme.tertiaryContainer,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Icon(
                              Icons.thermostat_rounded,
                              color: colorScheme.onTertiaryContainer,
                            ),
                          ),
                          title: const Text('Units'),
                          subtitle: const Text('Temperature, Wind, Visibility'),
                          trailing: const Icon(Icons.chevron_right_rounded),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => const UnitsScreen(),
                              ),
                            );
                          },
                        ),
                        const Divider(height: 1),
                        SwitchListTile(
                          secondary: Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: colorScheme.tertiaryContainer,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Icon(
                              Icons.speed_rounded,
                              color: colorScheme.onTertiaryContainer,
                            ),
                          ),
                          title: const Text('Performance Mode'),
                          subtitle: const Text('Disable extra visual effects'),
                          value: _performanceMode,
                          onChanged: _togglePerformanceMode,
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
                          title: Text(AppLocalizations.of(context)!.language),
                          subtitle: Text(_getLanguageName(GlobalData.languageCodeNotifier.value, context)),
                          trailing: const Icon(Icons.chevron_right_rounded),
                          onTap: _selectLanguage,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),

                  // About Section
                  Text(
                    AppLocalizations.of(context)!.about,
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
                          title: Text(AppLocalizations.of(context)!.openSourceLicenses),
                          subtitle: FutureBuilder<PackageInfo>(
                            future: PackageInfo.fromPlatform(),
                            builder: (context, snapshot) {
                              return Text(
                                "${AppLocalizations.of(context)!.viewLicensesForOpenSourcePackages}"
                                "${snapshot.hasData ? AppLocalizations.of(context)!.usedInWeatherFastVersion(snapshot.data!.version) : ''}.",
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
                      AppLocalizations.of(context)!.debug,
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
                        title: Text(AppLocalizations.of(context)!.forceRefreshWidgets),
                        subtitle: Text(
                          AppLocalizations.of(context)!.reloadWidgetDataWarning,
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
                        title: Text(AppLocalizations.of(context)!.testRatingBottomSheet),
                        subtitle: Text(AppLocalizations.of(context)!.simulateSuccessfulWeatherFetchTrigger),
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
                        title: Text(AppLocalizations.of(context)!.resetRatingPreferences),
                        subtitle: Text(AppLocalizations.of(context)!.resetShownCountAndTimestamps),
                        trailing: const Icon(Icons.chevron_right_rounded),
                        onTap: () async {
                          await RatingService.resetRatingPreferences();
                          if (context.mounted) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text(AppLocalizations.of(context)!.ratingPreferencesReset)),
                            );
                          }
                        },
                      ),
                    ),
                    const SizedBox(height: 24),
                  ],

                  // Support Section
                  Text(
                    AppLocalizations.of(context)!.support,
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
                          title: Text(AppLocalizations.of(context)!.systemStatus),
                          subtitle: Text(AppLocalizations.of(context)!.checkOperationalStatusOfServices),
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
                          title: Text(AppLocalizations.of(context)!.helpAndFeedback),
                          subtitle: Text(AppLocalizations.of(context)!.getHelpOrSendFeedback),
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
                              AppLocalizations.of(context)!.versionBuildNumber(snapshot.data!.version, snapshot.data!.buildNumber),
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
