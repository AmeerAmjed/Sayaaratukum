import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sayaaratukum/controllers/public/filter/filter_tool.dart';
import 'package:sayaaratukum/l10n/lang.dart';
import 'package:sayaaratukum/screens/tools/components/filter_tool.dart';
import 'package:sayaaratukum/screens/home/components/search.dart';
import 'package:sayaaratukum/theme/color.dart';
import 'package:sayaaratukum/widgets/bottom_sheet.dart';
import 'package:sayaaratukum/widgets/buttons.dart';

class SearchToolBar extends StatelessWidget {
  const SearchToolBar({
    Key? key,
    required this.onSubmittedSearch,
    required this.onPressedApplyFilter,
  }) : super(key: key);

  final VoidCallback onPressedApplyFilter;
  final Function(String)? onSubmittedSearch;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FilterToolController>(
      builder: (search) {
        return SearchBox(
          hintText: L10n.searchTool.tr,
          onSubmitted: onSubmittedSearch,
          onChanged: search.onTextChanged,
          controller: search.search,
          suffixIcon: search.isTextEmpty.isTrue
              ? null
              : IconButton(
                  onPressed: search.clearSearch,
                  icon: const Icon(
                    CupertinoIcons.trash,
                    size: 16,
                    color: ColorSystem.colorOptional,
                  ),
                ),
          onPressedFilter: () {
            bottomSheet(
              widget: const FilterTool(),
              height: Get.mediaQuery.size.height * 0.9,
              buttonAction: Buttons(
                width: double.maxFinite,
                label: L10n.showResult.tr,
                onPressed: onPressedApplyFilter,
              ),
            );
          },
        );
      },
    );
  }
}