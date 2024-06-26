import 'package:get/get.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_notifier.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:sayaaratukum/domain/controllers/controller.dart';
import 'package:sayaaratukum/domain/controllers/pagination.dart';
import 'package:sayaaratukum/domain/models//brand.dart';
import 'package:sayaaratukum/ui/route/page.dart';
import 'package:sayaaratukum/data/services/remote/public/brand.dart';
import 'package:sayaaratukum/util/constant.dart';
import 'package:sayaaratukum/util/error_handler.dart';

class BrandController extends BaseController
    with StateMixin<List<BrandModel>>, PaginationController, ScrollMixin {
  static BrandController get instance => Get.find();

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
          .getAllBrand(page: page, limit: limitRepositories)
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
