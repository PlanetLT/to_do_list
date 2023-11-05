import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do_list/core/constants/colors.dart';
import 'package:to_do_list/core/utils/fonts.dart';
import 'package:to_do_list/views/customs/td_text.dart';

void showAlertDialog(String content, bool condition) {
  Get.dialog(
      AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        alignment: Alignment.center,
        content: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            condition
                ? const Icon(
                    Icons.notifications,
                    size: 30,
                    color: TDColors.mainColor,
                  )
                : const Icon(
                    Icons.warning,
                    size: 30,
                    color: TDColors.mainColor,
                  ),
            const SizedBox(
              width: 10,
            ),
            Flexible(
                child: TDText(
              color: TDColors.textColor,
              text: content,
              fontSize: TDFontSize.getTitleFontSize(),
              isBold: false,
              textAlign: TextAlign.start,
            ))
          ],
        ),
      ),
      barrierDismissible: false);
  Future.delayed(const Duration(seconds: 1), () {
    Get.back();
  });
}
