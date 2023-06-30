import 'package:flutter/material.dart';
import 'package:sayaaratukum/domain/models//brand.dart';
import 'package:sayaaratukum/ui/widgets//image_loading.dart';
import 'package:sayaaratukum/ui/widgets//loading.dart';

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
    return SizedBox(
      width: width + 50,
      height: width,
      child: Card(
        child: ImageLoading(
          imageUrl: item.imageUrl,
          fitImage: BoxFit.fill,
        ),
      ),

      // Column(
      //   children: [
      //     SizedBox(
      //       width: width,
      //       height: width,
      //       child: Card(
      //         child: ImageLoading(
      //           imageUrl: item.imageUrl,
      //           fitImage: BoxFit.fill,
      //         ),
      //       ),
      //     ),
      //     const VerticalSpace4(),
      //     Expanded(
      //       child: Padding(
      //         padding: const EdgeInsets.symmetric(
      //           horizontal: Constants.spacing,
      //         ),
      //         child: Text(
      //           item.title.capitalize ?? "",
      //           style: Theme.of(context).textTheme.overline?.copyWith(
      //                 overflow: TextOverflow.ellipsis,
      //               ),
      //           maxLines: 1,
      //         ),
      //       ),
      //     )
      //   ],
      // ),
    );
  }
}

class BrandItemLoading extends StatelessWidget {
  const BrandItemLoading({
    Key? key,
    required this.width,
  }) : super(key: key);

  final double width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Column(
        children: [
          SizedBox(
            width: width,
            height: width,
            child: const Loading(),
          ),
          const Spacer()
        ],
      ),
    );
  }
}