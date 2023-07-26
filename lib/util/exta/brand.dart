import 'package:sayaaratukum/domain/models/brand.dart';
import 'package:sayaaratukum/domain/models/translate_with_id.dart';

extension BrandModelListExtension on List<BrandModel> {

  TranslateWithIdMode? fidsById(int id) {
    try {
      return firstWhere((brandModel) => brandModel.title.id == id).title;
    } catch (e) {
      return null;
    }
  }
}


