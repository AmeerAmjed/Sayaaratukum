import 'package:get_storage/get_storage.dart';

mixin LocalStorage {
  T? getData<T>(String key) {
    final box = GetStorage();
    return box.read(key);
  }

  Future<void> save<T>(String key, T value) {
    final box = GetStorage();
    return box.write(key, value);
  }

  Future<void> removeData(String key) async {
    final box = GetStorage();
    await box.remove(key);
  }
}
