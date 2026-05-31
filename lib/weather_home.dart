import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:geolocator/geolocator.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:skeletonizer/skeletonizer.dart';

import 'l10n/app_localizations.dart';
import 'notifications_screen.dart';
import 'services/global_data.dart';
import 'services/preferences_service.dart';
import 'services/rating_service.dart';
import 'services/weather_cache_service.dart';
import 'services/widget_refresh_service.dart';
import 'time_utils.dart';
import 'ui/animated_weather_backdrop.dart';
import 'ui/daily_range_tile.dart';
import 'ui/open_meteo_attribution.dart';
import 'ui/weather_map_snippet.dart';
import 'weather_map_screen.dart';
import 'weather_service.dart';
import 'weather_service_sg.dart';

class WeatherHome extends StatefulWidget {
  const WeatherHome({super.key, required this.onLocationSelected});

  final Function(String) onLocationSelected;

  @override
  State<WeatherHome> createState() => _WeatherHomeState();
}

class _WeatherHomeState extends State<WeatherHome> {
  OverlayEntry? _updatingOverlay;
  final _weatherService = WeatherService();
  final TextEditingController _searchController = TextEditingController();

  String? _currentLocation;
  String? _currentLocationQuery;
  Map<String, dynamic>? _weatherData;
  Map<String, dynamic>? _forecastData;
  DateTime? _localTime;
  bool? _isDaytime;
  // ignore: unused_field
  bool _isRefreshing = false;
  final Set<String> _expandedDays = {};
  List<Map<String, dynamic>>? _sgFloodAlerts;
  bool _isShowingFloodAnimation = false;
  String? _lastAnimatedFloodHeadline;

  void _showUpdatingOverlay() {
    if (_updatingOverlay != null) return;
    final overlay = Overlay.of(context);
    _updatingOverlay = OverlayEntry(
      builder: (context) => SafeArea(
        child: Align(
          alignment: Alignment.topCenter,
          child: Padding(
            padding: const EdgeInsets.only(top: 12),
            child: Material(
              color: Colors.transparent,
              child: Chip(
                label: Text(AppLocalizations.of(context)!.updatingWeather),
                backgroundColor: Theme.of(
                  context,
                ).colorScheme.surface.withValues(alpha: 0.9),
              ),
            ),
          ),
        ),
      ),
    );
    overlay.insert(_updatingOverlay!);
  }

  void _removeUpdatingOverlay() {
    _updatingOverlay?.remove();
    _updatingOverlay = null;
  }

  @override
  void initState() {
    super.initState();
    _initializeExpandedDays();
    _hydrateAndRefresh();
  }

  void _initializeExpandedDays() {
    final now = DateTime.now();
    final today =
        '${now.year}-${now.month.toString().padLeft(2, '0')}-${now.day.toString().padLeft(2, '0')}';
    final tomorrow = now.add(const Duration(days: 1));
    final tomorrowKey =
        '${tomorrow.year}-${tomorrow.month.toString().padLeft(2, '0')}-${tomorrow.day.toString().padLeft(2, '0')}';
    _expandedDays.addAll([today, tomorrowKey]);
  }

  @override
  void dispose() {
    _removeUpdatingOverlay();
    _searchController.dispose();
    super.dispose();
  }

  Future<void> _hydrateAndRefresh() async {
    String? initialQuery;
    var hasInitialData = false;

    if (GlobalData.hasPreloaded && GlobalData.preloadedWeatherData != null) {
      hasInitialData = true;
      if (mounted) {
        setState(() {
          _weatherData = GlobalData.preloadedWeatherData;
          _forecastData = GlobalData.preloadedForecastData;
          _currentLocation = _weatherData?['location']?['name'];
          _localTime = _resolveLocalTime(_weatherData);
          _isDaytime = _weatherData?['current']?['is_day'] == 1;
        });
        if (_currentLocation != null && _currentLocation!.isNotEmpty) {
          widget.onLocationSelected(_currentLocation!);
        }
      }
      initialQuery = await PreferencesService.loadLastLocationQuery();
      GlobalData.hasPreloaded = false;
    } else {
      final snapshot = await WeatherCacheService.loadSnapshot();
      if (snapshot != null) {
        hasInitialData = true;
        initialQuery = snapshot.locationQuery;
        if (mounted) {
          setState(() {
            _weatherData = snapshot.weatherData;
            _forecastData = snapshot.forecastData;
            _currentLocation = snapshot.weatherData['location']?['name'];
            _currentLocationQuery = snapshot.locationQuery;
            _localTime = _resolveLocalTime(snapshot.weatherData);
            _isDaytime = snapshot.weatherData['current']?['is_day'] == 1;
          });
          if (_currentLocation != null && _currentLocation!.isNotEmpty) {
            widget.onLocationSelected(_currentLocation!);
          }
        }
      }

      initialQuery ??= await PreferencesService.loadLastLocationQuery();
    }

    // Load flood alerts once if we are likely in Singapore
    final isSg = await PreferencesService.loadIsSingapore();
    if (isSg) {
      _fetchSgFloodAlerts();
    }

    if (initialQuery != null && initialQuery.isNotEmpty) {
      _currentLocationQuery = initialQuery;
      await _fetchWeather(initialQuery, showOverlay: !hasInitialData);
      return;
    }

    await _fetchWeatherForCurrentLocation(showOverlay: !hasInitialData);
  }

  Future<void> _fetchSgFloodAlerts() async {
    final isSingapore = await PreferencesService.loadIsSingapore();
    if (!isSingapore) {
      if (mounted) setState(() => _sgFloodAlerts = null);
      return;
    }

    try {
      final sgService = SingaporeWeatherService();
      final alerts = await sgService.fetchFloodAlerts();
      if (mounted) {
        setState(() {
          _sgFloodAlerts = alerts.isNotEmpty ? alerts : null;
        });

        if (alerts.isNotEmpty) {
          _triggerFloodAlertAnimation(alerts);
        }
      }
    } catch (_) {
      if (mounted) setState(() => _sgFloodAlerts = null);
    }
  }

