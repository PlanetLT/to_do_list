import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do_list/core/constants/colors.dart';
import 'package:to_do_list/core/utils/fonts.dart';
import 'package:to_do_list/views/customs/td_text.dart';
import 'package:to_do_list/views/screens/splash/ui/controller/splash_controller.dart';

class SplashPage extends GetView<SplashController> {
  static const route = "/splash";
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TDColors.mainColor,
      body: Stack(
        children: [
          Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
            children: [
              ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(38)),
                  child: Container(
                    color: TDColors.selectedIconColor,
                    padding: const EdgeInsets.all(3),
                    child: Image.asset(
                      'assets/icons/logo.png',
                      width: 70,
                      height: 70,
                    ),
                  )),
                  const SizedBox(height: 20,),
              TDText(
                color: TDColors.textColorWhite,
                text: "To Do List",
                fontSize: TDFontSize.getTitleFontSize(),
                isBold: true,
                textAlign: TextAlign.start,
              ),
            ],
          )),
          Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: TDText(
                  color: TDColors.textColorWhite,
                  text: "© 2023 TO DO App.Developed by ....",
                  fontSize: TDFontSize.getDefaultFontSize(),
                  isBold: false,
                  textAlign: TextAlign.start,
                ),
              ))
        ],
      ),
    );
  }
}
