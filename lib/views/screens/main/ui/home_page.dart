import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do_list/core/constants/colors.dart';
import 'package:to_do_list/core/utils/fonts.dart';
import 'package:to_do_list/data/models/to_do_item.dart';
import 'package:to_do_list/views/customs/td_text.dart';
import 'package:to_do_list/views/screens/main/ui/controller/home_controller.dart';

class HomePage extends GetView<HomeController> {
  static const route = "/home";
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: TDColors.backgroundColor,
        appBar: AppBar(
          backgroundColor: TDColors.backgroundColor,
          elevation: 0,
          title: Obx(
            () => TDText(
              color: TDColors.mainColor,
              text: "Welcome,${controller.currentUserName}",
              fontSize: TDFontSize.getHeadTitleFontSize(),
              isBold: true,
              textAlign: TextAlign.start,
            ),
          ),
          actions: [
            SizedBox(
              child: PopupMenuButton<String>(
                initialValue: controller.selectedActionItem.value,
                onSelected: (String item) {
                  controller.selectedActionItem.value = item;
                  controller.checkPopUpAction(null, 0, controller);
                },
                itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                  const PopupMenuItem<String>(
                    value: "DeleteAllData",
                    child: Text('Delete All Data'),
                  ),
                ],
                child: const Padding(
                  padding: EdgeInsets.only(right: 10),
                  child: Icon(
                    Icons.settings,
                    size: 26,
                    color: TDColors.mainColor,
                  ),
                ),
              ),
            )
          ],
        ),
        body: Column(
          children: [
            SizedBox(
              height: 50,
              child: Center(child: indicatior()),
            ),
            SizedBox(
              height: Get.height - 150,
              child: Obx(() => PageView(
                    controller: controller.pageController,
                    children: [toDoListWidget(), historyListWidget()],
                    onPageChanged: (int index) {
                      controller.activePage.value = index;
                    },
                  )),
            )
          ],
        ));
  }

  Widget indicatior() => Obx(
        () => Container(
          width: Get.width / 2 + 20,
          padding: const EdgeInsets.only(top: 5, bottom: 5),
          decoration: BoxDecoration(
              color: TDColors.secondMainColor,
              borderRadius: BorderRadius.circular(30)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List<Widget>.generate(
                2,
                (index) => Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: InkWell(
                        onTap: () {
                          controller.pageController.animateToPage(index,
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeIn);
                        },
                        child: Container(
                          padding: const EdgeInsets.only(
                              left: 10, right: 10, top: 3, bottom: 3),
                          decoration: BoxDecoration(
                              color: controller.activePage.value == index
                                  ? TDColors.mainColor
                                  : TDColors.secondMainColor,
                              borderRadius: BorderRadius.circular(30)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              index == 0
                                  ? Image.asset(
                                      controller.activePage.value == index
                                          ? 'assets/icons/to_do_list_with_white_color.png'
                                          : 'assets/icons/to_do_list_with_main_color.png',
                                      width: 30,
                                      height: 30,
                                    )
                                  : Image.asset(
                                      controller.activePage.value == index
                                          ? 'assets/icons/complete_with_white_color.png'
                                          : 'assets/icons/complete_with_main_color.png',
                                      width: 30,
                                      height: 30,
                                    ),
                              const SizedBox(
                                width: 10,
                              ),
                              controller.activePage.value == index
                                  ? TDText(
                                      color:
                                          controller.activePage.value == index
                                              ? TDColors.textColorWhite
                                              : TDColors.textColor,
                                      text:
                                          controller.indicatorLabelList[index],
                                      fontSize: TDFontSize.getTitleFontSize(),
                                      isBold: false,
                                      textAlign: TextAlign.start,
                                    )
                                  : const SizedBox()
                            ],
                          ),
                        ),
                      ),
                    )),
          ),
        ),
      );

  Widget toDoListWidget() => Container(
      height: Get.height - 100,
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Stack(
        children: [
          controller.unDoneToDoList.isEmpty
              ? Center(
                  child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(
                      'assets/icons/empty_to_do_list.png',
                      width: 100,
                      height: 100,
                    ),
                    const SizedBox(height: 20),
                    TDText(
                      color: TDColors.hintTextColor,
                      text: "Empty List",
                      fontSize: TDFontSize.getTitleFontSize(),
                      isBold: false,
                      textAlign: TextAlign.start,
                    )
                  ],
                ))
              : ListView(
                  children: [
                    ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: controller.unDoneToDoList.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) => GestureDetector(
                              onTap: () {
                                // Get.toNamed(
                                //     MainPage.route + GasStationDetailPage.route,
                                //     arguments: controller.recentStationList[index]);
                              },
                              child: toDoItemWidget(
                                  controller.unDoneToDoList[index], index),
                            )),
                    const SizedBox(
                      height: 80,
                    )
                  ],
                ),
          Align(
              alignment: Alignment.bottomRight,
              child: GestureDetector(
                onTap: () {
                  controller.clearCashAndRefresh();
                  controller.showBottomSheet(controller);
                  //controller.showNoti();
                },
                child: Padding(
                    padding: const EdgeInsets.only(right: 10, bottom: 30),
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: TDColors.mainColor,
                          borderRadius: BorderRadius.circular(15)),
                      child: const Icon(
                        Icons.add,
                        size: 30,
                        color: TDColors.selectedIconColor,
                      ),
                    )),
              ))
        ],
      ));

  Widget toDoItemWidget(ToDoItem toDoItem, int index) => Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 10, top: 20, left: 10),
            child: Container(
                width: Get.width - 40,
                padding: const EdgeInsets.only(
                    left: 10, right: 10, bottom: 10, top: 20),
                decoration: BoxDecoration(
                    color: TDColors.secondMainColor,
                    borderRadius: BorderRadius.circular(15)),
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            child: TDText(
                              color: TDColors.textColor,
                              text: toDoItem.title,
                              fontSize: TDFontSize.getTitleFontSize(),
                              isBold: false,
                              textAlign: TextAlign.start,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              GestureDetector(
                                child: Container(
                                  padding: const EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                      color: TDColors.mainColor,
                                      borderRadius: BorderRadius.circular(5)),
                                  child: TDText(
                                    color: TDColors.textColorWhite,
                                    text: "Finish",
                                    fontSize: TDFontSize.getDefaultFontSize(),
                                    isBold: false,
                                    textAlign: TextAlign.start,
                                  ),
                                ),
                                onTap: () {
                                  controller.updateToDoItme(
                                      index,
                                      ToDoItem(
                                          toDoItem.id,
                                          toDoItem.title,
                                          toDoItem.desc,
                                          toDoItem.date,
                                          toDoItem.time,
                                          toDoItem.priorityType,
                                          true));
                                },
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              SizedBox(
                                child: PopupMenuButton<String>(
                                  initialValue:
                                      controller.selectedActionItem.value,
                                  onSelected: (String item) {
                                    controller.selectedActionItem.value = item;
                                    controller.checkPopUpAction(
                                        toDoItem, index, controller);
                                  },
                                  itemBuilder: (BuildContext context) =>
                                      <PopupMenuEntry<String>>[
                                    const PopupMenuItem<String>(
                                      value: "Update",
                                      child: Text('Update'),
                                    ),
                                    const PopupMenuItem<String>(
                                      value: "Delete",
                                      child: Text('Delete'),
                                    ),
                                  ],
                                  child: Image.asset(
                                    'assets/icons/dots.png',
                                    width: 22,
                                    height: 22,
                                  ),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                      toDoItem.desc!.isEmpty
                          ? const SizedBox()
                          : Padding(
                              padding: const EdgeInsets.only(left: 10, top: 10),
                              child: TDText(
                                color: TDColors.textColor,
                                text: toDoItem.desc ?? "",
                                fontSize: TDFontSize.getDescFontSize(),
                                isBold: false,
                                textAlign: TextAlign.start,
                              ),
                            ),
                      toDoItem.date!.isEmpty && toDoItem.time!.isEmpty
                          ? const SizedBox()
                          : Column(
                              children: [
                                const SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    toDoItem.date!.isEmpty
                                        ? const SizedBox()
                                        : Row(
                                            children: [
                                              Container(
                                                padding:
                                                    const EdgeInsets.all(5),
                                                decoration: BoxDecoration(
                                                    color: TDColors.mainColor,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5)),
                                                child: const Icon(
                                                  Icons.date_range,
                                                  size: 15,
                                                  color: TDColors
                                                      .selectedIconColor,
                                                ),
                                              ),
                                              const SizedBox(
                                                width: 5,
                                              ),
                                              TDText(
                                                color: TDColors.textColor,
                                                text: toDoItem.date!,
                                                fontSize: TDFontSize
                                                    .getDescFontSize(),
                                                isBold: false,
                                                textAlign: TextAlign.start,
                                              )
                                            ],
                                          ),
                                    toDoItem.time!.isEmpty
                                        ? const SizedBox()
                                        : Row(
                                            children: [
                                              Container(
                                                padding:
                                                    const EdgeInsets.all(5),
                                                decoration: BoxDecoration(
                                                    color: TDColors.mainColor,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5)),
                                                child: const Icon(
                                                  Icons.timer,
                                                  size: 15,
                                                  color: TDColors
                                                      .selectedIconColor,
                                                ),
                                              ),
                                              const SizedBox(
                                                width: 5,
                                              ),
                                              TDText(
                                                color: TDColors.textColor,
                                                text: toDoItem.time!,
                                                fontSize: TDFontSize
                                                    .getDescFontSize(),
                                                isBold: false,
                                                textAlign: TextAlign.start,
                                              )
                                            ],
                                          )
                                  ],
                                )
                              ],
                            )
                    ],
                  ),
                )),
          ),
          Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                  color: toDoItem.priorityType == "First"
                      ? TDColors.firstPriorityColor
                      : toDoItem.priorityType == "Second"
                          ? TDColors.secondPriorityColor
                          : TDColors.thirdPriorityColor,
                  borderRadius: BorderRadius.circular(20)),
              child: Center(
                child: TDText(
                  color: TDColors.textColorWhite,
                  text: toDoItem.priorityType == "First"
                      ? "1st"
                      : toDoItem.priorityType == "Second"
                          ? "2nd"
                          : "3rd",
                  fontSize: TDFontSize.getDefaultFontSize(),
                  isBold: false,
                  textAlign: TextAlign.start,
                ),
              ))
        ],
      );

  Widget historyItemWidget(ToDoItem toDoItem, int index) => Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 10, top: 20, left: 10),
            child: Container(
                width: Get.width - 40,
                padding: const EdgeInsets.only(
                    left: 10, right: 10, top: 20, bottom: 10),
                decoration: BoxDecoration(
                    color: TDColors.secondMainColor,
                    borderRadius: BorderRadius.circular(15)),
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TDText(
                            color: TDColors.textColor,
                            text: toDoItem.title,
                            fontSize: TDFontSize.getTitleFontSize(),
                            isBold: false,
                            textAlign: TextAlign.start,
                          ),
                          Row(
                            children: [
                              TDText(
                                color: TDColors.textColor,
                                text: "Status:",
                                fontSize: TDFontSize.getDescFontSize(),
                                isBold: false,
                                textAlign: TextAlign.start,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              TDText(
                                color: TDColors.textColor,
                                text: toDoItem.isDone == true ? "Finish" : "",
                                fontSize: TDFontSize.getDescFontSize(),
                                isBold: false,
                                textAlign: TextAlign.start,
                              )
                            ],
                          ),
                        ],
                      ),
                      toDoItem.desc!.isEmpty
                          ? const SizedBox()
                          : Padding(
                              padding: const EdgeInsets.only(left: 10, top: 10),
                              child: TDText(
                                color: TDColors.textColor,
                                text: toDoItem.desc ?? "",
                                fontSize: TDFontSize.getDescFontSize(),
                                isBold: false,
                                textAlign: TextAlign.start,
                              ),
                            ),
                      toDoItem.date!.isEmpty || toDoItem.time!.isEmpty
                          ? const SizedBox()
                          : Column(
                              children: [
                                const SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    toDoItem.date!.isEmpty
                                        ? const SizedBox()
                                        : Row(
                                            children: [
                                              Container(
                                                padding:
                                                    const EdgeInsets.all(5),
                                                decoration: BoxDecoration(
                                                    color: TDColors.mainColor,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5)),
                                                child: const Icon(
                                                  Icons.date_range,
                                                  size: 15,
                                                  color: TDColors
                                                      .selectedIconColor,
                                                ),
                                              ),
                                              const SizedBox(
                                                width: 5,
                                              ),
                                              TDText(
                                                color: TDColors.textColor,
                                                text: toDoItem.date!,
                                                fontSize: TDFontSize
                                                    .getDescFontSize(),
                                                isBold: false,
                                                textAlign: TextAlign.start,
                                              )
                                            ],
                                          ),
                                    toDoItem.time!.isEmpty
                                        ? const SizedBox()
                                        : Row(
                                            children: [
                                              Container(
                                                padding:
                                                    const EdgeInsets.all(5),
                                                decoration: BoxDecoration(
                                                    color: TDColors.mainColor,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5)),
                                                child: const Icon(
                                                  Icons.timer,
                                                  size: 15,
                                                  color: TDColors
                                                      .selectedIconColor,
                                                ),
                                              ),
                                              const SizedBox(
                                                width: 5,
                                              ),
                                              TDText(
                                                color: TDColors.textColor,
                                                text: toDoItem.time!,
                                                fontSize: TDFontSize
                                                    .getDescFontSize(),
                                                isBold: false,
                                                textAlign: TextAlign.start,
                                              )
                                            ],
                                          )
                                  ],
                                )
                              ],
                            )
                    ],
                  ),
                )),
          ),
          Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                  color: toDoItem.priorityType == "First"
                      ? TDColors.firstPriorityColor
                      : toDoItem.priorityType == "Second"
                          ? TDColors.secondPriorityColor
                          : TDColors.thirdPriorityColor,
                  borderRadius: BorderRadius.circular(20)),
              child: Center(
                child: TDText(
                  color: TDColors.textColorWhite,
                  text: toDoItem.priorityType == "First"
                      ? "1st"
                      : toDoItem.priorityType == "Second"
                          ? "2nd"
                          : "3rd",
                  fontSize: TDFontSize.getDefaultFontSize(),
                  isBold: false,
                  textAlign: TextAlign.start,
                ),
              ))
        ],
      );

  Widget historyListWidget() => SizedBox(
      height: Get.height - 100,
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: controller.doneToDoList.isEmpty
            ? Center(
                child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    'assets/icons/empty_to_do_list.png',
                    width: 100,
                    height: 100,
                  ),
                  const SizedBox(height: 20),
                  TDText(
                    color: TDColors.hintTextColor,
                    text: "Empty History",
                    fontSize: TDFontSize.getTitleFontSize(),
                    isBold: false,
                    textAlign: TextAlign.start,
                  )
                ],
              ))
            : ListView.builder(
                itemCount: controller.doneToDoList.length,
                shrinkWrap: true,
                itemBuilder: (context, index) => GestureDetector(
                  onTap: () {
                    // Get.toNamed(
                    //     MainPage.route + GasStationDetailPage.route,
                    //     arguments: controller.recentStationList[index]);
                  },
                  child:
                      historyItemWidget(controller.doneToDoList[index], index),
                ),
              ),
      ));
}
