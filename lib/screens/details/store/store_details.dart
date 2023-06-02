import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sayaaratukum/controllers/public/store/store_car_details.dart';
import 'package:sayaaratukum/l10n/lang.dart';
import 'package:sayaaratukum/screens/home/components/title_with_view_all.dart';
import 'package:sayaaratukum/widgets/appbars.dart';
import 'package:sayaaratukum/widgets/vertical_space.dart';

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
      ),
      body: SizedBox(
        height: double.maxFinite,
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
    );
  }
}
