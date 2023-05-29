enum StoreType { cars, tools }

extension IntExtensions on int {
  StoreType toTypeStore() {
    return this == 1 ? StoreType.cars : StoreType.tools;
  }
}