import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_utils/src/extensions/export.dart';
import 'package:sayaaratukum/controllers/controller.dart';
import 'package:sayaaratukum/l10n/lang.dart';
import 'package:sayaaratukum/models/tool.dart';
import 'package:sayaaratukum/route/page.dart';
import 'package:sayaaratukum/services/remote/public/tools.dart';
import 'package:sayaaratukum/util/constant.dart';

class ToolDetailsController extends BaseController with StateMixin<ToolModel> {
  var idTool = "0".obs;

  @override
  void onInit() {
    idTool.value = Get.arguments[Constants.idToolKey] ?? "0";
    getCarById();
    super.onInit();
  }

  getCarById() async {
    try {
      await ToolsServices.instance.getToolById(idTool.value).then((response) {
        if (response.isOk) {
          ToolModel result = ToolModel.fromJson(
            response.body[data],
          );
          change(result, status: RxStatus.success());
        } else {
          change(null, status: RxStatus.error(L10n.notFound.tr));
        }
      });
    } on Response catch (response) {
      change(null, status: RxStatus.error(L10n.notFound.tr));
      print("ToolDetailsController getCarById${response.statusCode}");
    }
  }

  navToStoreCar(String id) {
    Get.toNamed(
      RouteScreen.storeCarDetails,
      arguments: {
        Constants.idStoreKey: id,
      },
    );
  }
}
