import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_notifier.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get/instance_manager.dart';
import 'package:sayaaratukum/data/services/remote/public/store.dart';
import 'package:sayaaratukum/domain/controllers/controller.dart';
import 'package:sayaaratukum/domain/controllers/public/stores.dart';
import 'package:sayaaratukum/util/error_handler.dart';
import 'package:sayaaratukum/util/exta/string.dart';
import 'package:sayaaratukum/util/store_type.dart';
import 'package:sayaaratukum/domain/models/store_type.dart';
import 'package:sayaaratukum/domain/models//store.dart';

class SearchStoresController extends BaseController
    with StateMixin<List<StoreModel>>, ScrollMixin {
  static SearchStoresController get instance => Get.find();

  var stores = <StoreModel>[].obs.toList(growable: true);
  RxBool isLoadingMore = false.obs;

  String nameStore = "";

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
    nameStore = StoresController.instance.search.text;
    loadingData();
    getStore(nameStore);
  }

  Future<void> getStore(String nameStore) async {
    stores.clear();
    loadingData();

    try {
      await StoreServices.instance
          .searchStores(nameStore, page: page, limit: limitRepositories)
          .then((response) {
        if (response.isOk) {
          List<StoreModel> result = StoreModel.listFromJson(
            response.body[data],
          );

          var responseData = response.body[data];
          final bool emptyRepositories =
              (responseData == null || responseData.isEmpty);
          // final bool emptyRepositories = response.body?.isEmpty ?? true;
          print("emptyRepositories $emptyRepositories ${response.body}");
          if (!getFirstData && emptyRepositories) {
            change(null, status: RxStatus.empty());
          } else if (getFirstData && emptyRepositories) {
            lastPage = true;
            loadingMore(false);
          } else {
            getFirstData = true;
            stores.addAll(result);
            loadingMore(false);
            change(stores, status: RxStatus.success());
          }
        }
      });
    } on Response catch (response) {
      RequestResult result = errorHandler(response);
      change(null, status: RxStatus.error(result.message));
      print("getAllBrand ${response.statusCode}");
    }
  }

  @override
  Future<void> onEndScroll() async {
    print(" loadingggg more $nameStore");

    if (!lastPage) {
      page += 1;
      loadingMore(true);
      change(stores, status: RxStatus.loadingMore());
      await getStore(nameStore);
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
  Future<void> onTopScroll() async {
    print(" state more");
  }

  Future<void> onRefresh() async {
    getStore(nameStore);
  }

  onClickStoreCar(StoreModel store) {
    var id = store.id.toString();
    if (store.type.name.toStoreType() == StoreType.cars) {
      storeCars(id);
    } else {
      storeTools(id);
    }
  }

  searchByText(String text) {
    if (text.trim().isNotEmpty) init();
  }
}
