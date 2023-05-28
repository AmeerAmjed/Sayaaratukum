import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sayaaratukum/controllers/public/store_car_details.dart';
import 'package:sayaaratukum/l10n/lang.dart';
import 'package:sayaaratukum/models/store.dart';
import 'package:sayaaratukum/screens/home/components/title_with_view_all.dart';
import 'package:sayaaratukum/screens/profile/components/avatar_with_coverUser.dart';
import 'package:sayaaratukum/screens/profile/components/contact_user.dart';
import 'package:sayaaratukum/screens/profile/components/full_name_with_bio.dart';
import 'package:sayaaratukum/widgets/appbars.dart';
import 'package:sayaaratukum/widgets/buttons.dart';
import 'package:sayaaratukum/widgets/vertical_space.dart';

import 'components/items_cars_store.dart';

class StoreCarDetails extends GetView<StoreCarDetailsController> {
  const StoreCarDetails({
    Key? key,
    required this.storeCars,
  }) : super(key: key);
  final StoreModel storeCars;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBars(
        title: storeCars.name,
      ),
      body: SizedBox(
        height: double.maxFinite,
        child: SingleChildScrollView(
          controller: controller.scroll,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              AvatarWithCoverUser(
                name: storeCars.name,
                avatar: storeCars.avatar,
                cover: storeCars.cover,
              ),
              FullNameWithBio(
                fullName: storeCars.name,
                bio: storeCars.description ?? "",
              ),
              ContactUser(
                numberPhone: storeCars.whatsappNumberPhone,
                numberPhoneWhatUp: storeCars.whatsappNumberPhone,
              ),
              Buttons(
                height: 40,
                width: double.maxFinite,
                label: L10n.subscribe.tr,
                onPressed: () {},
              ),
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
