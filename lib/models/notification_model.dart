import 'model.dart';

class NotificationModel extends BaseModel {
  final int id;
  final String state;
  final Object product;
  final String? type;
  final bool isRead;

  NotificationModel({
    required this.id,
    required this.state,
    required this.product,
    this.type,
    required this.isRead,
  });

  factory NotificationModel.fromJson(Map<String, dynamic> json) {
    return NotificationModel(
      id: json['id'],
      state: json['state'],
      product: json['product'],
      type: json['type'],
      isRead: json['isRead'],
    );
  }

  static List<NotificationModel> listFromJson(list) =>
      List<NotificationModel>.from(
        list.map(
          (x) => NotificationModel.fromJson(x),
        ),
      ).toList();
}
