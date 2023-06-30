import 'package:sayaaratukum/domain/models//brand.dart';
import 'package:sayaaratukum/domain/models//category.dart';
import 'package:sayaaratukum/domain/models//models_brand.dart';
import 'package:sayaaratukum/domain/models//store.dart';
import 'package:sayaaratukum/domain/models//store_tool.dart';

import 'model.dart';

class ToolModel extends BaseModel {
  ToolModel({
    this.description,
    this.serialNumber,
    required this.id,
    required this.idStore,
    required this.name,
    required this.imageUrl,
    required this.currency,
    required this.price,
    required this.color,
    required this.status,
    required this.store,
    required this.category,
    required this.brand,
    required this.model,
  });

  final int id;
  final int idStore;
  final String name;
  final String imageUrl;
  final String? currency;
  final int price;
  final String? color;
  final String status;
  final String? description;
  final String? serialNumber;
  final StoreToolModel store;
  final CategoryModel category;
  final BrandModel brand;
  final ModelsBrandModel model;

  factory ToolModel.fromJson(Map<String, dynamic> json) {
    return ToolModel(
      id: json['id'],
      idStore: json['store']['id'],
      name: json['name'],
      imageUrl: json['image'],
      currency: json['currency'],
      price: json['pirce'],
      serialNumber: json['serial_number'],
      color: json['color'],
      status: json['status'],
      description: json['description'],
      store: StoreToolModel.fromJson(json['store']),
      category: CategoryModel.fromJson(json['category']),
      brand: BrandModel.fromJson(json['brand']),
      model: ModelsBrandModel.fromJson(json['brand_model']),
    );
  }

  static List<ToolModel> listFromJson(list) => List<ToolModel>.from(
        list.map(
          (x) => ToolModel.fromJson(x),
        ),
      ).toList();
}
