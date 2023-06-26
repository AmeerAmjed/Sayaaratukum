import 'package:get/get.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_notifier.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:sayaaratukum/controllers/controller.dart';
import 'package:sayaaratukum/controllers/pagination.dart';
import 'package:sayaaratukum/models/brand.dart';
import 'package:sayaaratukum/route/page.dart';
import 'package:sayaaratukum/services/remote/public/brand.dart';
import 'package:sayaaratukum/util/constant.dart';

class BrandPinController extends BaseController
    with StateMixin<List<BrandModel>>, PaginationController, ScrollMixin {
  static BrandPinController get instance => Get.find();

  var brands = <BrandModel>[].obs.toList(growable: true);
  RxBool isLoadingMore = false.obs;

  final int limitRepositories = 20;
  int page = 1;
  bool getFirstData = false;
  bool lastPage = false;

  @override
  void onInit() {
    super.onInit();
    loadingData();
    getAllBrand();
  }

  Future<void> getAllBrand() async {
    try {
      await BrandServices.instance
          .getAllBrandPin(page: page, limit: limitRepositories)
          .then((response) {
        if (response.isOk) {
          List<BrandModel> result = BrandModel.listFromJson(
            response.body[Constants.bodyData],
          );

          final bool emptyRepositories = response.body?.isEmpty ?? true;
          if (!getFirstData && emptyRepositories) {
            change(null, status: RxStatus.empty());
          } else if (getFirstData && emptyRepositories) {
            lastPage = true;
          } else {
            getFirstData = true;
            brands.addAll(result);

            change(brands, status: RxStatus.success());
          }
          loadingMore(false);
        }
      });
    } on Response catch (response) {
      change(null, status: RxStatus.error());
      print("getAllBrand ${response.statusCode}");
    }
  }

  onBrandClicked(String id, String name) {
    Get.toNamed(
      RouteScreen.searchCarByBrand,
      parameters: {
        Constants.brandIdKey: id,
        Constants.nameBrandKey: name,
      },
    );
  }

  @override
  Future<void> onEndScroll() async {
    if (!lastPage) {
      page += 1;
      loadingMore(true);
      change(brands, status: RxStatus.loadingMore());
      await getAllBrand();
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
}