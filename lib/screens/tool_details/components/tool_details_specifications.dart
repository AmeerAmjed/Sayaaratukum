import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:sayaaratukum/l10n/lang.dart';
import 'package:sayaaratukum/models/tool.dart';
import 'package:sayaaratukum/screens/tool_details/components/title_with_description.dart';
import 'package:sayaaratukum/util/constant.dart';
import 'package:sayaaratukum/widgets/vertical_space.dart';

class ToolDetailsSpecifications extends StatelessWidget {
  const ToolDetailsSpecifications({
    Key? key,
    required this.tool,
  }) : super(key: key);
  final ToolModel tool;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(
            Constants.spacing16,
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TitleWithDescription(
                    title: L10n.make.tr,
                    description: tool.name,
                  ),
                  TitleWithDescription(
                    title: L10n.make.tr,
                    description: tool.name,
                  )
                ],
              ),
              const VerticalSpace16(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TitleWithDescription(
                    title: L10n.status.tr,
                    description: tool.status,
                  ),
                  if (tool.color != null)
                    TitleWithDescription(
                      title: L10n.color.tr,
                      description: tool.color!,
                    )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
