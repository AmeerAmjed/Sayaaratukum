import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_notifier.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get/instance_manager.dart';
import 'package:sayaaratukum/controllers/controller.dart';
import 'package:sayaaratukum/controllers/pagination.dart';
import 'package:sayaaratukum/controllers/public/filter/filter_tool.dart';
import 'package:sayaaratukum/models/tool.dart';
import 'package:sayaaratukum/services/remote/public/search.dart';

class SearchToolController extends BaseController
    with StateMixin<List<ToolModel>>, PaginationController, ScrollMixin {
  static SearchToolController get instance => Get.find();

  var tools = <ToolModel>[].obs.toList(growable: true);
  RxBool isLoadingMore = false.obs;

  Map<String, String> filter = {};

  final int limitRepositories = 20;
  int page = 1;
  bool getFirstData = false;
  bool lastPage = false;

  @override
  void onInit() {
    super.onInit();

    init();
  }

  init() {
    tools.clear();
    filter = FilterToolController.instance.getValueField();
    loadingData();
    getCars(filter);
  }

  Future<void> getCars(Map<String, String> filter) async {
    getFirstData = false;
    try {
      await SearchServices.instance
          .searchTool(filter, page: page, limit: limitRepositories)
          .then((response) {
        if (response.isOk) {
          List<ToolModel> result = ToolModel.listFromJson(
            response.body[data],
          );

          // final bool emptyRepositories = response.body?.isEmpty ?? true;
          var responseData = response.body[data];
          final bool emptyRepositories = responseData.isEmpty;
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
      print("getCars ${response.statusCode}");
    }
  }

  @override
  Future<void> onEndScroll() async {
    print(" loadingggg more");
    if (!lastPage) {
      page += 1;
      loadingMore(true);
      change(tools, status: RxStatus.loadingMore());
      await getCars(filter);
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
    getCars(filter);
  }

  searchByText(String text) {
    if (text.trim().isNotEmpty) init();
  }
}
