abstract class BaseModel {

  static List<T> listFromJson<T>(
    List<Map<String, dynamic>> list,
    Function(Map<String, dynamic>) fromJson,
  ) {
    return List<T>.from(
      list.map(
        (x) => fromJson(x),
      ),
    ).toList();
  }
}
