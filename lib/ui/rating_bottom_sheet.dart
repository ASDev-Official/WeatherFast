import 'package:flutter/material.dart';
import '../services/rating_service.dart';
import 'animated_award_star.dart';
import '../l10n/app_localizations.dart';

class RatingBottomSheet extends StatelessWidget {
  final int promptShownCount;

  const RatingBottomSheet({super.key, required this.promptShownCount});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Center(
                child: AnimatedAwardStar(size: 100),
              ),
              const SizedBox(height: 16),
              Text(
                AppLocalizations.of(context)!.enjoyingWeatherFast,
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 12),
              Text(
                AppLocalizations.of(context)!.rateAppDescription,
                style: Theme.of(context).textTheme.bodyMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24),
              FilledButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  RatingService.markAsRated();
                },
                child: Text(AppLocalizations.of(context)!.rateNow),
              ),
              if (promptShownCount == 0) ...[
                const SizedBox(height: 12),
                OutlinedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    RatingService.remindMeLater();
                  },
                  child: Text(AppLocalizations.of(context)!.remindMeLater),
                ),
              ],
              if (promptShownCount >= 1) ...[
                const SizedBox(height: 12),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    RatingService.declineRating();
                  },
                  child: Text(AppLocalizations.of(context)!.noThanks),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
