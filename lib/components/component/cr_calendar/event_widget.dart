import 'package:cr_calendar/cr_calendar.dart';
import 'package:flutter/material.dart';

/// Custom event widget with rounded borders
class EventWidget extends StatelessWidget {
  const EventWidget({
    required this.drawer,
    Key? key,
  }) : super(key: key);

  final EventProperties drawer;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 3),
      padding: const EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(4)),
        color: drawer.backgroundColor,
      ),
      child: FittedBox(
        fit: BoxFit.scaleDown,
        alignment: Alignment.centerLeft,
        child: Text(
          drawer.name,
          overflow: TextOverflow.visible,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
