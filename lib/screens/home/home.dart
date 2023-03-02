import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sayaaratukum/l10n/lang.dart';
import 'package:sayaaratukum/models/brand.dart';
import 'package:sayaaratukum/screens/home/components/title_with_view_all.dart';
import 'package:sayaaratukum/util/constant.dart';
import 'package:sayaaratukum/widgets/space.dart';

import 'components/brand_item.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery
        .of(context)
        .size
        .width;
    final height = MediaQuery
        .of(context)
        .size
        .height;
    var brand = [
      BrandModel(
          id: 0,
          title: "Mercedes",
          imageUrl:
              'https://www.freepnglogos.com/uploads/food-png/food-grass-fed-beef-foodservice-products-grass-run-farms-4.png')
    ];
    return Scaffold(
      body: ListView(
        children: [
          TitleWithViewAll(
            title: L10n.brands.tr,
            onPressed: () {},
          ),
          SizedBox(
            height: 100,
            width: MediaQuery.of(context).size.width,
            child: ListView.separated(
              // controller: myads.scroll,
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(
                horizontal: Constants.spacingMedium,
              ),
              shrinkWrap: true,
              itemCount: 23,
              separatorBuilder: (context, index) => const Space(
                width: Constants.spacing,
              ),
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    // TopAdsController.to.onClickItem(state[index].id);
                  },
                  child: BrandItem(
                    item: brand[0],
                    width: 72,
                  ),
                );
              },
            ),
          ),

        ],
      ),
    );
  }
}
