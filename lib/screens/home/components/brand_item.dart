import 'package:flutter/material.dart';
import 'package:sayaaratukum/models/brand.dart';
import 'package:sayaaratukum/widgets/image_loading.dart';

class BrandItem extends StatelessWidget {
  const BrandItem({
    Key? key,
    required this.item,
    required this.width,
  }) : super(key: key);

  final BrandModel item;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SizedBox(
            width: width,
            height: width,
            child: Card(
              child: ImageLoading(
                imageUrl: item.imageUrl,
              ),
            ),
          ),
          Expanded(child: Text(item.title))
        ],
      ),
    );
  }
}
