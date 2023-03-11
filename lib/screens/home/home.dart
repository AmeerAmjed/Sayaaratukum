import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sayaaratukum/l10n/lang.dart';
import 'package:sayaaratukum/screens/home/components/title_with_view_all.dart';
import 'package:sayaaratukum/widgets/appbars.dart';
import 'package:sayaaratukum/widgets/box.dart';
import 'package:sayaaratukum/widgets/image_loading.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    // var brand = [
    //   BrandModel(
    //       id: 0,
    //       title: "Mercedes",
    //       imageUrl:
    //           'https://www.freepnglogos.com/uploads/food-png/food-grass-fed-beef-foodservice-products-grass-run-farms-4.png')
    // ];
    return Scaffold(
      appBar: const AppBars(
        widget: Box(
          size: 48.0,
          child: ImageLoading(
            imageUrl: "https://avatars.githubusercontent.com/u/45900975?v=4",
          ),
        ),
        actions: [
          FittedBox(
            child: Box(
              size: 38,
              child: Icon(
                Iconsax.notification,
                size: 20,
              ),
            ),
          )
        ],
      ),
      body: ListView(
        children: [
          TitleWithViewAll(
            title: L10n.brands.tr,
            onPressed: () {},
          ),
          // SizedBox(
          //   height: 100,
          //   width: MediaQuery.of(context).size.width,
          //   child: ListView.separated(
          //     // controller: myads.scroll,
          //     scrollDirection: Axis.horizontal,
          //     padding: const EdgeInsets.symmetric(
          //       horizontal: Constants.spacingMedium,
          //     ),
          //     shrinkWrap: true,
          //     itemCount: 23,
          //     separatorBuilder: (context, index) => const Space(
          //       width: Constants.spacing,
          //     ),
          //     itemBuilder: (context, index) {
          //       return InkWell(
          //         onTap: () {
          //           // TopAdsController.to.onClickItem(state[index].id);
          //         },
          //         child: BrandItem(
          //           item: brand[0],
          //           width: 72,
          //         ),
          //       );
          //     },
          //   ),
          // ),

        ],
      ),
    );
  }
}
