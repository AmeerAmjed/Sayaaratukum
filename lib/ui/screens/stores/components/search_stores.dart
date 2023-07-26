import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sayaaratukum/domain/controllers/public/stores.dart';
import 'package:sayaaratukum/ui/l10n/lang.dart';
import 'package:sayaaratukum/ui/theme/color.dart';

import '../../home/components/search.dart';

class SearchBoxStores extends StatelessWidget {
  const SearchBoxStores({
    super.key,
    required this.onSubmittedSearch,
  });

  final Function(String)? onSubmittedSearch;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<StoresController>(
      builder: (controllerSearch) {
        return SearchBox(
          hintText: L10n.searchStore.tr,
          onSubmitted: onSubmittedSearch,
          onChanged: controllerSearch.onTextChanged,
          controller: controllerSearch.search,
          iconButton: Icons.search_outlined,
          suffixIcon: controllerSearch.isTextEmpty.isTrue
              ? null
              : IconButton(
                  onPressed: controllerSearch.clearSearch,
                  icon: const Icon(
                    CupertinoIcons.trash,
                    size: 16,
                    color: ColorSystem.colorOptional,
                  ),
                ),
          onPressedFilter: () {
            onSubmittedSearch!("");
          },
        );
      },
    );
  }
}
