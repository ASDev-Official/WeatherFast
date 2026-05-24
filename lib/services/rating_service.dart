import 'dart:io';

import 'package:flutter/material.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

import '../ui/rating_bottom_sheet.dart';

class RatingService {
  static const String _kFirstLaunchTime = 'rating_first_launch_time';
  static const String _kPromptShownCount = 'rating_prompt_shown_count';
  static const String _kLastPromptTime = 'rating_last_prompt_time';
  static const String _kRatingStatus =
      'rating_status'; // 0: default, 1: never ask again, 2: rated

  static const int _delayDays = 2;

  static Future<void> initialize() async {
    final prefs = await SharedPreferences.getInstance();
    if (!prefs.containsKey(_kFirstLaunchTime)) {
      await prefs.setInt(
        _kFirstLaunchTime,
        DateTime.now().millisecondsSinceEpoch,
      );
    }
  }

  static Future<void> checkAndShowRating(BuildContext context) async {
    if (!Platform.isAndroid) return;

    final prefs = await SharedPreferences.getInstance();
    final status = prefs.getInt(_kRatingStatus) ?? 0;

    if (status != 0) return;

    final firstLaunchTimeMs = prefs.getInt(_kFirstLaunchTime);
    if (firstLaunchTimeMs == null) return;

    final now = DateTime.now();
    final firstLaunchTime = DateTime.fromMillisecondsSinceEpoch(
      firstLaunchTimeMs,
    );
    final daysSinceFirstLaunch = now.difference(firstLaunchTime).inDays;

    if (daysSinceFirstLaunch < _delayDays) return;

    final promptShownCount = prefs.getInt(_kPromptShownCount) ?? 0;

    if (promptShownCount > 0) {
      final lastPromptTimeMs = prefs.getInt(_kLastPromptTime);
      if (lastPromptTimeMs != null) {
        final lastPromptTime = DateTime.fromMillisecondsSinceEpoch(
          lastPromptTimeMs,
        );
        if (now.difference(lastPromptTime).inDays < _delayDays) {
          return; // Wait 2 days between prompts
        }
      }
    }

    // Conditions met, show the prompt
    if (context.mounted) {
      showModalBottomSheet(
        context: context,
        isDismissible: false,
        enableDrag: false,
        isScrollControlled: true,
        builder: (context) =>
            RatingBottomSheet(promptShownCount: promptShownCount),
      );
    }
  }

  static Future<void> markAsRated() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(_kRatingStatus, 2);

    final InAppReview inAppReview = InAppReview.instance;

    try {
      if (await inAppReview.isAvailable()) {
        await inAppReview.requestReview();
      } else {
        await _fallbackToPlayStore();
      }
    } catch (e) {
      await _fallbackToPlayStore();
    }
  }

  static Future<void> _fallbackToPlayStore() async {
    try {
      final packageInfo = await PackageInfo.fromPlatform();
      final packageName = packageInfo.packageName;
      final url = Uri.parse(
        'https://play.google.com/store/apps/details?id=$packageName',
      );
      if (await canLaunchUrl(url)) {
        await launchUrl(url, mode: LaunchMode.externalApplication);
      }
    } catch (e) {
      // Ignored if fallback also fails
    }
  }

  static Future<void> remindMeLater() async {
    final prefs = await SharedPreferences.getInstance();
    final currentCount = prefs.getInt(_kPromptShownCount) ?? 0;
    await prefs.setInt(_kPromptShownCount, currentCount + 1);
    await prefs.setInt(_kLastPromptTime, DateTime.now().millisecondsSinceEpoch);
  }

  static Future<void> declineRating() async {
    final prefs = await SharedPreferences.getInstance();
    final currentCount = prefs.getInt(_kPromptShownCount) ?? 0;

    if (currentCount == 0) {
      // Treat as remind me later for the first time
      await prefs.setInt(_kPromptShownCount, currentCount + 1);
      await prefs.setInt(
        _kLastPromptTime,
        DateTime.now().millisecondsSinceEpoch,
      );
    } else {
      // Second time clicking no thanks, never ask again
      await prefs.setInt(_kRatingStatus, 1);
    }
  }

  static Future<void> resetRatingPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_kFirstLaunchTime);
    await prefs.remove(_kPromptShownCount);
    await prefs.remove(_kLastPromptTime);
    await prefs.remove(_kRatingStatus);
    await initialize();
  }

  static Future<void> debugFastForwardTime() async {
    final prefs = await SharedPreferences.getInstance();
    final status = prefs.getInt(_kRatingStatus) ?? 0;
    if (status != 0) return;

    final pastTime = DateTime.now()
        .subtract(const Duration(days: 3))
        .millisecondsSinceEpoch;

    if (prefs.containsKey(_kFirstLaunchTime)) {
      await prefs.setInt(_kFirstLaunchTime, pastTime);
    }

    if (prefs.containsKey(_kLastPromptTime)) {
      await prefs.setInt(_kLastPromptTime, pastTime);
    }
  }
}
