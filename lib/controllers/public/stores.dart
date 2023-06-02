import 'package:get/get.dart';
import 'package:sayaaratukum/controllers/controller.dart';
import 'package:sayaaratukum/controllers/pagination.dart';
import 'package:sayaaratukum/models/store.dart';
import 'package:sayaaratukum/route/page.dart';
import 'package:sayaaratukum/services/remote/public/store.dart';
import 'package:sayaaratukum/util/constant.dart';
import 'package:sayaaratukum/util/store_type.dart';

class StoresController extends BaseController
    with StateMixin<List<StoreModel>>, PaginationController, ScrollMixin {
  static StoresController get instance => Get.find();

  var stores = <StoreModel>[].obs.toList(growable: true);
  RxBool isLoadingMore = false.obs;
  RxInt storeTypeId = 1.obs;

  @override
  void onInit() {
    super.onInit();
    loadingData();
    getAllStore(storeTypeId.value);
  }

  Future<void> getAllStore(int typeId) async {
    stores.clear();
    loadingData();
    try {
      await StoreServices.instance
          .getStoresByType(storeTypeId.value,
              page: page, limit: limitRepositories)
          .then((response) {
        if (response.isOk) {
          List<StoreModel> result = StoreModel.listFromJson(
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

  onClickStoreCar(StoreModel storeCars) {
    if (storeTypeId.value.toTypeStore() == StoreType.cars) {
      Get.toNamed(
        RouteScreen.storeCarDetails,
        arguments: {
          Constants.idStoreKey: storeCars.id.toString(),
        },
      );
      // Get.to(
      //   () => StoreCarDetails(
      //     storeCars: storeCars,
      //   ),
      //   arguments: {
      //     Constants.idStoreKey: storeCars.id.toString(),
      //   },
      //   binding: StoreCarDetailsBinding(),
      // );
    }
  }

  @override
  Future<void> onEndScroll() async {
    if (!lastPage) {
      page += 1;
      loadingMore(true);
      change(stores, status: RxStatus.loadingMore());
      await getAllStore(storeTypeId.value);
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
    switch (type) {
      case StoreType.cars:
        {
          storeTypeId.value = 1;
          getAllStore(storeTypeId.value);
          break;
        }

      case StoreType.tools:
        {
          storeTypeId.value = 2;
          getAllStore(storeTypeId.value);
          break;
        }
    }

    update();
  }

  bool stateLastItem(int index, int length) {
    return index >= length && isLoadingMore.value;
  }

  @override
  Future<void> onTopScroll() async {}

  Future<void> onRefresh() async {
    stores.clear();
    getAllStore(storeTypeId.value);
  }
}
