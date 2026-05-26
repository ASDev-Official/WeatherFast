import 'package:timezone/data/latest_all.dart' as tzdata;
import 'package:timezone/timezone.dart' as tz;

class TimeUtils {
  static bool _initialized = false;

  /// Known IANA timezone aliases/links that the timezone package may not
  /// include as primary entries. Maps alias → canonical zone.
  static const Map<String, String> _tzAliases = {
    'Europe/Luxembourg': 'Europe/Brussels',
    'Europe/Vatican': 'Europe/Rome',
    'Europe/San_Marino': 'Europe/Rome',
    'Europe/Guernsey': 'Europe/London',
    'Europe/Jersey': 'Europe/London',
    'Europe/Isle_of_Man': 'Europe/London',
    'Europe/Mariehamn': 'Europe/Helsinki',
    'Europe/Podgorica': 'Europe/Belgrade',
    'Europe/Sarajevo': 'Europe/Belgrade',
    'Europe/Skopje': 'Europe/Belgrade',
    'Europe/Zagreb': 'Europe/Belgrade',
    'Europe/Bratislava': 'Europe/Prague',
    'Europe/Busingen': 'Europe/Zurich',
    'Africa/Asmara': 'Africa/Nairobi',
    'Africa/Timbuktu': 'Africa/Abidjan',
    'America/Coral_Harbour': 'America/Panama',
    'America/Godthab': 'America/Nuuk',
    'America/Virgin': 'America/St_Thomas',
    'Pacific/Johnston': 'Pacific/Honolulu',
    'Pacific/Midway': 'Pacific/Pago_Pago',
  };

  static Future<void> initialize() async {
    if (!_initialized) {
      tzdata.initializeTimeZones();
      _initialized = true;
    }
  }

  static DateTime getLocalTime(String tzId) {
    if (!_initialized) {
      tzdata.initializeTimeZones();
      _initialized = true;
    }
    // Try the given tzId first; if it fails (e.g. an IANA link/alias that
    // isn't in the package's primary database), try a known alias mapping,
    // then fall back to UTC so the app never crashes on an unknown timezone.
    try {
      final location = tz.getLocation(tzId);
      return tz.TZDateTime.now(location);
    } catch (_) {}

    final canonical = _tzAliases[tzId];
    if (canonical != null) {
      try {
        final location = tz.getLocation(canonical);
        return tz.TZDateTime.now(location);
      } catch (_) {}
    }

    // Final fallback: use UTC
    return DateTime.now().toUtc();
  }
}
