import 'package:flutter/material.dart';
import '../l10n/app_localizations.dart';
import '../services/notification_service.dart';
import '../services/preferences_service.dart';
import '../weather_alerts_screen.dart';

class WeatherAlertsOnboardingModal extends StatelessWidget {
  const WeatherAlertsOnboardingModal({super.key});

  static Future<void> show(BuildContext context) async {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      isDismissible: false,
      enableDrag: false,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (context) => const WeatherAlertsOnboardingModal(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final l10n = AppLocalizations.of(context)!;

    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom + 20,
        left: 24,
        right: 24,
        top: 24,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: colorScheme.primaryContainer,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Icon(
                  Icons.notifications_active_rounded,
                  color: colorScheme.onPrimaryContainer,
                  size: 28,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      l10n.onboardingAlertsTitle,
                      style: theme.textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      'WeatherFast Notifications',
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Text(
            l10n.onboardingAlertsDesc,
            style: theme.textTheme.bodyMedium?.copyWith(
              color: colorScheme.onSurface,
              height: 1.4,
            ),
          ),
          const SizedBox(height: 18),
          _buildFeatureItem(
            context,
            icon: Icons.flood_outlined,
            iconColor: colorScheme.error,
            bgColor: colorScheme.errorContainer.withValues(alpha: 0.5),
            text: l10n.onboardingAlertsFeature1,
          ),
          const SizedBox(height: 10),
          _buildFeatureItem(
            context,
            icon: Icons.grain_rounded,
            iconColor: colorScheme.primary,
            bgColor: colorScheme.primaryContainer.withValues(alpha: 0.5),
            text: l10n.onboardingAlertsFeature2,
          ),
          const SizedBox(height: 10),
          _buildFeatureItem(
            context,
            icon: Icons.tune_rounded,
            iconColor: colorScheme.tertiary,
            bgColor: colorScheme.tertiaryContainer.withValues(alpha: 0.5),
            text: l10n.onboardingAlertsFeature3,
          ),
          const SizedBox(height: 20),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: colorScheme.secondaryContainer.withValues(alpha: 0.6),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  Icons.privacy_tip_outlined,
                  color: colorScheme.onSecondaryContainer,
                  size: 20,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    l10n.onboardingAlertsPrivacy,
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: colorScheme.onSecondaryContainer,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: () async {
                  await PreferencesService.saveWeatherAlertsPromptShown(true);
                  if (context.mounted) {
                    Navigator.pop(context);
                  }
                },
                child: Text(l10n.notNow),
              ),
              const SizedBox(width: 12),
              FilledButton.icon(
                onPressed: () async {
                  await PreferencesService.saveWeatherAlertsPromptShown(true);
                  if (context.mounted) {
                    Navigator.pop(context);
                  }

                  // Request notification permission
                  await NotificationService().requestPermissions();

                  if (context.mounted) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const WeatherAlertsScreen(),
                      ),
                    );
                  }
                },
                icon: const Icon(Icons.check_rounded, size: 18),
                label: Text(l10n.enableWeatherAlerts),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildFeatureItem(
    BuildContext context, {
    required IconData icon,
    required Color iconColor,
    required Color bgColor,
    required String text,
  }) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: bgColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(icon, size: 18, color: iconColor),
        ),
        const SizedBox(width: 14),
        Expanded(
          child: Text(
            text,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w500,
                ),
          ),
        ),
      ],
    );
  }
}
