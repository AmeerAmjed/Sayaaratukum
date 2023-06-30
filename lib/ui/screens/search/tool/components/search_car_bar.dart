import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sayaaratukum/domain/controllers/public/filter/filter_car.dart';
import 'package:sayaaratukum/ui/l10n//lang.dart';
import 'package:sayaaratukum/ui/screens/home/components/search.dart';
import 'package:sayaaratukum/ui/screens/home/widget/filter_car.dart';
import 'package:sayaaratukum/ui/theme//color.dart';
import 'package:sayaaratukum/ui/widgets//bottom_sheet.dart';
import 'package:sayaaratukum/ui/widgets//buttons.dart';

class SearchCarBar extends StatelessWidget {
  const SearchCarBar({
    Key? key,
    required this.onSubmittedSearch,
    required this.onPressedApplyFilter,
  }) : super(key: key);

  final VoidCallback onPressedApplyFilter;
  final Function(String)? onSubmittedSearch;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FilterCarController>(
      builder: (search) {
        return SearchBox(
          hintText: L10n.searchCar.tr,
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
              widget: const FilterCar(),
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
