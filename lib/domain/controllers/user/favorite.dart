import 'package:get/get.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_notifier.dart';
import 'package:get/instance_manager.dart';
import 'package:sayaaratukum/domain/controllers/application.dart';
import 'package:sayaaratukum/domain/controllers/controller.dart';
import 'package:sayaaratukum/ui/l10n//lang.dart';
import 'package:sayaaratukum/domain/models//favorite.dart';
import 'package:sayaaratukum/data/services/remote/user/favorite.dart';
import 'package:sayaaratukum/util/error_handler.dart';

class FavoriteController extends BaseController
    with StateMixin<List<FavoriteModel>> {
  static FavoriteController get instance => Get.find();

  var favorites = <FavoriteModel>[].obs.toList(growable: true);

  RxBool disableSubmit = false.obs;

  @override
  void onInit() {
    init();
    super.onInit();
  }

  init() {
    if (Application.instance.isLogin) {
      loadingData();
      getFavorite();

    } else {
      change(null, status: RxStatus.error(L10n.notAuth));
    }
  }

  Future<void> getFavorite() async {
    favorites.clear();
    try {
      await FavoriteService.instance.getAllFavorite().then((response) {
        print("ameer response $response");
        if (response.isOk) {
          List<FavoriteModel> result = FavoriteModel.listFromJson(
            response.body[data],
          );

          // final bool emptyRepositories = response.body?.isEmpty ?? true;

          if (result.isEmpty) {
            change(null, status: RxStatus.empty());
          } else {
            favorites.addAll(result);
            change(favorites, status: RxStatus.success());
          }
        }
      });
    } on Response catch (response) {
      RequestResult result = errorHandler(response);
      change(null, status: RxStatus.error(result.message));
      print("getFavorite ${response.statusCode} ${response.body} ");
    }
  }

  Future<void> toggleFavorite(int id) async {
    try {
      await FavoriteService.instance.toggleFavorite(id).then((response) {
        if (response.isOk) {
          if (response.status.code == 200) {
            List<FavoriteModel> result = FavoriteModel.listFromJson(
              response.body[data],
            );
            showMessage(L10n.successAddFavorite.tr);
            favorites.addAll(result);
            update();
          } else if (response.status.code == 204) {
            removeItemFavorite(id);
            getFavorite();
            showMessage(L10n.successRemoveFavorite.tr);
          }
          loading(false);
        }
      });
    } on Response catch (response) {
      change(null, status: RxStatus.error());
      loading(false);
      print("getFavorite ${response.statusCode} ${response.body} ");
    }
  }

  favorite(int id) {
    changeStateLoadingItem(id, true);
    toggleFavorite(id);
    loading(true);
  }

  changeStateLoadingItem(int id, bool state) {
    favorites.firstWhere((item) {
      if (item.product?.id == id) {
        item.isLoading = state;
        return true;
      }
      return false;
    });
    update();
  }

  removeItemFavorite(int id) {
    favorites.removeWhere((item) => item.id == id);
    update();
  }

  loading(bool state) {
    disableSubmit.value = state;
    update();
  }

  loadingData() {
    change(null, status: RxStatus.loading());
  }
}
