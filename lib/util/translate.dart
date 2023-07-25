
import '../domain/models/translate.dart';

String translate({
  required TranslateMode translate,
  required String langCode,
}) {
  if (langCode == 'ar') {
    return translate.ar;
  } else if (langCode == 'ku') {
    return translate.ku;
  }
  return translate.en;
}
