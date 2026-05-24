import 'package:flutter/material.dart';
import '../services/rating_service.dart';
import 'animated_award_star.dart';

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
                'Enjoying WeatherFast?',
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 12),
              Text(
                'If you like using our app, please take a moment to rate it in the Play Store. Your support means the world to us!',
                style: Theme.of(context).textTheme.bodyMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24),
              FilledButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  RatingService.markAsRated();
                },
                child: const Text('Rate Now'),
              ),
              if (promptShownCount == 0) ...[
                const SizedBox(height: 12),
                OutlinedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    RatingService.remindMeLater();
                  },
                  child: const Text('Remind Me in 2 Days'),
                ),
              ],
              if (promptShownCount >= 1) ...[
                const SizedBox(height: 12),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    RatingService.declineRating();
                  },
                  child: const Text('No Thanks'),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
