import 'package:get/get_connect/http/src/response/response.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/instance_manager.dart';
import 'package:sayaaratukum/domain/controllers/controller.dart';
import 'package:sayaaratukum/domain/models//category_tool.dart';
import 'package:sayaaratukum/data/services/remote/public/tools.dart';
import 'package:sayaaratukum/util/constant.dart';

class CategoryToolController extends BaseController {
  static CategoryToolController get instance => Get.find();
  var category = <CategoryToolModel>[].obs.toList(growable: true);

  @override
  void onInit() {
    getCategories();
    super.onInit();
  }

  Future<void> getCategories() async {
    try {
      await ToolsServices.instance.getCategories().then((response) {
        if (response.isOk) {
          List<CategoryToolModel> resultCategory =
              CategoryToolModel.listFromJson(
            response.body[Constants.bodyData],
          );
          category.addAll(resultCategory);
          update();
        }
      });
    } on Response catch (response) {
      print("CategoryToolController getCategories${response.statusCode}");
    }
  }

  Future<List<CategoryToolModel>> getCategoriesNow() async {
    return await ToolsServices.instance.getCategories().then((response) {
      List<CategoryToolModel> resultCategory = CategoryToolModel.listFromJson(
        response.body[Constants.bodyData],
      );
      category.addAll(resultCategory);
      update();
      return resultCategory;
    });
  }
}
