import 'package:flutter/material.dart';
import 'package:get/get.dart';

InputDecoration borderInputDecoration(Color color,
    {String? hinttext,
    bool alignLabelWithHint = true,
    String? counterText,
    Widget? suffixIcon,
    bool isPrefixIcon = false,
    Widget? prefixIcon,
    EdgeInsetsGeometry? padding}) {
  return isPrefixIcon
      ? InputDecoration(
          contentPadding: padding ?? const EdgeInsets.all(10),
          alignLabelWithHint: alignLabelWithHint,
          labelText: alignLabelWithHint ? hinttext : null,
          hintText: alignLabelWithHint ? null : hinttext,
          hintStyle: TextStyle(
              color: color,
              fontSize: Get.locale == const Locale("my", "MM") ? 12 : 12),
          labelStyle: TextStyle(
              color: color,
              fontSize: Get.locale == const Locale("my", "MM") ? 12 : 12),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6),
            borderSide: BorderSide(color: color, width: 1),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6),
            borderSide: BorderSide(color: color, width: 1),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6),
            borderSide: BorderSide(color: color, width: 1),
          ),
          suffixIcon: suffixIcon,
          prefixIcon: prefixIcon,
          counterText: counterText)
      : InputDecoration(
          contentPadding: padding ?? const EdgeInsets.all(10),
          alignLabelWithHint: alignLabelWithHint,
          labelText: alignLabelWithHint ? hinttext : null,
          hintText: alignLabelWithHint ? null : hinttext,
          hintStyle: TextStyle(
              color: color,
              fontSize: Get.locale == const Locale("my", "MM") ? 12 : 12),
          labelStyle: TextStyle(
              color: color,
              fontSize: Get.locale == const Locale("my", "MM") ? 12 : 12),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6),
            borderSide: BorderSide(color: color, width: 1),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6),
            borderSide: BorderSide(color: color, width: 1),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6),
            borderSide: BorderSide(color: color, width: 1),
          ),
          suffixIcon: suffixIcon,
          counterText: counterText);
}
