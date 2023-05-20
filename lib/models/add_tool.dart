import 'package:get/get.dart';

import 'model.dart';

class AddToolModel extends BaseModel {
  String name;
  double price;
  String color;
  String? currency;
  String? description;
  int idBrand;
  int idModelBrand;
  int idCategory;
  int idStore;
  int status;
  String image;

  AddToolModel({
    this.description,
    this.currency = "USD",
    required this.name,
    required this.price,
    required this.color,
    required this.idBrand,
    required this.idModelBrand,
    required this.idCategory,
    required this.idStore,
    required this.status,
    required this.image,
  });

  Future<FormData> getFormData() async {
    return FormData({
      'name': name,
      'price': price.toString(),
      // 'color': color,
      'brand_id': idBrand.toString(),
      'brand_model_id': idModelBrand.toString(),
      'store_id': idStore.toString(),
      'status': status.toString(),
      'currency': currency,
      'description': description,
      'category_id': idCategory.toString(),
    });
  }
}
