import 'package:flutter/material.dart';
import 'package:sayaaratukum/ui/widgets//image_full_screen.dart';
import 'package:sayaaratukum/ui/widgets//image_loading.dart';

class ImageToolDetails extends StatelessWidget {
  const ImageToolDetails({
    Key? key,
    required this.imageUrl,
  }) : super(key: key);

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showImageFullScreen(context, imageUrl);
      },
      child: SizedBox(
        width: double.infinity,
        height: 250,
        child: Card(
          child: ImageLoading(
            fitImage: BoxFit.contain,
            imageUrl: imageUrl,
          ),
        ),
      ),
    );
  }
}
