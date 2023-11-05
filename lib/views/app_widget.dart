import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do_list/core/constants/colors.dart';
import 'package:to_do_list/views/routes/app_routes.dart';

class TDApp extends StatefulWidget {
  const TDApp({Key? key}) : super(key: key);

  @override
  State<TDApp> createState() => _TDAppState();
}

class _TDAppState extends State<TDApp> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "TO DO App",
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.initialRoute,
      getPages: AppRoutes.pages,
      locale: Get.locale ?? const Locale("en"),
      fallbackLocale: const Locale("en", "UK"),
      defaultTransition: Transition.fade,
      theme: ThemeData(
        scaffoldBackgroundColor: TDColors.backgroundColor,
        primaryColor: TDColors.mainColor,
        colorScheme: const ColorScheme.light().copyWith(
          secondary: TDColors.secondMainColor,
          primary: TDColors.mainColor,
        ),
      ),
    );
  }
}
