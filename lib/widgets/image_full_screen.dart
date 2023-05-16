import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:photo_view/photo_view.dart';

import '../screens/details/car/components/button_slide_image.dart';

showImageFullScreen(BuildContext context, String imageUrl) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        insetPadding: EdgeInsets.zero,
        child: ImageFullScreen(
          imageUrl: imageUrl,
        ),
      );
    },
  );
}

class ImageFullScreen extends StatelessWidget {
  const ImageFullScreen({
    Key? key,
    required this.imageUrl,
  }) : super(key: key);

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      height: double.maxFinite,
      child: Stack(
        children: [
          Center(
            child: PhotoView(
              backgroundDecoration: const BoxDecoration(
                color: Colors.white,
              ),
              imageProvider: Image.network(
                imageUrl,
              ).image,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: ButtonSlideImage(
              onPressed: () => Get.back(),
              backgroundColor: Get.theme.primaryColor.withOpacity(0.2),
              icon: Icons.close_rounded,
            ),
          ),
        ],
      ),
    );
  }
}
