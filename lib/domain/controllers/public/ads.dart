import 'package:get/get.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_notifier.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:sayaaratukum/domain/controllers/controller.dart';
import 'package:sayaaratukum/domain/controllers/pagination.dart';
import 'package:sayaaratukum/domain/models//ads.dart';
import 'package:sayaaratukum/data/services/remote/public/ads.dart';
import 'package:sayaaratukum/util/constant.dart';
import 'package:sayaaratukum/util/error_handler.dart';
import 'package:sayaaratukum/util/store_type.dart';

class AdsController extends BaseController
    with StateMixin<List<AdsModel>>, PaginationController, ScrollMixin {
  static AdsController get instance => Get.find();

  var ads = <AdsModel>[].obs.toList(growable: true);
  RxBool isLoadingMore = false.obs;

  final int limitRepositories = 20;
  int page = 1;
  bool getFirstData = false;
  bool lastPage = false;

  @override
  void onInit() {
    init();
    super.onInit();
  }

  init() {
    ads.clear();
    loadingData();
    getAds();
  }

  Future<void> getAds() async {
    try {
      await AdsServices.instance
          .getAds(page: page, limit: limitRepositories)
          .then((response) {
        if (response.isOk) {
          List<AdsModel> result = AdsModel.listFromJson(
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
            ads.addAll(result);
            loadingMore(false);
            change(ads, status: RxStatus.success());
          }
        }
      });
    } on Response catch (response) {
      RequestResult result = errorHandler(response);
      change(null, status: RxStatus.error(result.message));
      print("getAds ${response.statusCode}");
    }
  }

  @override
  Future<void> onEndScroll() async {
    if (!lastPage) {
      page += 1;
      loadingMore(true);
      change(ads, status: RxStatus.loadingMore());
      await getAds();
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

  onAdsClicked(AdsModel ads) {
    if (ads.idItem != null && ads.typeAds != null) {
      if (ads.typeAds == TypeAds.car) {
        carDetails(ads.idItem!);
      }
    }
  }

  @override
  Future<void> onTopScroll() async {}
}
