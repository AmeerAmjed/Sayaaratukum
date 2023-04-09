import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sayaaratukum/l10n/lang.dart';
import 'package:sayaaratukum/models/tool.dart';
import 'package:sayaaratukum/screens/home/components/title_with_view_all.dart';
import 'package:sayaaratukum/screens/tool_details/components/imaget_tool_details.dart';
import 'package:sayaaratukum/screens/tool_details/components/tool_details_note.dart';
import 'package:sayaaratukum/screens/tool_details/components/tool_details_specifications.dart';
import 'package:sayaaratukum/util/price.dart';
import 'package:sayaaratukum/widgets/bottom_info_store.dart';
import 'package:sayaaratukum/widgets/vertical_space.dart';

class ToolDetails extends StatelessWidget {
  const ToolDetails({
    Key? key,
    required this.tool,
  }) : super(key: key);

  final ToolModel tool;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(tool.name),
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          ImageToolDetails(
            imageUrl: tool.imageUrl,
          ),
          const VerticalSpace8(),
          Text(
            tool.name,
            style: Get.textTheme.labelLarge?.copyWith(
              overflow: TextOverflow.ellipsis,
              fontWeight: FontWeight.w500,
            ),
            maxLines: 1,
          ),
          const VerticalSpace8(),
          Text(
            currency(tool.price),
            style: Get.textTheme.titleMedium,
            maxLines: 1,
          ),
          const VerticalSpace16(),
          TitleWithViewAll(
            title: L10n.specifications.tr,
            paddingH: .0,
          ),
          const VerticalSpace4(),
          ToolDetailsSpecifications(
            tool: tool,
          ),
          if (tool.description != null)
            ToolDetailsNote(
              description: tool.description!,
            )
        ],
      ),
      bottomNavigationBar: BottomInfoStore(
        nameStore: tool.name,
        address: tool.store.address,
        whatsappNumberPhone: tool.store.whatsappNumberPhone,
        numberPhone: tool.store.whatsappNumberPhone,
        imageUrl: tool.imageUrl,
      ),
    );
  }
}
