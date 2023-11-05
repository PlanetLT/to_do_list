import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do_list/core/constants/colors.dart';
import 'package:to_do_list/core/utils/fonts.dart';
import 'package:to_do_list/views/customs/td_text.dart';
import 'package:to_do_list/views/customs/td_text_field.dart';
import 'package:to_do_list/views/screens/main/ui/controller/home_controller.dart';

Widget tdAUBottomSheetDialog(HomeController controller) => SizedBox(
        child: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () {
              controller.clearCashAndRefresh();

              Get.back();
            },
            child: Align(
              alignment: Alignment.topRight,
              child: Container(
                padding: const EdgeInsets.only(top: 10, right: 10),
                child: const Icon(
                  Icons.close,
                  size: 20,
                  color: TDColors.mainColor,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TDTextField(
                    isReadOnly: false,
                    controller: controller.titleController,
                    currentFocusNode: controller.titleFocusNode,
                    nextFocusNode: controller.descriptionFocusNode,
                    textInputType: TextInputType.text,
                    title: "Title(required)",
                    hintText: "Enter title",
                    spacing: 7,
                    alignLabelWithHint: false,
                    isNeedDatePicker: false,
                    isNeedTimePicker: false,
                    isPrefixIcon: true,
                    prefixIcon: const Icon(
                      Icons.title,
                      size: 20,
                      color: TDColors.hintTextColor,
                    )),
                const SizedBox(
                  height: 20,
                ),
                TDTextField(
                    isReadOnly: false,
                    controller: controller.descriptionController,
                    currentFocusNode: controller.descriptionFocusNode,
                    nextFocusNode: controller.dateFocusNode,
                    textInputType: TextInputType.text,
                    title: "Description(optional)",
                    hintText: "Enter description",
                    spacing: 7,
                    alignLabelWithHint: false,
                    isNeedDatePicker: false,
                    isNeedTimePicker: false,
                    isPrefixIcon: true,
                    prefixIcon: const Icon(
                      Icons.note,
                      size: 20,
                      color: TDColors.hintTextColor,
                    )),
                const SizedBox(
                  height: 20,
                ),
                TDTextField(
                    isReadOnly: true,
                    controller: controller.dateController,
                    currentFocusNode: null,
                    nextFocusNode: null,
                    textInputType: TextInputType.text,
                    title: "Date(optional)",
                    hintText: "Choose Date",
                    spacing: 7,
                    alignLabelWithHint: false,
                    isNeedDatePicker: true,
                    isNeedTimePicker: false,
                    isPrefixIcon: true,
                    prefixIcon: const Icon(
                      Icons.date_range,
                      size: 20,
                      color: TDColors.hintTextColor,
                    )),
                const SizedBox(
                  height: 20,
                ),
                TDTextField(
                    isReadOnly: true,
                    controller: controller.timeController,
                    currentFocusNode: null,
                    nextFocusNode: null,
                    textInputType: TextInputType.text,
                    title: "Time(optional)",
                    hintText: "Choose Time",
                    spacing: 7,
                    alignLabelWithHint: false,
                    isNeedDatePicker: false,
                    isNeedTimePicker: true,
                    isPrefixIcon: true,
                    prefixIcon: const Icon(
                      Icons.timer,
                      size: 20,
                      color: TDColors.hintTextColor,
                    )),
                const SizedBox(
                  height: 20,
                ),
                TDText(
                  color: TDColors.textColor,
                  text: "Choose Priority",
                  fontSize: TDFontSize.getDescFontSize(),
                  isBold: true,
                  textAlign: TextAlign.start,
                ),
                const SizedBox(
                  height: 10,
                ),
                Obx(
                  () => Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      priorityWidget(
                          controller.priorityItemList[0], controller),
                      priorityWidget(
                          controller.priorityItemList[1], controller),
                      priorityWidget(
                          controller.priorityItemList[2], controller),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                SizedBox(
                  width: Get.width - 40,
                  height: 50,
                  child: MaterialButton(
                    color: TDColors.mainColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(11)),
                    onPressed: () {
                      controller.checkAddorUpdateToDoItme();
                    },
                    child: TDText(
                      color: TDColors.textColorWhite,
                      text: controller.selectedActionItem.value,
                      fontSize: TDFontSize.getDefaultFontSize(),
                      isBold: false,
                      textAlign: TextAlign.start,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
              ],
            ),
          )
        ],
      ),
    ));

Widget priorityWidget(String priorityItem, HomeController controller) =>
    GestureDetector(
      onTap: () {
        controller.selectedPriorityItem.value = priorityItem;
      },
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: controller.selectedPriorityItem.value == priorityItem
            ? BoxDecoration(
                color: controller.selectedPriorityItem.value ==
                        controller.priorityItemList[0]
                    ? TDColors.firstPriorityColor
                    : controller.selectedPriorityItem.value ==
                            controller.priorityItemList[1]
                        ? TDColors.secondPriorityColor
                        : controller.selectedPriorityItem.value ==
                                controller.priorityItemList[2]
                            ? TDColors.thirdPriorityColor
                            : TDColors.mainColor,
                borderRadius: BorderRadius.circular(5))
            : BoxDecoration(
                border: Border.all(width: 1, color: TDColors.mainColor),
                borderRadius: BorderRadius.circular(5)),
        width: (Get.width - 40) / 3 - 20,
        child: TDText(
          color: controller.selectedPriorityItem.value == priorityItem
              ? TDColors.textColorWhite
              : TDColors.textColor,
          text: priorityItem,
          fontSize: TDFontSize.getDefaultFontSize(),
          isBold: false,
          textAlign: TextAlign.center,
        ),
      ),
    );
