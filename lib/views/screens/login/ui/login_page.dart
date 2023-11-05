import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do_list/core/constants/colors.dart';
import 'package:to_do_list/core/utils/fonts.dart';
import 'package:to_do_list/views/customs/td_text.dart';
import 'package:to_do_list/views/customs/td_text_field.dart';
import 'package:to_do_list/views/screens/login/controller/login_controller.dart';

class LoginPage extends GetView<LoginController> {
  static const route = "/login";
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: TDColors.backgroundColor,
        body: Center(
            child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                   
                    Align(
                      alignment: Alignment.topCenter,
                      child: ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(30)),
                      child: Image.asset(
                        'assets/icons/logo.png',
                        width: 70,
                        height: 70,
                      ),
                    ),
                    ),
                    const SizedBox(
                      height: 70,
                    ),
                     TDText(
                      color: TDColors.mainColor,
                      text: "Login with your name",
                      fontSize: TDFontSize.getHeadTitleFontSize(),
                      isBold: true,
                      textAlign: TextAlign.start,
                    ),
                    const SizedBox(height: 20,),
                    TDTextField(
                        isReadOnly: false,
                        controller: controller.userNameController,
                        currentFocusNode: null,
                        nextFocusNode: null,
                        textInputType: TextInputType.text,
                        title: null,
                        hintText: "Enter your name",
                        spacing: 7,
                        alignLabelWithHint: false,
                        isNeedDatePicker: false,
                        isNeedTimePicker: false,
                        isPrefixIcon: true,
                        prefixIcon: const Icon(
                          Icons.person,
                          size: 20,
                          color: TDColors.mainColor,
                        )),
                    const SizedBox(
                      height: 50,
                    ),
                    SizedBox(
                      width: Get.width - 40,
                      height: 50,
                      child: MaterialButton(
                        color: TDColors.mainColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(11)),
                        onPressed: () {
                          controller.Login();
                        },
                        child: TDText(
                          color: TDColors.textColorWhite,
                          text: "Login",
                          fontSize: TDFontSize.getDefaultFontSize(),
                          isBold: false,
                          textAlign: TextAlign.start,
                        ),
                      ),
                    ),
                  ],
                ))));
  }
}
