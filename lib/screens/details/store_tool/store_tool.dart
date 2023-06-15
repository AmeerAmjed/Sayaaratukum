import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sayaaratukum/controllers/application.dart';
import 'package:sayaaratukum/controllers/public/store/store_tool_details.dart';
import 'package:sayaaratukum/l10n/lang.dart';
import 'package:sayaaratukum/screens/details/store_tool/components/items_cars_store.dart';
import 'package:sayaaratukum/screens/home/components/title_with_view_all.dart';
import 'package:sayaaratukum/widgets/appbars.dart';
import 'package:sayaaratukum/widgets/popup_menu.dart';
import 'package:sayaaratukum/widgets/vertical_space.dart';

import 'components/header_info_store.dart';

class StoreToolDetails extends GetView<StoreToolDetailsController> {
  const StoreToolDetails({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBars(
        actions: <Widget>[
          PopupMenu(
            titles: const [L10n.updateProfile],
            onSelected: (value) {
              switch (value) {
                case L10n.updateProfile:
                  {
                    controller.navigateToUpdateStoreProfile(
                      Application.instance.user?.value?.myStoreId ?? 0,
                    );
                    break;
                  }
              }
            },
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: controller.onRefresh,
        child: SizedBox(
          height: double.maxFinite,
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: ListView(
              controller: controller.scroll,
                shrinkWrap: true,
                children: [
                  const HeaderInfoToolStore(),
                  const VerticalSpace24(),
                  TitleWithViewAll(
                    title: L10n.tools.tr,
                  ),
                  const VerticalSpace16(),
                  const ItemToolsStore()
                ]
            ),
          ),
        ),
      ),
    );
  }
}
