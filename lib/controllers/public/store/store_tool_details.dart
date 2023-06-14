import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_notifier.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get/instance_manager.dart';
import 'package:sayaaratukum/controllers/controller.dart';
import 'package:sayaaratukum/models/tool.dart';
import 'package:sayaaratukum/route/page.dart';
import 'package:sayaaratukum/services/remote/public/tools.dart';
import 'package:sayaaratukum/util/constant.dart';

class StoreToolDetailsController extends BaseController
    with StateMixin, ScrollMixin {
  static StoreToolDetailsController get instance => Get.find();

  RxStatus combinedStatus = RxStatus.loading();
  RxList<ToolModel> tools = <ToolModel>[].obs;

  RxBool isLoadingMore = false.obs;
  var idStore = "0".obs;

  final int limitRepositories = 20;
  int page = 1;
  bool getFirstData = false;
  bool lastPage = false;

  @override
  void onInit() {
    super.onInit();
    idStore.value = Get.arguments[Constants.idToolStoreKey] ?? "0";

    loadingData();
    getCars();
  }

  Future<void> getCars() async {
    tools.clear();
    try {
      await ToolsServices.instance
          .getToolsInStore(idStore.value, page: page, limit: limitRepositories)
          .then((response) {
        if (response.isOk) {
          List<ToolModel> result = ToolModel.listFromJson(
            response.body[data],
          );

          var responseData = response.body[data];
          final bool emptyRepositories =
          (responseData == null || responseData.isEmpty);
          if (!getFirstData && emptyRepositories) {
            change(null, status: RxStatus.empty());
          } else if (getFirstData && emptyRepositories) {
            lastPage = true;
            loadingMore(false);
          } else {
            getFirstData = true;
            tools.addAll(result);
            loadingMore(false);
            change(tools, status: RxStatus.success());
          }
        }
      });
    } on Response catch (response) {
      change(null, status: RxStatus.error());
      print("getAllBrand ${response.statusCode}");
    }
  }

  @override
  Future<void> onEndScroll() async {
    if (!lastPage) {
      page += 1;
      loadingMore(true);
      change(tools, status: RxStatus.loadingMore());
      await getCars();
      Get.back();
    }
  }

  loadingData() {
    change(null, status: RxStatus.loading());
  }

  loadingMore(bool state) {
    isLoadingMore.value = state;
    update();
  }

  bool stateLastItem(int index, int length) {
    return index >= length && isLoadingMore.value;
  }

  @override
  Future<void> onTopScroll() async {
    print(" state more");
  }

  Future<void> onRefresh() async {
    loadingData();
    getCars();
  }

  navigateToDetails(int id) {
    Get.toNamed(
      RouteScreen.carDetails,
      arguments: {
        Constants.idCarKey: id.toString(),
      },
    );
  }
}
