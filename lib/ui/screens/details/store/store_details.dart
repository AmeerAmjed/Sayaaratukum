import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sayaaratukum/domain/controllers/public/store/store_car_details.dart';
import 'package:sayaaratukum/ui/l10n//lang.dart';
import 'package:sayaaratukum/ui/screens/details/store/components/button_edite_profile.dart';
import 'package:sayaaratukum/ui/screens/home/components/title_with_view_all.dart';
import 'package:sayaaratukum/ui/widgets//appbars.dart';
import 'package:sayaaratukum/ui/widgets//vertical_space.dart';

import 'components/header_info_store.dart';
import 'components/items_cars_store.dart';

class StoreCarDetails extends GetView<StoreCarDetailsController> {
  const StoreCarDetails({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBars(
        actions: <Widget>[ButtonEditeProfile()],
      ),
      body: SizedBox(
        height: double.maxFinite,
        child: RefreshIndicator(
          onRefresh: controller.onRefreshALl,
          child: SingleChildScrollView(
            controller: controller.scroll,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const HeaderInfoStore(),
                const VerticalSpace24(),
                TitleWithViewAll(
                  title: L10n.cars.tr,
                ),
                const VerticalSpace16(),
                const ItemCarsStore()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
