import 'package:flutter/material.dart';
import 'package:sayaaratukum/util/constant.dart';

class ImageLoading extends StatelessWidget {
  const ImageLoading({
    Key? key,
    required this.imageUrl,
    this.placeholder = Constants.loadingImage,
  }) : super(key: key);

  final String imageUrl;
  final String placeholder;

  @override
  Widget build(BuildContext context) {
    return FadeInImage.assetNetwork(
      width: double.maxFinite,
      height: double.maxFinite,
      placeholder: placeholder,
      fadeOutCurve: Curves.slowMiddle,
      fadeInCurve: Curves.slowMiddle,
      image: imageUrl,
      fit: BoxFit.cover,
      imageErrorBuilder: (c, s, o) => Image.asset(
        Constants.image,
        fit: BoxFit.cover,
      ),
    );
  }
}
