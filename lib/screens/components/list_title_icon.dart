import 'package:flutter/material.dart';
import 'package:sayaaratukum/widgets/horizontal_space.dart';

class ListTitleIcon extends StatelessWidget {
  const ListTitleIcon({
    Key? key,
    this.color = Colors.black,
    this.trailing = const Icon(
      Icons.arrow_forward_ios,
      color: Colors.black,
    ),
    required this.title,
    required this.icon,
    this.onTap,
  }) : super(key: key);

  final String title;
  final IconData icon;
  final Color color;
  final Widget trailing;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      width: double.infinity,
      child: InkWell(
        onTap: onTap,
        child: Row(
          children: [
            const HorizontalSpace16(),
            Icon(icon, color: color),
            const HorizontalSpace8(),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text(
                title,
                style: Theme.of(context).textTheme.subtitle1!.copyWith(
                      color: color,
                    ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
