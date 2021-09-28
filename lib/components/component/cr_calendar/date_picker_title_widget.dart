import 'package:flutter/material.dart';
import 'package:flutter_app_clinica_web/utils/colors.dart';
import 'package:flutter_app_clinica_web/utils/constants.dart';
import 'package:flutter_app_clinica_web/utils/extensions.dart';

class DatePickerTitle extends StatelessWidget {
  const DatePickerTitle({
    required this.date,
    Key? key,
  }) : super(key: key);

  final DateTime date;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 16),
      alignment: Alignment.centerLeft,
      child: Text(
        date.format(kMonthFormatWidthYear),
        style: const TextStyle(
          fontSize: 21,
          color: violet,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
