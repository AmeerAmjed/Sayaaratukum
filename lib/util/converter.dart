import 'package:get/get_utils/src/extensions/export.dart';
import 'package:sayaaratukum/ui/l10n//lang.dart';

String convertMetersToKilometers(String metersString) {
  double meters = double.tryParse(metersString) ?? 0.0;
  const double kilometersPerMeter = 0.001;
  double kilometers = meters * kilometersPerMeter;
  return kilometers.toString() + L10n.km.tr;
}

