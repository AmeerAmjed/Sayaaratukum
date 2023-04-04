import 'package:sayaaratukum/util/store_type.dart';

extension ToString on String {
  StoreType toStoreType() {
    return this == StoreType.cars.name ? StoreType.cars : StoreType.tools;
  }
}
