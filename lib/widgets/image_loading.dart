import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:sayaaratukum/util/constant.dart';
import 'package:sayaaratukum/widgets/loading.dart';

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
    return CachedNetworkImage(
      width: double.maxFinite,
      height: double.maxFinite,
      fadeOutCurve: Curves.slowMiddle,
      fadeInCurve: Curves.slowMiddle,
      imageUrl: imageUrl,
      fit: BoxFit.cover,
      placeholder: (context, url) => const Loading(),
      errorWidget: (context, url, error) => Image.asset(
        Constants.image,
        fit: BoxFit.cover,
      ),
    );
  }
}
