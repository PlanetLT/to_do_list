import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:to_do_list/views/screens/login/binding/login_binding.dart';
import 'package:to_do_list/views/screens/login/ui/login_page.dart';
import 'package:to_do_list/views/screens/main/binding/home_binding.dart';
import 'package:to_do_list/views/screens/main/ui/home_page.dart';

import '../screens/splash/binding/splash_binding.dart';
import '../screens/splash/ui/splash_page.dart';

class AppRoutes {
  static String get initialRoute => SplashPage.route;
  static List<GetPage> get pages => [
        GetPage(
          name: SplashPage.route,
          binding: SplashBinding(),
          page: () => const AnnotatedRegion<SystemUiOverlayStyle>(
              value: SystemUiOverlayStyle(
                  statusBarColor: Colors.transparent,
                  statusBarIconBrightness: Brightness.light),
              child: SplashPage()),
        ),
        GetPage(
          name: LoginPage.route,
          binding: LoginBinding(),
          page: () => const AnnotatedRegion<SystemUiOverlayStyle>(
              value: SystemUiOverlayStyle(
                  statusBarColor: Colors.transparent,
                  statusBarIconBrightness: Brightness.light),
              child: LoginPage()),
        ),
        GetPage(
          name: HomePage.route,
          binding: HomeBinding(),
          page: () => const AnnotatedRegion<SystemUiOverlayStyle>(
              value: SystemUiOverlayStyle(
                  statusBarColor: Colors.transparent,
                  statusBarIconBrightness: Brightness.light),
              child: HomePage()),
        ),
      ];
}
