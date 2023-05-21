import 'package:get/get.dart';
import 'package:sayaaratukum/controllers/controller.dart';
import 'package:sayaaratukum/controllers/pagination.dart';
import 'package:sayaaratukum/models/store.dart';
import 'package:sayaaratukum/services/remote/public/store.dart';
import 'package:sayaaratukum/util/constant.dart';
import 'package:sayaaratukum/util/store_type.dart';

class StoresController extends BaseController
    with StateMixin<List<StoreModel>>, PaginationController, ScrollMixin {
  static StoresController get instance => Get.find();

  var stores = <StoreModel>[].obs.toList(growable: true);
  RxBool isLoadingMore = false.obs;
  RxString storeType = "cars".obs;

  @override
  void onInit() {
    super.onInit();
    loadingData();
    getAllStore();
  }

  Future<void> getAllStore() async {
    try {
      await StoreServices.instance
          .getStoresByType(page: page, limit: limitRepositories)
          .then((response) {
        if (response.isOk) {
          List<StoreModel> result = StoreModel.listFromJson(
            response.body[Constants.bodyData],
          );

          final bool emptyRepositories = response.body?.isEmpty ?? true;
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
      change(null, status: RxStatus.error());
      print("getAllBrand ${response.statusCode}");
    }
  }

  @override
  Future<void> onEndScroll() async {
    if (!lastPage) {
      page += 1;
      loadingMore(true);
      change(stores, status: RxStatus.loadingMore());
      await getAllStore();
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


  filterStores(StoreType type) {
    storeType.value = type.name;
    update();
  }

  bool stateLastItem(int index, int length) {
    return index >= length && isLoadingMore.value;
  }

  @override
  Future<void> onTopScroll() async {}

  Future<void> onRefresh() async {
    stores.clear();
    getAllStore();
  }
}
