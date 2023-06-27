import 'model.dart';

class NotificationModel extends BaseModel {
  final int id;
  final String state;
  final ItemNotificationModel? product;
  final String? type;
  bool isRead;
  final String nameStore;
  final String imageUrlItem;

  NotificationModel({
    required this.id,
    required this.state,
    this.product,
    this.type,
    required this.imageUrlItem,
    required this.nameStore,
    required this.isRead,
  });

  factory NotificationModel.fromJson(Map<String, dynamic> json) {
    return NotificationModel(
      id: json['id'],
      state: json['state'],
      product: ItemNotificationModel.fromJson(json['product']),
      type: json['type'],
      imageUrlItem: json['type'] == "car"
          ? json['product']['images'][0]['path']
          : json['product']['image'],
      nameStore: json['type'] == "car"
          ? json['product']['carable']['name'] ??
              json['product']['carable']['fullname']
          : json['product']['store']['name'] ?? "",
      isRead: json['is_read'] == 0 ? false : true,
    );
  }

  static List<NotificationModel> listFromJson(List<dynamic> list) {
    final favoriteList = list
        .map((x) => NotificationModel.fromJson(x))
        .where(
            (favorite) => (favorite.product != null && favorite.type != null))
        .toList();
    return favoriteList;
  }
}

class ItemNotificationModel extends BaseModel {
  ItemNotificationModel({
    required this.id,
    required this.name,
  });

  final int id;
  final String name;

  factory ItemNotificationModel.fromJson(Map<String, dynamic> data) {
    return ItemNotificationModel(
      id: data['id'],
      name: data['name'],
    );
  }
}