import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_notifier.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get/instance_manager.dart';
import 'package:sayaaratukum/domain/controllers/controller.dart';
import 'package:sayaaratukum/domain/models//tool.dart';
import 'package:sayaaratukum/data/services/remote/public/tools.dart';
import 'package:sayaaratukum/util/constant.dart';
import 'package:sayaaratukum/util/error_handler.dart';

class ToolsController extends BaseController
    with StateMixin<List<ToolModel>>,  ScrollMixin {
  static ToolsController get instance => Get.find();

  var brands = <ToolModel>[].obs.toList(growable: true);
  RxBool isLoadingMore = false.obs;

  final int limitRepositories = 20;
  int page = 1;
  bool getFirstData = false;
  bool lastPage = false;
  var showFab = true.obs;

  @override
  void onInit() {
    super.onInit();
    scrollListener();
    loadingData();
    getTools();
  }

  Future<void> getTools() async {
    try {
      await ToolsServices.instance
          .getAllTools(page: page, limit: limitRepositories)
          .then((response) {
        if (response.isOk) {
          List<ToolModel> result = ToolModel.listFromJson(
            response.body[Constants.bodyData],
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
            brands.addAll(result);
            loadingMore(false);
            change(brands, status: RxStatus.success());
          }
        }
      });
    } on Response catch (response) {
      RequestResult result = errorHandler(response);
      change(null, status: RxStatus.error(result.message));
      print("getAllBrand ${response.statusCode}");
    }
  }

  scrollListener() {
    scroll.addListener(() {
      var direction = scroll.position.userScrollDirection;
      if (direction == ScrollDirection.reverse) {
        showFab.value = false;
        update();
      } else if (direction == ScrollDirection.forward) {
        showFab.value = true;
        update();
      }
    });
  }

  @override
  Future<void> onEndScroll() async {
    if (!lastPage) {
      page += 1;
      loadingMore(true);
      change(brands, status: RxStatus.loadingMore());
      await getTools();
      // Get.back();
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
  Future<void> onTopScroll() async {}

  Future<void> onRefresh() async {
    getTools();
  }


}
