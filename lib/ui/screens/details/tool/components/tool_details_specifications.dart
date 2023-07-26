import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:sayaaratukum/domain/controllers/application.dart';
import 'package:sayaaratukum/domain/models//tool.dart';
import 'package:sayaaratukum/ui/l10n//lang.dart';
import 'package:sayaaratukum/ui/screens/details/tool/components/title_with_description.dart';
import 'package:sayaaratukum/util/constant.dart';
import 'package:sayaaratukum/util/translate.dart';

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
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Container(
                  // color: Colors.deepOrange,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      TitleWithDescription(
                        title: L10n.brand.tr,
                        description: translateWithId(
                          translate: tool.brand.title,
                          langCode: Application.instance.getLangCode,
                        ),
                      ),
                      TitleWithDescription(
                        title: L10n.status.tr,
                        description: tool.status.tr,
                      ),
                      if (tool.serialNumber != null)
                        TitleWithDescription(
                          title: L10n.serialNumber.tr,
                          description: tool.serialNumber ?? "",
                        ),
                    ],
                  ),
                ),
              ),
              // Spacer(),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    TitleWithDescription(
                      title: L10n.model.tr,
                      description: translateWithId(
                        translate: tool.model.name,
                        langCode: Application.instance.getLangCode,
                      ),
                    ),
                    if (tool.color != null)
                      TitleWithDescription(
                        title: L10n.color.tr,
                        description: tool.color!.tr,
                      )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
