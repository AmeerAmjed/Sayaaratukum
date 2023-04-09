import 'package:flutter/material.dart';
import 'package:sayaaratukum/widgets/image_loading.dart';

class ImageToolDetails extends StatelessWidget {
  const ImageToolDetails({
    Key? key,
    required this.imageUrl,
  }) : super(key: key);

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 250,
      child: Card(
        child: ImageLoading(
          imageUrl: imageUrl,
        ),
      ),
    );
  }
}
