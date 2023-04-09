import 'package:get/get.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_notifier.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:sayaaratukum/controllers/controller.dart';
import 'package:sayaaratukum/controllers/pagination.dart';
import 'package:sayaaratukum/models/ads.dart';
import 'package:sayaaratukum/services/remote/public/ads.dart';
import 'package:sayaaratukum/util/constant.dart';

class AdsController extends BaseController
    with StateMixin<List<AdsModel>>, PaginationController, ScrollMixin {
  static AdsController get instance => Get.find();

  var ads = <AdsModel>[].obs.toList(growable: true);
  RxBool isLoadingMore = false.obs;

  @override
  void onInit() {
    super.onInit();
    init();
  }

  init() {
    loading();
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
      change(null, status: RxStatus.error());
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
      Get.back();
    }
  }

  loading() {
    change(null, status: RxStatus.loading());
  }

  loadingMore(bool state) {
    isLoadingMore.value = state;
    update();
  }

  @override
  Future<void> onTopScroll() async {}
}
