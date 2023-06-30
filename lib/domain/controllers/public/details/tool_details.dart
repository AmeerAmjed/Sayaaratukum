import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_utils/src/extensions/export.dart';
import 'package:sayaaratukum/domain/controllers/controller.dart';
import 'package:sayaaratukum/ui/l10n//lang.dart';
import 'package:sayaaratukum/domain/models//tool.dart';
import 'package:sayaaratukum/ui/route/page.dart';
import 'package:sayaaratukum/data/services/remote/public/tools.dart';
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

  navToStoreTool(String id) {
    print("id $id");
    Get.toNamed(
      RouteScreen.storeToolDetails,
      arguments: {
        Constants.idToolStoreKey: id,
      },
    );
  }
}
