import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sayaaratukum/domain/controllers/application.dart';
import 'package:sayaaratukum/domain/controllers/public/store/store_car_details.dart';
import 'package:sayaaratukum/ui/l10n//lang.dart';
import 'package:sayaaratukum/ui/widgets//popup_menu.dart';
import 'package:sayaaratukum/ui/widgets//space.dart';

class ButtonEditeProfile extends StatelessWidget {
  const ButtonEditeProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<StoreCarDetailsController>(builder: (state) {
      var user = Application.instance.user?.value;
      var idStore = state.idStore.value;
      if (user != null) {
        if (idStore != "0" && user.myStoreId.toString() == idStore) {
          return PopupMenu(
            titles: const [L10n.profile],
            onSelected: (value) {
              switch (value) {
                case L10n.profile:
                  state.navigateToUpdateStoreProfile(
                    Application.instance.user?.value?.myStoreId ?? 0,
                  );
                  break;
              }
            },
          );
        }
      }

      return const Space();
    });
  }
}
