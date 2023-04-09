import 'package:sayaaratukum/models/brand.dart';
import 'package:sayaaratukum/models/category.dart';
import 'package:sayaaratukum/models/models_brand.dart';
import 'package:sayaaratukum/models/store.dart';

import 'model.dart';

class ToolModel extends BaseModel {
  ToolModel({
    this.description,
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.currency,
    required this.price,
    required this.color,
    required this.status,
    required this.store,
    // required this.category,
    // required this.brand,
    // required this.modelSelected,
  });

  final int id;
  final String name;
  final String imageUrl;
  final String? currency;
  final int price;
  final String? color;
  final String status;
  final String? description;
  final StoreModel store;
  // final CategoryModel category;
  // final BrandModel brand;
  // final ModelsBrandModel modelSelected;

  factory ToolModel.fromJson(Map<String, dynamic> json) {
    return ToolModel(
      id: json['id'],
      name: json['name'],
      imageUrl: json['image'],
      currency: json['currency'],
      price: json['pirce'],
      color: json['color'],
      status: json['status'],
      description: json['description'],
      store: StoreModel.fromJson(json['store']),
      // category: CategoryModel.fromJson(json['category']),
      // brand: BrandModel.fromJson(json['brand']),
      // modelSelected: ModelsBrandModel.fromJson(json['brand_model']),
    );
  }

  static List<ToolModel> listFromJson(list) => List<ToolModel>.from(
        list.map(
          (x) => ToolModel.fromJson(x),
        ),
      ).toList();
}
