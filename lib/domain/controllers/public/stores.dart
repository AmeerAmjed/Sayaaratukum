import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sayaaratukum/domain/controllers/controller.dart';
import 'package:sayaaratukum/domain/controllers/pagination.dart';
import 'package:sayaaratukum/domain/models//store.dart';
import 'package:sayaaratukum/data/services/remote/public/store.dart';
import 'package:sayaaratukum/util/constant.dart';
import 'package:sayaaratukum/util/error_handler.dart';
import 'package:sayaaratukum/util/store_type.dart';

class StoresController extends BaseController
    with StateMixin<List<StoreModel>>, PaginationController, ScrollMixin {
  static StoresController get instance => Get.find();

  var stores = <StoreModel>[].obs.toList(growable: true);
  RxBool isLoadingMore = false.obs;
  RxInt storeTypeId = 1.obs;

  final int limitRepositories = 20;
  int page = 1;
  bool getFirstData = false;
  bool lastPage = false;

  late TextEditingController search;
  RxBool isTextEmpty = true.obs;

  @override
  void onInit() {
    search = TextEditingController();
    init();
    super.onInit();
  }

  init() {
    loadingData();
    stores.clear();
    getStoreType(storeTypeId.value);
  }

  resetPagination() {
    page = 1;
    getFirstData = false;
    lastPage = false;
  }

  getStoreType(int typeId) {
    resetPagination();
    getAllStore(typeId);
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
      RequestResult result = errorHandler(response);
      change(null, status: RxStatus.error(result.message));
      print("getAllBrand ${response.statusCode}");
    }
  }

  onClickStoreCar(StoreModel store) {
    var id = store.id.toString();
    if (storeTypeId.value.toTypeStore() == StoreType.cars) {
      storeCars(id);
    } else {
      storeTools(id);
    }
  }

  @override
  Future<void> onEndScroll() async {
    if (!lastPage) {
      page += 1;
      loadingMore(true);
      change(stores, status: RxStatus.loadingMore());
      await getAllStore(storeTypeId.value);
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


  filterStores(StoreType type) {
    switch (type) {
      case StoreType.cars:
        {
          storeTypeId.value = 1;
          getStoreType(storeTypeId.value);
          break;
        }

      case StoreType.tools:
        {
          storeTypeId.value = 2;
          getStoreType(storeTypeId.value);
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

  void onTextChanged(String text) {
    isTextEmpty.value = text.isEmpty;
    update();
  }

  void clearSearch() {
    search.clear();
    search.text = "";
    isTextEmpty.value = true;
    update();
  }
}
