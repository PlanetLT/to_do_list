import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:scroll_date_picker/scroll_date_picker.dart';
import 'package:to_do_list/core/constants/colors.dart';

class TDDatePickerDialog extends StatefulWidget {
  final TextEditingController typeController;
  final bool isDob;
  final bool isRelatedFarmInfo;
  final int farmPreOrderDate;
  final List<DateTime> specialDates;
  const TDDatePickerDialog(
      {Key? key,
      required this.typeController,
      this.isDob = false,
      this.isRelatedFarmInfo = false,
      this.farmPreOrderDate = 0,
      required this.specialDates})
      : super(key: key);

  @override
  State<TDDatePickerDialog> createState() => _TDDatePickerDialogState();
}

class _TDDatePickerDialogState extends State<TDDatePickerDialog> {
  //DateRangePickerController datePickerController = DateRangePickerController();
  DateTime _selectedDate = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20))),
      content: SingleChildScrollView(
        child: SizedBox(
          width: double.maxFinite,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ConstrainedBox(
                constraints: BoxConstraints(
                  maxHeight: MediaQuery.of(context).size.height * 0.4,
                ),
                child: ScrollDatePicker(
                  selectedDate: _selectedDate,
                  minimumDate: DateTime(1900),
                  locale: const Locale('en'),
                  onDateTimeChanged: (DateTime value) {
                    setState(() {
                      _selectedDate = value;
                    });
                  },
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  InkWell(
                    onTap: () {
                      Get.back();
                    },
                    child: Text(
                      "cancel".tr,
                      style: const TextStyle(color: TDColors.mainColor),
                    ),
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  InkWell(
                    onTap: () {
                      Get.back();
                      widget.typeController.text =
                          DateFormat("yyyy-MM-dd").format(_selectedDate);
                    },
                    child: Text(
                      "confirm".tr,
                      style: const TextStyle(color: TDColors.mainColor),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  bool isNotSpecialDate(DateTime date) {
    for (int j = 0; j < widget.specialDates.length; j++) {
      if (date.year == widget.specialDates[j].year &&
          date.month == widget.specialDates[j].month &&
          date.day == widget.specialDates[j].day) {
        return false;
      }
    }
    return true;
  }
}

class _MonthCellDecoration extends Decoration {
  const _MonthCellDecoration(
      {this.borderColor,
      this.backgroundColor,
      required this.showIndicator,
      this.indicatorColor});

  final Color? borderColor;
  final Color? backgroundColor;
  final bool showIndicator;
  final Color? indicatorColor;

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _MonthCellDecorationPainter(
        borderColor: borderColor,
        backgroundColor: backgroundColor,
        showIndicator: showIndicator,
        indicatorColor: indicatorColor);
  }
}

/// [_MonthCellDecorationPainter] used to paint month cell decoration.
class _MonthCellDecorationPainter extends BoxPainter {
  _MonthCellDecorationPainter(
      {this.borderColor,
      this.backgroundColor,
      required this.showIndicator,
      this.indicatorColor});

  final Color? borderColor;
  final Color? backgroundColor;
  final bool showIndicator;
  final Color? indicatorColor;

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    final Rect bounds = offset & configuration.size!;
    _drawDecoration(canvas, bounds);
  }

  void _drawDecoration(Canvas canvas, Rect bounds) {
    final Paint paint = Paint()..color = backgroundColor!;
    canvas.drawRRect(
        RRect.fromRectAndRadius(bounds, const Radius.circular(5)), paint);
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = 1;
    if (borderColor != null) {
      paint.color = borderColor!;
      canvas.drawRRect(
          RRect.fromRectAndRadius(bounds, const Radius.circular(5)), paint);
    }

    if (showIndicator) {
      paint.color = indicatorColor!;
      paint.style = PaintingStyle.fill;
      canvas.drawCircle(Offset(bounds.right - 6, bounds.top + 6), 2.5, paint);
    }
  }
}