  Future<void> _triggerFloodAlertAnimation(
      List<Map<String, dynamic>> alerts) async {
    final currentHeadline = alerts.map((e) => e['headline']).join('|');
    if (_isShowingFloodAnimation ||
        _lastAnimatedFloodHeadline == currentHeadline) return;

    setState(() {
      _isShowingFloodAnimation = true;
      _lastAnimatedFloodHeadline = currentHeadline;
    });

    // We use a longer delay if needed, but the user said "for a second"
    await Future.delayed(const Duration(milliseconds: 2000));

    if (mounted) {
      setState(() {
        _isShowingFloodAnimation = false;
      });
      if (alerts.length > 1) {
        _showFloodAlertsList(alerts);
      } else {
        _showFloodAlertDetails(alerts.first);
      }
    }
  }

  Future<void> _fetchWeatherForCurrentLocation({
    bool showOverlay = true,
  }) async {
    if (showOverlay) {
      _showUpdatingOverlay();
    }
    try {
      final serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!mounted) return;
      if (!serviceEnabled) {
        _showError(AppLocalizations.of(context)!.locationServicesDisabled);
        return;
      }

      var permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
      }
      if (!mounted) return;
      if (permission == LocationPermission.denied ||
          permission == LocationPermission.deniedForever) {
        _showError(AppLocalizations.of(context)!.locationPermissionDenied);
        return;
      }

