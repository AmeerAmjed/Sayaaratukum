import 'package:get/get_connect/http/src/response/response.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_notifier.dart';
import 'package:get/instance_manager.dart';
import 'package:sayaaratukum/controllers/application.dart';
import 'package:sayaaratukum/controllers/controller.dart';
import 'package:sayaaratukum/models/favorite.dart';
import 'package:sayaaratukum/services/remote/user/favorite.dart';

class FavoriteController extends BaseController
    with StateMixin<List<FavoriteModel>> {
  static FavoriteController get instance => Get.find();

  var favorites = <FavoriteModel>[].obs.toList(growable: true);

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
      change(null, status: RxStatus.error("Not Login"));
    }
  }

  Future<void> getFavorite() async {
    try {
      await FavoriteService.instance.getAllFavorite().then((response) {
        print("ameer response $response");
        if (response.isOk) {
          List<FavoriteModel> result = FavoriteModel.listFromJson(
            response.body[data],
          );

          if (result == [] || result.isEmpty) {
            change(null, status: RxStatus.empty());
          } else {
            favorites.addAll(result);
            change(favorites, status: RxStatus.success());
          }
        }
      });
    } on Response catch (response) {
      change(null, status: RxStatus.error());
      print("getFavorite ${response.statusCode} ${response.body} ");
    }
  }

  loadingData() {
    change(null, status: RxStatus.loading());
  }
}
