import 'dart:io';

import 'package:get/get.dart';

import 'model.dart';

class FormAddToolModel extends BaseModel {
  String name;
  int price;
  String color;
  String? currency;
  String? description;
  int idBrand;
  int idModelBrand;
  int idCategory;
  int? serialNumber;
  int idStore;
  String status;
  String image;

  FormAddToolModel({
    this.description,
    this.currency = "USD",
    required this.name,
    required this.price,
    required this.color,
    required this.idBrand,
    this.serialNumber,
    required this.idModelBrand,
    required this.idCategory,
    required this.idStore,
    required this.status,
    required this.image,
  });

  Future<FormData> getFormData() async {
    var data = FormData({
      'name': name,
      'pirce': price.toString(),
      'color': color,
      'brand_id': idBrand.toString(),
      'brand_model_id': idModelBrand.toString(),
      'store_id': idStore.toString(),
      'status': status,
      'currency': currency,
      'description': description,
      'category_id': idCategory.toString(),
      'serial_number': serialNumber,
    });
    var imageTool = MapEntry(
      "image",
      MultipartFile(
        File(image),
        filename:
            "${DateTime.now().millisecondsSinceEpoch}.${image.split('.').last}",
      ),
    );
    data.files.add(imageTool);

    return data;
  }

  Future<FormData> getFormDataToUpdate() async {
    var data = FormData({
      'name': name,
      'pirce': price.toString(),
      'color': color,
      'brand_id': idBrand.toString(),
      'brand_model_id': idModelBrand.toString(),
      'store_id': idStore.toString(),
      'status': status,
      'currency': currency,
      'description': description,
      'category_id': idCategory.toString(),
    });

    return data;
  }
}
