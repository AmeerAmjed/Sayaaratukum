import 'package:flutter/material.dart';
import 'package:sayaaratukum/models/ads.dart';
import 'package:sayaaratukum/widgets/image_loading.dart';

class CardAds extends StatelessWidget {
  const CardAds({
    Key? key,
    required this.ads,
    required this.width,
  }) : super(key: key);

  final double width;
  final AdsModel ads;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 126.0,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(4.0),
      ),
      child: ads.imageUrl != null
          ? ImageLoading(
              imageUrl: ads.imageUrl!,
            )
          : Text(
              ads.text ?? "",
              textAlign: TextAlign.center,
              // style: ThemeApp.titleTextStyle.copyWith(
              //   fontSize: 28.0,
              // ),
            ),
    );
  }
}
