import 'package:flutter/material.dart';

MaterialTapTargetSize tapTargetSize = MaterialTapTargetSize.padded;
TextDirection textDirection = TextDirection.ltr;

Future showTimePickerDialog(
    TimeOfDay? selectedTime, BuildContext? context) async {
  final TimeOfDay? time = await showTimePicker(
    context: context!,
    initialTime: selectedTime ?? TimeOfDay.now(),
    orientation: Orientation.portrait,
    builder: (BuildContext context, Widget? child) {
      return Theme(
        data: Theme.of(context).copyWith(
          materialTapTargetSize: tapTargetSize,
        ),
        child: Directionality(
          textDirection: textDirection,
          child: MediaQuery(
            data: MediaQuery.of(context).copyWith(
              alwaysUse24HourFormat: false,
            ),
            child: child!,
          ),
        ),
      );
    },
  );
  selectedTime=time;
  return selectedTime!.format(context).toString();
}