      final position = await Geolocator.getCurrentPosition(
        locationSettings: const LocationSettings(
          accuracy: LocationAccuracy.high,
        ),
      );
      final coords = '${position.latitude},${position.longitude}';
      await _fetchWeather(coords, showOverlay: showOverlay);
    } catch (e) {
      if (!mounted) return;
      _showError(AppLocalizations.of(context)!.unableToFetchLocation);
    } finally {
      if (showOverlay) {
        _removeUpdatingOverlay();
      }
    }
  }

  void _showError(String message) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(message)));
  }

  Future<void> _onRefresh() async {
    if (_currentLocationQuery != null) {
      await _fetchWeather(_currentLocationQuery!);
    } else if (_currentLocation != null) {
      await _fetchWeather(_currentLocation!);
    } else {
      await _fetchWeatherForCurrentLocation();
    }
  }

  Future<void> _fetchWeather(String location, {bool showOverlay = true}) async {
    if (!mounted) return;
    if (showOverlay) {
      _showUpdatingOverlay();
    }
    setState(() => _isRefreshing = true);

    try {
      final data = await _weatherService.fetchAllWeatherData(location);
      final weather = data['weather']!;
      final forecast = data['forecast']!;
      final localTime = _resolveLocalTime(weather);
      final isDaytime = weather['current']?['is_day'] == 1;

      if (!mounted) return;
      final locationName = weather['location']?['name'] as String?;
      setState(() {
        _weatherData = weather;
        _forecastData = forecast;
        _currentLocation = locationName;
        _currentLocationQuery = location;
        _localTime = localTime;
        _isDaytime = isDaytime;
      });
      final country = weather['location']?['country']?.toString().toLowerCase() ?? '';
      final lat = (weather['location']?['lat'] as num?)?.toDouble() ?? 0.0;
      final lon = (weather['location']?['lon'] as num?)?.toDouble() ?? 0.0;
      final isSingaporeCoords = lat >= 1.15 && lat <= 1.50 && lon >= 103.55 && lon <= 104.15;
      final isSingapore = country.contains('singapore') || isSingaporeCoords;

      final wasSingapore = await PreferencesService.loadIsSingapore();
      await PreferencesService.saveIsSingapore(isSingapore);

      if (isSingapore && !wasSingapore) {
        // If we just transitioned to Singapore (or it's the first time), fetch alerts immediately
        _fetchSgFloodAlerts();
      } else if (!isSingapore) {
        setState(() => _sgFloodAlerts = null);
      }

      await PreferencesService.saveLastLocationQuery(location);
      await WeatherCacheService.saveSnapshot(
        locationQuery: location,
        weatherData: weather,
        forecastData: forecast,
      );
      await WidgetRefreshService.storeAndRefresh(
        weatherData: weather,
        useFahrenheit: GlobalData.useFahrenheit,
      );
      // Notify parent of location change
      if (locationName != null && locationName.isNotEmpty) {
        widget.onLocationSelected(locationName);
      }
      if (mounted) {
        RatingService.checkAndShowRating(context);
      }
    } catch (e) {
      if (mounted) _showError(AppLocalizations.of(context)!.failedToLoadWeather(e.toString()));
    } finally {
      if (mounted) setState(() => _isRefreshing = false);
      if (showOverlay) {
        _removeUpdatingOverlay();
      }
    }
  }

  void _openSearchSheet() {
    final media = MediaQuery.of(context);
    showModalBottomSheet(
      context: context,
      useSafeArea: true,
      isScrollControlled: true,
      builder: (context) {
        return FractionallySizedBox(
          heightFactor: 0.75,
          child: Padding(
            padding: EdgeInsets.only(
              bottom: media.viewInsets.bottom + 16,
              left: 16,
              right: 16,
              top: 16,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      AppLocalizations.of(context)!.searchPlace,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    IconButton(
                      icon: const Icon(Icons.close_rounded),
                      tooltip: AppLocalizations.of(context)!.close,
                      onPressed: Navigator.of(context).pop,
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                TypeAheadField<String>(
                  suggestionsCallback: (pattern) {
                    if (pattern.isEmpty) return [];
                    return _weatherService.searchLocations(pattern);
                  },
                  builder: (context, controller, focusNode) {
                    _searchController.text = controller.text;
                    return TextField(
                      controller: controller,
                      focusNode: focusNode,
                      autofocus: true,
                      decoration: InputDecoration(
                        hintText: AppLocalizations.of(context)!.cityRegionOrCoordinates,
                        prefixIcon: const Icon(Icons.search),
                      ),
                    );
                  },
                  itemBuilder: (context, suggestion) {
                    return ListTile(
                      leading: const Icon(Icons.location_on_outlined),
                      title: Text(suggestion),
                    );
                  },
                  onSelected: (suggestion) {
                    Navigator.of(context).pop();
                    _fetchWeather(suggestion);
                  },
                ),
                const Spacer(),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final condition =
        _weatherData?['current']?['condition']?['text'] ?? 'Clear';
    final isDaytime = _isDaytime ?? true;
    final useFahrenheit = GlobalData.useFahrenheit;
    final temp = useFahrenheit
        ? _weatherData?['current']?['temp_f']
        : _weatherData?['current']?['temp_c'];
    final today =
        _firstOrNull(_forecastData?['forecast']?['forecastday'] as List?)
            as Map?;
    final maxToday = useFahrenheit
        ? today?['day']?['maxtemp_f']
        : today?['day']?['maxtemp_c'];
    final minToday = useFahrenheit
        ? today?['day']?['mintemp_f']
        : today?['day']?['mintemp_c'];

    // AppBar fade animation

    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.transparent,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(72),
        child: Stack(
          children: [
            // Gradient background
            Container(
              height: 72,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Theme.of(context).brightness == Brightness.dark
                        ? Colors.black.withValues(alpha: 0.85)
                        : Colors.white.withValues(alpha: 0.85),
                    Theme.of(context).brightness == Brightness.dark
                        ? Colors.black.withValues(alpha: 0.25)
                        : Colors.white.withValues(alpha: 0.25),
                    Colors.transparent,
                  ],
                  stops: const [0.0, 0.6, 1.0],
                ),
              ),
            ),
            AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              titleSpacing: 16,
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 10),
                  Text(
                    _currentLocation ?? AppLocalizations.of(context)!.loadingLocation,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  if (_localTime != null)
                    Text(
                      '${DateFormat('EEEE, MMM d').format(_localTime!)} • ${DateFormat('h:mm a').format(_localTime!)}',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Theme.of(context).colorScheme.onSurfaceVariant,
                      ),
                    ),
                ],
              ),
              actions: [
                IconButton(
                  icon: const Icon(Icons.notifications_rounded),
                  tooltip: 'Notifications',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const NotificationsScreen(),
                      ),
                    );
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.search_rounded),
                  tooltip: AppLocalizations.of(context)!.searchLocation,
                  onPressed: _openSearchSheet,
                ),
                IconButton(
                  icon: const Icon(Icons.my_location_rounded),
                  tooltip: AppLocalizations.of(context)!.useCurrentLocation,
                  onPressed: _fetchWeatherForCurrentLocation,
                ),
                const SizedBox(width: 8),
              ],
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          AnimatedWeatherBackdrop(
            condition: condition,
            isDaytime: isDaytime,
            height: 360,
            intensity: 0.65,
          ),
          SafeArea(
            child: RefreshIndicator.adaptive(
              onRefresh: _onRefresh,
              displacement: 32,
              child: CustomScrollView(
                physics: const AlwaysScrollableScrollPhysics(
                  parent: BouncingScrollPhysics(),
                ),
                slivers: [
                  const SliverToBoxAdapter(child: SizedBox(height: 12)),
                  SliverToBoxAdapter(
                    child: _weatherData == null
                        ? _buildLoadingCard()
                        : _buildHeroCard(
                            condition: condition,
                            temp: temp,
                            high: maxToday,
                            low: minToday,
                          ),
                  ),
                  if (_sgFloodAlerts != null)
                    SliverToBoxAdapter(child: _buildFloodAlerts()),
                  SliverPadding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    sliver: SliverToBoxAdapter(child: _buildMetricsGrid()),
                  ),
                  SliverToBoxAdapter(child: _buildHourlyStrip()),
                  if (_weatherData != null &&
                      _weatherData!['sg_regions'] != null)
                    SliverToBoxAdapter(child: _buildSgRegionalForecast()),
                  SliverToBoxAdapter(child: _buildDailyForecast()),
                  if (_weatherData != null && _weatherData!['location'] != null)
                    SliverToBoxAdapter(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: WeatherMapSnippet(
                          lat: (_weatherData!['location']['lat'] as num)
                              .toDouble(),
                          lng: (_weatherData!['location']['lon'] as num)
                              .toDouble(),
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => WeatherMapScreen(
                                  initialLat:
                                      (_weatherData!['location']['lat'] as num)
                                          .toDouble(),
                                  initialLng:
                                      (_weatherData!['location']['lon'] as num)
                                          .toDouble(),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  SliverToBoxAdapter(child: _buildInsights()),
                  if (_weatherData != null)
                    SliverToBoxAdapter(
                      child: OpenMeteoAttribution(
                        source: _weatherData!['source'] ?? 'open-meteo',
                      ),
                    ),
                  const SliverToBoxAdapter(child: SizedBox(height: 24)),
                ],
              ),
            ),
          ),
          if (_isShowingFloodAnimation)
            Positioned.fill(
              child: TweenAnimationBuilder<double>(
                tween: Tween(begin: 0.0, end: 1.0),
                duration: const Duration(milliseconds: 500),
                builder: (context, value, child) {
                  return Container(
                    color: Colors.red.withValues(alpha: 0.4 * value),
                    child: Center(
                      child: Opacity(
                        opacity: value,
                        child: child,
                      ),
                    ),
                  );
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Lottie.asset(
                      'assets/animations/flood_alert.json',
                      width: 200,
                      height: 200,
                      repeat: false,
                    ),
                    const SizedBox(height: 20),
                    Text(
                      AppLocalizations.of(context)!.flashFloodWarning,
                      style: Theme
                          .of(context)
                          .textTheme
                          .headlineSmall
                          ?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 2,
                        shadows: [
                          const Shadow(
                            color: Colors.black54,
                            blurRadius: 8,
                            offset: Offset(0, 2),
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

  Widget _buildLoadingCard() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Skeletonizer(
            enabled: true,
            child: Card(
              child: SizedBox(
                height: 180,
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Icon(Icons.wb_sunny, size: 32),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(AppLocalizations.of(context)!.loadingClearWeather),
                                Text(AppLocalizations.of(context)!.dummyTime),
                              ],
                            ),
                          ),
                          Chip(
                            label: Text(AppLocalizations.of(context)!.daytime),
                            avatar: const Icon(Icons.wb_sunny, size: 18),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            AppLocalizations.of(context)!.loadingTempF,
                            style: const TextStyle(
                              fontSize: 45,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(AppLocalizations.of(context)!.dummyHighLow),
                                const SizedBox(height: 6),
                                Text(
                                  AppLocalizations.of(context)!.adviceClear,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        const OpenMeteoAttribution(),
      ],
    );
  }

  Widget _buildHeroCard({
    required String condition,
    required dynamic temp,
    required dynamic high,
    required dynamic low,
  }) {
    final scheme = Theme.of(context).colorScheme;
    final localDateTime = _localTime ?? DateTime.now();
    final isDaytime = _isDaytime ?? true;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Card(
            elevation: 3,
            margin: EdgeInsets.zero,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(
                        _iconForCondition(condition),
                        size: 32,
                        color: scheme.primary,
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              condition,
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            Text(
                              DateFormat(
                                'EEE, MMM d • h:mm a',
                              ).format(localDateTime),
                              style: Theme.of(context).textTheme.bodyMedium
                                  ?.copyWith(color: scheme.onSurfaceVariant),
                            ),
                          ],
                        ),
                      ),
                      Chip(
                        label: Text(isDaytime ? AppLocalizations.of(context)!.daytime : AppLocalizations.of(context)!.night),
                        avatar: Icon(
                          isDaytime
                              ? Icons.wb_sunny_rounded
                              : Icons.nights_stay,
                          size: 18,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        temp != null
                            ? '${temp.round()}°${GlobalData.useFahrenheit ? 'F' : 'C'}'
                            : '--',
                        style: Theme.of(context).textTheme.displayMedium
                            ?.copyWith(fontWeight: FontWeight.w700),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              AppLocalizations.of(context)!.highLowTemp(high != null ? high.round().toString() : '--', low != null ? low.round().toString() : '--'),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context).textTheme.titleMedium
                                  ?.copyWith(color: scheme.onSurfaceVariant),
                            ),
                            const SizedBox(height: 6),
                            Text(
                              _insightForWeather(condition),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context).textTheme.bodyMedium
                                  ?.copyWith(color: scheme.primary),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 12),
        ],
      ),
    );
  }

  Widget _buildFloodAlerts() {
    final alerts = _sgFloodAlerts ?? [];
    if (alerts.isEmpty) return const SizedBox.shrink();

    final scheme = Theme
        .of(context)
        .colorScheme;
    final isMultiple = alerts.length > 1;

    final headline = isMultiple ? AppLocalizations.of(context)!
        .multipleFloodAlerts : (alerts.first['headline']?.toString() ??
        AppLocalizations.of(context)!.floodAlert);
    final area = isMultiple ? AppLocalizations.of(context)!.activeWarnings(
        alerts.length) : (alerts.first['area']?.toString() ?? '');
    final description = isMultiple ? AppLocalizations.of(context)!
        .tapToViewAllAlerts : (alerts.first['description']?.toString() ?? '');

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: Card(
        color: scheme.errorContainer,
        elevation: 2,
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: BorderSide(color: scheme.error.withValues(alpha: 0.5)),
        ),
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: () {
            if (isMultiple) {
              _showFloodAlertsList(alerts);
            } else {
              _showFloodAlertDetails(alerts.first);
            }
          },
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Icon(
                  Icons.warning_amber_rounded,
                  color: scheme.onErrorContainer,
                  size: 32,
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        headline,
                        style: Theme
                            .of(context)
                            .textTheme
                            .titleSmall
                            ?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: scheme.onErrorContainer,
                        ),
                      ),
                      if (area.isNotEmpty)
                        Text(
                          area,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: Theme
                              .of(context)
                              .textTheme
                              .bodyMedium
                              ?.copyWith(
                            color: scheme.onErrorContainer,
                          ),
                        ),
                      if (description.isNotEmpty)
                        Text(
                          description,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: Theme
                              .of(context)
                              .textTheme
                              .bodySmall
                              ?.copyWith(
                            color: scheme.onErrorContainer.withValues(
                                alpha: 0.8),
                          ),
                        ),
                    ],
                  ),
                ),
                Icon(
                  Icons.chevron_right_rounded,
                  color: scheme.onErrorContainer.withValues(alpha: 0.5),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showFloodAlertsList(List<Map<String, dynamic>> alerts) {
    showModalBottomSheet(
      context: context,
      useSafeArea: true,
      isScrollControlled: true,
      builder: (context) {
        return _FloodAlertsSheet(alerts: alerts);
      },
    );
  }

  void _showFloodAlertDetails(Map<String, dynamic> alert) {
    showModalBottomSheet(
      context: context,
      useSafeArea: true,
      isScrollControlled: true,
      builder: (context) {
        return DraggableScrollableSheet(
          expand: false,
          initialChildSize: 0.6,
          minChildSize: 0.4,
          maxChildSize: 0.95,
          builder: (context, scrollController) {
            return _FloodAlertDetailsContent(
              alert: alert,
              scrollController: scrollController,
            );
          },
        );
      },
    );
  }

  Widget _buildMetricsGrid() {
    if (_weatherData == null) return const SizedBox.shrink();
    final current = _weatherData!['current'];
    final items = [
      _MetricTile(
        label: AppLocalizations.of(context)!.feelsLike,
        value:
            '${(GlobalData.useFahrenheit ? current['feelslike_f'] : current['feelslike_c'])?.round() ?? '--'}°${GlobalData.useFahrenheit ? 'F' : 'C'}',
        icon: Icons.thermostat,
      ),
      _MetricTile(
        label: AppLocalizations.of(context)!.humidity,
        value: '${current['humidity'] ?? '--'}%',
        icon: Icons.water_drop,
      ),
      _MetricTile(
        label: 'UV Index',
        value: current['uv']?.toStringAsFixed(1) ?? '--',
        icon: Icons.wb_sunny_outlined,
      ),
      _MetricTile(
        label: 'Dew Point',
        value: '${(GlobalData.useFahrenheit
            ? current['dewpoint_f']
            : current['dewpoint_c'])?.round() ?? '--'}°${GlobalData
            .useFahrenheit ? 'F' : 'C'}',
        icon: Icons.dew_point,
      ),
      _MetricTile(
        label: AppLocalizations.of(context)!.wind,
        value: AppLocalizations.of(context)!.windSpeed((current['wind_kph']?.round() ?? '--').toString(), current['wind_dir']?.toString() ?? ''),
        icon: Icons.air,
      ),
      _MetricTile(
        label: AppLocalizations.of(context)!.airQuality,
        value: current['aqi'] != null && current['aqi'] > 0
            ? '${current['aqi']} - ${current['air_quality_text'] ?? ''}'
            : 'N/A',
        icon: Icons.air_outlined,
      ),
      _MetricTile(
        label: AppLocalizations.of(context)!.visibility,
        value: AppLocalizations.of(context)!.visibilityKm((current['vis_km']?.toStringAsFixed(1) ?? '--').toString()),
        icon: Icons.remove_red_eye,
      ),
      _MetricTile(
        label: AppLocalizations.of(context)!.precipChance,
        value:
            '${_forecastData?['forecast']?['forecastday']?.first?['day']?['daily_chance_of_rain'] ?? '--'}%',
        icon: Icons.umbrella,
      ),
    ];

    return Wrap(
      spacing: 12,
      runSpacing: 12,
      children: items
          .map(
            (item) => SizedBox(
              width: (MediaQuery.of(context).size.width - 16 * 2 - 12) / 2,
              child: item,
            ),
          )
          .toList(),
    );
  }

  Widget _buildHourlyStrip() {
    final forecastDays =
        _forecastData?['forecast']?['forecastday'] as List? ?? [];
    if (forecastDays.isEmpty) return const SizedBox.shrink();

    final locationTime = _resolveLocalTime(_weatherData);

    // Group hourly data by day
    final Map<String, List<Map<String, dynamic>>> hoursByDay = {};

    for (var day in forecastDays) {
      final hours = day['hour'] as List? ?? [];
      for (var hour in hours) {
        final rawTime = hour['time']?.toString() ?? '';
        final displayTime = hour['display_time']?.toString() ?? '';
        if (rawTime.isEmpty) continue;

        final hourTime = DateTime.tryParse(rawTime);
        if (hourTime == null) continue;

        bool shouldInclude = false;
        if (displayTime.isNotEmpty) {
          // For NEA period data, include it if it's the current period or a future one
          // We can check if the current time is before the start of the period,
          // or if it's a multi-day forecast where the date is today or later.
          shouldInclude =
              true; // For Singapore NEA, we generally want all provided periods
        } else if (hourTime.isAfter(locationTime)) {
          shouldInclude = true;
        }

        if (shouldInclude) {
          final dateKey =
              '${hourTime.year}-${hourTime.month.toString().padLeft(2, '0')}-${hourTime.day.toString().padLeft(2, '0')}';
          hoursByDay.putIfAbsent(dateKey, () => []);
          hoursByDay[dateKey]!.add({'time': hourTime, 'data': hour});
        }
      }
    }

    if (hoursByDay.isEmpty) return const SizedBox.shrink();

    // Build horizontal list items
    final List<Widget> horizontalItems = [];
    final isSingapore = _weatherData?['location']?['country'] == 'Singapore';
    String? lastSource;

    for (var entry in hoursByDay.entries) {
      final dateKey = entry.key;
      final hours = entry.value;
      if (hours.isEmpty) continue;

      final firstHourTime = hours.first['time'] as DateTime;
      final isExpanded = _expandedDays.contains(dateKey);
      final hasOm = hours.any((h) => h['data']['source'] == 'open-meteo');

      // For Singapore, we only show headers for days that have Open-Meteo data
      final showHeader = !isSingapore || hasOm;

      // Add date header with toggle
      if (showHeader) {
        horizontalItems.add(
          _CollapsibleDateHeader(
            date: firstHourTime,
            isExpanded: isExpanded,
            onTap: () {
              setState(() {
                if (isExpanded) {
                  _expandedDays.remove(dateKey);
                } else {
                  _expandedDays.add(dateKey);
                }
              });
            },
          ),
        );
      }

      // Add hourly items (Always show NEA-only days for Singapore, check expansion for others)
      if (!showHeader || isExpanded) {
        for (var hourEntry in hours) {
          final hourData = hourEntry['data'];
          final source = hourData['source'] ?? 'nea';

          // Source transition indicator
          if (lastSource != null && lastSource != source) {
            horizontalItems.add(
              _SourceTransitionChip(
                label: source == 'open-meteo'
                    ? AppLocalizations.of(context)!.dataFromOpenMeteo
                    : AppLocalizations.of(context)!.dataFromNea,
              ),
            );
          }
          lastSource = source;

          final hourTime = hourEntry['time'] as DateTime;
          final condition =
              hourData['condition']?['text']?.toString() ?? 'Clear';
          final precip =
              hourData['chance_of_rain'] ?? hourData['chance_of_snow'] ?? 0;

          final String? displayTime = hourData['display_time'];

          if (displayTime != null && displayTime.isNotEmpty) {
            // NEA Period data
            horizontalItems.add(
              _SgPeriodCard(
                label: displayTime,
                icon: _iconForCondition(condition),
                condition: condition,
                precip: AppLocalizations.of(context)!.precipPercent(precip.toString()),
              ),
            );
          } else {
            // Standard hourly data
            final temp = GlobalData.useFahrenheit
                ? (hourData['temp_f'] ?? 0.0)
                : (hourData['temp_c'] ?? 0.0);
            horizontalItems.add(
              _ForecastChip(
                label: DateFormat('h a').format(hourTime),
                value: '${(temp as num).round()}°',
                icon: _iconForCondition(condition),
                condition: condition,
                caption: AppLocalizations.of(context)!.precipPercent(precip.toString()),
              ),
            );
          }
        }
      } else {
        // If day is collapsed, update lastSource to the last element's source
        // to detect transitions in subsequent days
        lastSource = hours.last['data']['source'] ?? 'nea';
      }
    }

    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                Icon(
                  Icons.access_time,
                  color: Theme.of(context).colorScheme.primary,
                ),
                const SizedBox(width: 8),
                Text(
                  AppLocalizations.of(context)!.hourlyForecast,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          SizedBox(
            height: 180,
            child: Stack(
              children: [
                ListView.separated(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  scrollDirection: Axis.horizontal,
                  itemCount: horizontalItems.length,
                  separatorBuilder: (context, index) =>
                      const SizedBox(width: 12),
                  itemBuilder: (context, index) => horizontalItems[index],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSgRegionalForecast() {
    final allRanges = _weatherData!['sg_period_ranges'] as List? ?? [];

    // Find the range that is currently valid
    final now = DateTime.now().toUtc().add(const Duration(hours: 8));
    final currentRanges = allRanges.where((r) {
      final start = DateTime.tryParse(r['start'] ?? '');
      final end = DateTime.tryParse(r['end'] ?? '');
      if (start == null || end == null) return false;
      return now.isAfter(start.subtract(const Duration(seconds: 1))) &&
          now.isBefore(end);
    }).toList();

    if (currentRanges.isEmpty) return const SizedBox.shrink();

    return Padding(
      padding: const EdgeInsets.only(top: 24, left: 16, right: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.map_outlined,
                color: Theme.of(context).colorScheme.primary,
              ),
              const SizedBox(width: 8),
              Text(
                AppLocalizations.of(context)!.regionalOutlook,
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ],
          ),
          const SizedBox(height: 12),
          SizedBox(
            height: 160,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: currentRanges.length,
              separatorBuilder: (_, _) => const SizedBox(width: 12),
              itemBuilder: (context, index) {
                final r = currentRanges[index];
                final regionName = r['region'].toString().toUpperCase();
                final text = r['text'] ?? '';
                final period = r['period_text'] ?? '';

                return Card(
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                    side: BorderSide(
                      color: Theme.of(
                        context,
                      ).colorScheme.outlineVariant.withValues(alpha: 0.5),
                    ),
                  ),
                  child: Container(
                    width: 160,
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          regionName,
                          style: Theme.of(context).textTheme.labelLarge
                              ?.copyWith(
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).colorScheme.primary,
                              ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          period,
                          style: Theme.of(context).textTheme.labelSmall
                              ?.copyWith(
                                color: Theme.of(
                                  context,
                                ).colorScheme.onSurfaceVariant,
                              ),
                        ),
                        const Spacer(),
                        Row(
                          children: [
                            Icon(
                              _iconForCondition(text),
                              size: 20,
                              color: Theme.of(
                                context,
                              ).colorScheme.onSurfaceVariant,
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              child: Text(
                                text,
                                style: Theme.of(context).textTheme.bodySmall
                                    ?.copyWith(fontWeight: FontWeight.w500),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDailyForecast() {
    final days = _forecastData?['forecast']?['forecastday'] as List?;
    if (days == null || days.isEmpty) return const SizedBox.shrink();

    final list = days.skip(1).take(6).toList();

    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 20, 16, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.calendar_month,
                color: Theme.of(context).colorScheme.primary,
              ),
              const SizedBox(width: 8),
              Text(
                AppLocalizations.of(context)!.nextDays(list.length),
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ],
          ),
          const SizedBox(height: 12),
          ..._buildDailyList(list),
        ],
      ),
    );
  }

  List<Widget> _buildDailyList(List<dynamic> days) {
    final List<Widget> items = [];
    String? lastSource;

    for (final day in days) {
      final dayMap = day['day'] as Map?;
      final source = day['source'] ?? 'nea';

      if (lastSource != null && lastSource != source) {
        items.add(
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Row(
              children: [
                const Expanded(child: Divider()),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Row(
                    children: [
                      Text(
                        AppLocalizations.of(context)!.dataFromOpenMeteo,
                        style: Theme.of(context).textTheme.labelSmall?.copyWith(
                          color: Theme.of(context).colorScheme.onSurfaceVariant,
                        ),
                      ),
                      const SizedBox(width: 4),
                      Icon(
                        Icons.arrow_forward_rounded,
                        size: 14,
                        color: Theme.of(context).colorScheme.onSurfaceVariant,
                      ),
                    ],
                  ),
                ),
                const Expanded(child: Divider()),
              ],
            ),
          ),
        );
      }
      lastSource = source;

      final date = DateTime.parse(day['date']);
      final hi = GlobalData.useFahrenheit
          ? day['day']['maxtemp_f']
          : day['day']['maxtemp_c'];
      final lo = GlobalData.useFahrenheit
          ? day['day']['mintemp_f']
          : day['day']['mintemp_c'];
      final condition = day['day']['condition']['text'] as String;
      final rain = day['day']['daily_chance_of_rain'];

      if (dayMap != null &&
          (dayMap.containsKey('wind') || dayMap.containsKey('humidity'))) {
        final wind = dayMap['wind'] ?? {};
        final hum = dayMap['humidity'] ?? {};
        items.add(
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: DailyRangeTile(
              label: DateFormat('EEE, MMM d').format(date),
              max: hi,
              min: lo,
              windLow: (wind['low_kph'] as num?)?.toDouble() ?? 0.0,
              windHigh: (wind['high_kph'] as num?)?.toDouble() ?? 0.0,
              rhLow: (hum['low'] as num?)?.toInt() ?? 0,
              rhHigh: (hum['high'] as num?)?.toInt() ?? 0,
              icon: _iconForCondition(condition),
              subtitle: AppLocalizations.of(context)!.precipPercent(rain.toString()),
              useFahrenheit: GlobalData.useFahrenheit,
            ),
          ),
        );
      } else {
        items.add(
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: _DailyTile(
              label: DateFormat('EEE, MMM d').format(date),
              hi: hi,
              lo: lo,
              icon: _iconForCondition(condition),
              subtitle: AppLocalizations.of(context)!.precipPercent(rain.toString()),
            ),
          ),
        );
      }
    }
    return items;
  }

  Widget _buildInsights() {
    final condition =
        _weatherData?['current']?['condition']?['text'] ?? 'Weather';
    final advice = _insightForWeather(condition);
    final futureAdvice = _futureInsight();

    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 20, 16, 0),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.lightbulb,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    AppLocalizations.of(context)!.todaysSuggestion,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Text(advice, style: Theme.of(context).textTheme.bodyLarge),
              if (futureAdvice != null) ...[
                const SizedBox(height: 10),
                Text(
                  futureAdvice,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }

  String _insightForWeather(String condition) {
    final lower = condition.toLowerCase();
    if (lower.contains('rain')) return AppLocalizations.of(context)!.adviceRain;
    if (lower.contains('snow')) return AppLocalizations.of(context)!.adviceSnow;
    if (lower.contains('storm') || lower.contains('thunder')) {
      return AppLocalizations.of(context)!.adviceStorm;
    }
    if (lower.contains('clear') || lower.contains('sunny')) {
      return AppLocalizations.of(context)!.adviceClear;
    }
    if (lower.contains('cloud')) {
      return AppLocalizations.of(context)!.adviceCloud;
    }
    return AppLocalizations.of(context)!.adviceDefault;
  }

  String? _futureInsight() {
    final hours = _forecastData?['forecast']?['forecastday']?[0]?['hour'] ?? [];
    if (hours.isEmpty) return null;

    final now = _localTime ?? _resolveLocalTime(_weatherData);
    final target = now.add(const Duration(hours: 3));
    Map<String, dynamic>? futureHour;
    for (final hour in hours) {
      final time = DateTime.parse(hour['time']);
      if (time.hour == target.hour) {
        futureHour = hour;
        break;
      }
    }
    if (futureHour == null) return null;
    final cond = (futureHour['condition']['text'] as String).toLowerCase();
    if (cond.contains('rain')) {
      return AppLocalizations.of(context)!.futureAdviceRain;
    }
    if (cond.contains('snow')) {
      return AppLocalizations.of(context)!.futureAdviceSnow;
    }
    if (cond.contains('storm') || cond.contains('thunder')) {
      return AppLocalizations.of(context)!.futureAdviceStorm;
    }
    return AppLocalizations.of(context)!.futureAdviceClear;
  }

  IconData _iconForCondition(String condition) {
    final lower = condition.toLowerCase();
    if (lower.contains('storm') || lower.contains('thunder')) {
      return Icons.flash_on_rounded;
    }
    if (lower.contains('rain') || lower.contains('drizzle')) {
      return Icons.umbrella_rounded;
    }
    if (lower.contains('snow') || lower.contains('sleet')) {
      return Icons.ac_unit_rounded;
    }
    if (lower.contains('cloud') || lower.contains('overcast')) {
      return Icons.cloud_rounded;
    }
    if (lower.contains('fog') ||
        lower.contains('mist') ||
        lower.contains('haze')) {
      return Icons.water_rounded;
    }
    return Icons.wb_sunny_rounded;
  }

  DateTime _resolveLocalTime(Map<String, dynamic>? weatherData) {
    final tzId = weatherData?['location']?['tz_id']?.toString() ?? '';
    if (tzId.isNotEmpty) {
      return TimeUtils.getLocalTime(tzId);
    }

    final localtime = weatherData?['location']?['localtime']?.toString() ?? '';
    return DateTime.tryParse(localtime) ?? DateTime.now();
  }
}

class _CollapsibleDateHeader extends StatelessWidget {
  const _CollapsibleDateHeader({
    required this.date,
    required this.isExpanded,
    required this.onTap,
  });

  final DateTime date;
  final bool isExpanded;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final now = DateTime.now();
    final isToday =
        date.year == now.year && date.month == now.month && date.day == now.day;
    final tomorrow = now.add(const Duration(days: 1));
    final isTomorrow =
        date.year == tomorrow.year &&
        date.month == tomorrow.month &&
        date.day == tomorrow.day;

    String dateLabel;
    if (isToday) {
      dateLabel = AppLocalizations.of(context)!.today;
    } else if (isTomorrow) {
      dateLabel = AppLocalizations.of(context)!.tomorrow;
    } else {
      dateLabel = DateFormat('EEE, MMM d').format(date);
    }

    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 2,
        color: scheme.primaryContainer,
        child: SizedBox(
          width: 120,
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 36,
                  height: 36,
                  decoration: BoxDecoration(
                    color: scheme.primary,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    isExpanded ? Icons.expand_less : Icons.expand_more,
                    color: scheme.onPrimary,
                    size: 24,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  dateLabel,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: scheme.onPrimaryContainer,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _MetricTile extends StatelessWidget {
  const _MetricTile({
    required this.label,
    required this.value,
    required this.icon,
  });

  final String label;
  final String value;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Card(
      elevation: 1,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            Container(
              width: 34,
              height: 34,
              decoration: BoxDecoration(
                color: scheme.secondaryContainer,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(icon, color: scheme.onSecondaryContainer),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(label, style: Theme.of(context).textTheme.bodyMedium),
                  Text(
                    value,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ForecastChip extends StatelessWidget {
  const _ForecastChip({
    required this.label,
    required this.value,
    required this.icon,
    required this.condition,
    required this.caption,
  });

  final String label;
  final String value;
  final IconData icon;
  final String condition;
  final String caption;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Card(
      elevation: 1,
      child: Container(
        width: 140,
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: Theme.of(
                context,
              ).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            const Spacer(),
            Row(
              children: [
                Icon(icon, color: scheme.primary, size: 20),
                const SizedBox(width: 6),
                Text(
                  value,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 4),
            Text(
              condition,
              style: Theme.of(
                context,
              ).textTheme.bodySmall?.copyWith(fontWeight: FontWeight.w500),
            ),
            Text(
              caption,
              style: Theme.of(context).textTheme.labelSmall?.copyWith(
                color: scheme.onSurfaceVariant,
                fontSize: 10,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SgPeriodCard extends StatelessWidget {
  const _SgPeriodCard({
    required this.label,
    required this.icon,
    required this.condition,
    required this.precip,
  });

  final String label;
  final IconData icon;
  final String condition;
  final String precip;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;

    // Parse "From X to Y"
    String from = label;
    String to = '';
    if (label.contains(' to ')) {
      final parts = label.split(' to ');
      from = parts[0].trim();
      to = parts[1].trim();
    }

    return Card(
      elevation: 1,
      margin: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
      child: Container(
        width: 150,
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              from,
              style: Theme.of(context).textTheme.labelMedium?.copyWith(
                color: scheme.primary,
                fontWeight: FontWeight.bold,
              ),
            ),
            if (to.isNotEmpty)
              Text(
                AppLocalizations.of(context)!.toTime(to),
                style: Theme.of(context).textTheme.labelSmall?.copyWith(
                  color: scheme.onSurfaceVariant,
                ),
              ),
            const Spacer(),
            Row(
              children: [
                Icon(icon, color: scheme.secondary, size: 24),
                const SizedBox(width: 8),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        condition,
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                        // Allow wrapping for long descriptors
                      ),
                      Text(
                        precip,
                        style: Theme.of(context).textTheme.labelSmall?.copyWith(
                          color: scheme.onSurfaceVariant,
                          fontSize: 10,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _SourceTransitionChip extends StatelessWidget {
  const _SourceTransitionChip({required this.label});
  final String label;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Center(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        margin: const EdgeInsets.only(right: 12),
        decoration: BoxDecoration(
          color: scheme.surfaceContainerHighest.withValues(alpha: 0.5),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: scheme.outlineVariant),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              label,
              style: Theme.of(context).textTheme.labelSmall?.copyWith(
                color: scheme.onSurfaceVariant,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(width: 8),
            Icon(
              Icons.arrow_forward_rounded,
              size: 14,
              color: scheme.onSurfaceVariant,
            ),
          ],
        ),
      ),
    );
  }
}

class _DailyTile extends StatelessWidget {
  const _DailyTile({
    required this.label,
    required this.hi,
    required this.lo,
    required this.icon,
    required this.subtitle,
  });

  final String label;
  final dynamic hi;
  final dynamic lo;
  final IconData icon;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Card(
      elevation: 1,
      child: ListTile(
        leading: Icon(icon, color: scheme.primary),
        title: Text(label),
        subtitle: Text(subtitle),
        trailing: Text(
          '${hi != null ? hi.round() : '--'}° / ${lo != null ? lo.round() : '--'}°',
          style: Theme.of(
            context,
          ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}

class _FloodAlertsSheet extends StatefulWidget {
  const _FloodAlertsSheet({required this.alerts});

  final List<Map<String, dynamic>> alerts;

  @override
  State<_FloodAlertsSheet> createState() => _FloodAlertsSheetState();
}

class _FloodAlertsSheetState extends State<_FloodAlertsSheet> {
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();
  final DraggableScrollableController _sheetController = DraggableScrollableController();

  @override
  Widget build(BuildContext context) {
    final scheme = Theme
        .of(context)
        .colorScheme;

    return DraggableScrollableSheet(
      controller: _sheetController,
      expand: false,
      initialChildSize: 0.6,
      minChildSize: 0.4,
      maxChildSize: 0.95,
      builder: (context, scrollController) {
        return PopScope(
          canPop: false,
          onPopInvokedWithResult: (didPop, result) async {
            if (didPop) return;
            final navigator = _navigatorKey.currentState;
            if (navigator != null && navigator.canPop()) {
              navigator.pop();
            } else if (mounted) {
              Navigator.of(context).pop();
            }
          },
          child: Material(
            color: scheme.surface,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
            child: Navigator(
              key: _navigatorKey,
              onGenerateRoute: (settings) {
                return MaterialPageRoute(
                  builder: (context) {
                    return _buildList(context, scrollController);
                  },
                );
              },
            ),
          ),
        );
      },
    );
  }

  Widget _buildList(BuildContext context, ScrollController scrollController) {
    final scheme = Theme
        .of(context)
        .colorScheme;
    return Column(
      children: [
        const SizedBox(height: 12),
        Container(
          width: 40,
          height: 4,
          decoration: BoxDecoration(
            color: scheme.outlineVariant,
            borderRadius: BorderRadius.circular(2),
          ),
        ),
        const SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Row(
            children: [
              Icon(Icons.warning_amber_rounded, color: scheme.error, size: 28),
              const SizedBox(width: 12),
              Text(
                AppLocalizations.of(context)!.activeFloodAlerts,
                style: Theme
                    .of(context)
                    .textTheme
                    .titleLarge
                    ?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        Expanded(
          child: ListView.separated(
            controller: scrollController,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            itemCount: widget.alerts.length,
            separatorBuilder: (_, _) => const SizedBox(height: 12),
            itemBuilder: (context, index) {
              final alert = widget.alerts[index];
              return Card(
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                  side: BorderSide(color: scheme.outlineVariant),
                ),
                child: ListTile(
                  contentPadding: const EdgeInsets.all(16),
                  title: Text(
                    alert['headline'] ??
                        AppLocalizations.of(context)!.floodAlert,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    alert['area'] ?? '',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  trailing: const Icon(Icons.chevron_right_rounded),
                  onTap: () async {
                    _sheetController.animateTo(
                      0.95,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeOut,
                    );
                    await _navigatorKey.currentState?.push(
                      MaterialPageRoute(
                        builder: (_) =>
                            _FloodAlertDetailsContent(
                              alert: alert,
                              showBackButton: true,
                              scrollController: scrollController,
                            ),
                      ),
                    );
                    if (mounted) {
                      _sheetController.animateTo(
                        0.6,
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeOut,
                      );
                    }
                  },
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

class _FloodAlertDetailsContent extends StatelessWidget {
  const _FloodAlertDetailsContent({
    required this.alert,
    this.scrollController,
    this.showBackButton = false,
  });

  final Map<String, dynamic> alert;
  final ScrollController? scrollController;
  final bool showBackButton;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme
        .of(context)
        .colorScheme;
    return Material(
      color: scheme.surface,
      child: SingleChildScrollView(
        controller: scrollController,
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (!showBackButton) ...[
              Center(
                child: Container(
                  width: 40,
                  height: 4,
                  decoration: BoxDecoration(
                    color: scheme.outlineVariant,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),
              const SizedBox(height: 24),
            ] else
              ...[
                IconButton(
                  icon: const Icon(Icons.arrow_back_rounded),
                  onPressed: () => Navigator.of(context).pop(),
                ),
                const SizedBox(height: 8),
              ],
            Row(
              children: [
                Icon(
                    Icons.warning_amber_rounded, color: scheme.error, size: 32),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    alert['headline'] ??
                        AppLocalizations.of(context)!.floodAlert,
                    style: Theme
                        .of(context)
                        .textTheme
                        .headlineSmall
                        ?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            _DetailSection(title: AppLocalizations.of(context)!.area,
                content: alert['area'],
                icon: Icons.location_on_outlined),
            _DetailSection(title: AppLocalizations.of(context)!.description,
                content: alert['description'],
                icon: Icons.description_outlined),
            _DetailSection(title: AppLocalizations.of(context)!.instruction,
                content: alert['instruction'],
                icon: Icons.info_outline),
            _DetailSection(title: AppLocalizations.of(context)!.severity,
                content: alert['severity'],
                icon: Icons.speed_outlined),
            _DetailSection(title: AppLocalizations.of(context)!.response,
                content: alert['responseType'],
                icon: Icons.reply_outlined),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}

class _DetailSection extends StatelessWidget {
  const _DetailSection({
    required this.title,
    required this.content,
    required this.icon,
  });

  final String title;
  final String? content;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    if (content == null || content!.isEmpty) return const SizedBox.shrink();
    final scheme = Theme
        .of(context)
        .colorScheme;
    return Padding(
      padding: const EdgeInsets.only(bottom: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, size: 18, color: scheme.primary),
              const SizedBox(width: 8),
              Text(
                title,
                style: Theme
                    .of(context)
                    .textTheme
                    .labelLarge
                    ?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: scheme.primary,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            content!,
            style: Theme
                .of(context)
                .textTheme
                .bodyLarge,
          ),
        ],
      ),
    );
  }
}

dynamic _firstOrNull(List? list) {
  if (list == null || list.isEmpty) return null;
  return list.first;
}
