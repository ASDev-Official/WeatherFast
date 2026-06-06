import 'package:weatherfast/services/global_data.dart';

class UnitConverter {
  static double convertWind(num windSpeed) {
    final windKph = windSpeed.toDouble();
    switch (GlobalData.windUnit) {
      case 'mph':
        return windKph * 0.621371;
      case 'm/s':
        return windKph / 3.6;
      case 'knots':
        return windKph * 0.539957;
      case 'km/h':
      default:
        return windKph;
    }
  }

  static double convertVisibility(num visibility) {
    final visKm = visibility.toDouble();
    switch (GlobalData.visibilityUnit) {
      case 'mi':
        return visKm * 0.621371;
      case 'km':
      default:
        return visKm;
    }
  }
}
