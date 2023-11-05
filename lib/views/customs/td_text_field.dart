import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do_list/core/constants/colors.dart';
import 'package:to_do_list/core/utils/fonts.dart';
import 'package:to_do_list/views/customs/border_input_decoration.dart';
import 'package:to_do_list/views/customs/date_picker_dialog.dart';
import 'package:to_do_list/views/customs/td_text.dart';
import 'package:to_do_list/views/customs/time_picker_dialog.dart';

class TDTextField extends StatefulWidget {
  late final TextEditingController controller;
  late final FocusNode? currentFocusNode;
  late final FocusNode? nextFocusNode;
  late final String? title;
  late final String? hintText;
  late final bool alignLabelWithHint;
  late final bool isPrefixIcon;
  late final Widget? prefixIcon;
  late final int spacing;
  late final bool isReadOnly;
  late final TextInputType textInputType;
  late final bool isNeedDatePicker;
  late final bool isNeedTimePicker;
  TDTextField(
      {super.key,
      required this.controller,
      required this.currentFocusNode,
      required this.nextFocusNode,
      required this.title,
      required this.hintText,
      required this.alignLabelWithHint,
      required this.isPrefixIcon,
      required this.prefixIcon,
      required this.spacing,
      required this.isReadOnly,
      required this.isNeedDatePicker,
      required this.isNeedTimePicker,
      required this.textInputType});

  @override
  State<TDTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<TDTextField> {
  TimeOfDay? selectedTime;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        widget.title != null
            ? TDText(
                color: TDColors.textColor,
                text: widget.title!,
                fontSize: TDFontSize.getDefaultFontSize(),
                isBold: true,
                textAlign: TextAlign.start)
            : const SizedBox(),
        widget.title != null
            ? const SizedBox(
                height: 7,
              )
            : const SizedBox(),
        widget.currentFocusNode != null
            ? TextField(
                readOnly: widget.isReadOnly,
                controller: widget.controller,
                keyboardType: widget.textInputType,
                textInputAction: TextInputAction.next,
                onTap: () async {
                  if (widget.isNeedDatePicker) {
                    showDialog(
                        context: context,
                        builder: (context) => TDDatePickerDialog(
                            typeController: widget.controller,
                            isDob: true,
                            specialDates: const []));
                  }

                  if (widget.isNeedTimePicker) {
                    widget.controller.text =
                        await showTimePickerDialog(selectedTime, Get.context);
                  }
                },
                decoration: borderInputDecoration(TDColors.hintTextColor,
                    alignLabelWithHint: widget.alignLabelWithHint,
                    isPrefixIcon: widget.isPrefixIcon,
                    hinttext: widget.hintText,
                    prefixIcon: widget.prefixIcon),
                onSubmitted: (_) {
                  if (widget.nextFocusNode != null) {
                    widget.nextFocusNode!.requestFocus();
                  }
                },
                focusNode: widget.currentFocusNode,
                style: const TextStyle(color: TDColors.textColor),
                cursorColor: TDColors.hintTextColor,
              )
            : TextField(
                readOnly: widget.isReadOnly,
                controller: widget.controller,
                keyboardType: widget.textInputType,
                textInputAction: TextInputAction.next,
                onTap: () async {
                  if (widget.isNeedDatePicker) {
                    showDialog(
                        context: context,
                        builder: (context) => TDDatePickerDialog(
                            typeController: widget.controller,
                            isDob: true,
                            specialDates: const []));
                  }

                  if (widget.isNeedTimePicker) {
                    widget.controller.text =
                        await showTimePickerDialog(selectedTime, Get.context);
                  }
                },
                decoration: borderInputDecoration(
                  TDColors.hintTextColor,
                  alignLabelWithHint: false,
                  isPrefixIcon: true,
                  hinttext: widget.hintText,
                  prefixIcon: widget.prefixIcon,
                ),
                style: const TextStyle(color: TDColors.textColor),
                cursorColor: TDColors.hintTextColor,
              ),
      ],
    );
  }
}
