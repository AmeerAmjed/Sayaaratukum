enum StoreType { cars, tools }

enum TypeAds { car, tool }

extension IntExtensions on int {
  StoreType toTypeStore() {
    return this == 1 ? StoreType.cars : StoreType.tools;
  }
}

extension Type on String {
  TypeAds getTypeAds() {
    return this == TypeAds.car.name ? TypeAds.car : TypeAds.tool;
  }
}
