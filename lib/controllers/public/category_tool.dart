import 'package:get/get_connect/http/src/response/response.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/instance_manager.dart';
import 'package:sayaaratukum/controllers/controller.dart';
import 'package:sayaaratukum/models/category_tool.dart';
import 'package:sayaaratukum/services/remote/public/tools.dart';
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
}
