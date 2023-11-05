import 'package:flutter/material.dart';
import 'package:to_do_list/core/utils/hive_utils.dart';
import 'package:to_do_list/injection.dart';
import 'package:to_do_list/views/app_widget.dart';

void main() async {
  await HiveUtils.registerHive();

  await initInjection();

  runApp(const TDApp());
}
