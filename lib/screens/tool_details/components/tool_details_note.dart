import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:sayaaratukum/l10n/lang.dart';
import 'package:sayaaratukum/screens/home/components/title_with_view_all.dart';
import 'package:sayaaratukum/widgets/read_more.dart';
import 'package:sayaaratukum/widgets/vertical_space.dart';

class ToolDetailsNote extends StatelessWidget {
  const ToolDetailsNote({
    Key? key,
    required this.description,
  }) : super(key: key);
  final String description;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const VerticalSpace8(),
        TitleWithViewAll(
          title: L10n.note.tr,
          paddingH: .0,
        ),
        const VerticalSpace4(),
        ReadMore(
          text: description,
        )
      ],
    );
  }
}
