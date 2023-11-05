import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do_list/data/models/to_do_item.dart';
import 'package:to_do_list/data/notifications/local/noti_channel.dart';
import 'package:to_do_list/viewmodels/auth_vm.dart';
import 'package:to_do_list/viewmodels/to_do_vm.dart';
import 'package:to_do_list/views/customs/td_au_bottom_sheet_dialog.dart';
import 'package:to_do_list/views/customs/td_dialog.dart';
import 'package:uuid/uuid.dart';

class HomeController extends GetxController {
  var activePage = 0.obs;
  var uuid = const Uuid();

  PageController pageController = PageController(initialPage: 0);
  List<String> indicatorLabelList = ["To Do", "History"];
  List<String> priorityItemList = ["First", "Second", "Third"];
  var actionAdd = "Add";
  var actionUpdate = "Update";
  var actionDelete = "Delete";
  var actionDeleteAllData = "DeleteAllData";
  var actionDeleteAllHistoryData = "DeleteAllHistoryData";
  var selectedActionItem = "Add".obs;
  RxnString selectedPriorityItem = RxnString();
  Rxn<String> currentUserName = Rxn<String>();
  late int selectedToDoItem;

  // Rxn<PriorityItem>? selectedPriority = Rxn<PriorityItem>();

  RxList<ToDoItem> doneToDoList = RxList();
  RxList<ToDoItem> unDoneToDoList = RxList();

  final ToDoViewModel toDoVM = Get.find();
  final AuthViewModel authVM = Get.find();

  final FocusNode titleFocusNode = FocusNode();
  final FocusNode descriptionFocusNode = FocusNode();
  final FocusNode dateFocusNode = FocusNode();
  final FocusNode timeFocusNode = FocusNode();

  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  final TextEditingController timeController = TextEditingController();

  @override
  void onInit() {
    _getDoneToDoList();
    _getUnDoneToDoList();
    _getCurrentUserDetail();
    super.onInit();
  }

  void _getCurrentUserDetail() async {
    var cUser = await authVM.getCurrentUser();
    currentUserName.value = cUser!.name;
  }

  void changePage(int delta) {
    pageController.animateToPage(
      pageController.page!.toInt() + delta,
      duration: const Duration(milliseconds: 300),
      curve: Curves.ease,
    );
  }

  void _getDoneToDoList() async {
    doneToDoList.clear();
    doneToDoList.value = await toDoVM.getDoneToDoList();
  }

  void _getUnDoneToDoList() async {
    unDoneToDoList.clear();
    unDoneToDoList.value = await toDoVM.getUnDoneToDoList();
  }

  void showBottomSheet(HomeController controller) {
    Get.bottomSheet(tdAUBottomSheetDialog(controller),
        backgroundColor: Colors.white,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(11), topRight: Radius.circular(11))));
  }

  void deleteToDoItme(int index) async {
    var condition = await toDoVM.deleteToDoItme(index);
    if (condition) {
      showAlertDialog("To Do Item has been deleted successfully.", true);
    } else {
      showAlertDialog("Deleting fail.", true);
    }
  }

  void updateToDoItme(int index, ToDoItem toDoItem) async {
    bool condition = await toDoVM.updateToDoItme(toDoItem, index);
    if (condition) {
      clearCashAndRefresh();
      showAlertDialog("To Do Item has been updated successfully.", true);
    } else {
      showAlertDialog("Updating fail.", true);
    }
  }

  void addToDoItme(ToDoItem toDoItem) async {
    bool condition = await toDoVM.addToDoItme(toDoItem);
    if (condition) {
      clearCashAndRefresh();
      showAlertDialog("To Do Item has been added successfully.", true);
    } else {
      showAlertDialog("To Do Item adding fail.", false);
    }
  }

  void deleteAllData() async {
    bool condition = await toDoVM.deleteAllToDoItme();
    if (condition) {
      clearCashAndRefresh();
      showAlertDialog("Delete all successfully.", true);
    } else {
      showAlertDialog("Deleting fail.", true);
    }
  }

  void deleteAllHistoryData() async {
    bool condition = await toDoVM.deleteAllHistoryToDoItme();
    if (condition) {
      clearCashAndRefresh();
      showAlertDialog("Delete all history successfully.", true);
    } else {
      showAlertDialog("Deleting fail.", false);
    }
  }

  void checkAddorUpdateToDoItme() async {
    var title = titleController.text;
    var desc = descriptionController.text;
    var date = dateController.text;
    var time = timeController.text;

    if (title.isEmpty) {
      showAlertDialog("Please,enter your name title.", false);
      return;
    }



    selectedPriorityItem.value ??= priorityItemList[2];

    var toDoItem = ToDoItem(
        uuid.v1(), title, desc, date, time, selectedPriorityItem.value, false);

    if (selectedActionItem.value == actionAdd) {
      addToDoItme(toDoItem);
      Get.back();
    } else if (selectedActionItem.value == actionUpdate) {
      updateToDoItme(selectedToDoItem, toDoItem);
      Get.back();
    }
  }

  void clearCashAndRefresh() {
    titleController.clear();
    descriptionController.clear();
    dateController.clear();
    timeController.clear();
    selectedActionItem.value = actionAdd;
    selectedPriorityItem.value = null;
    _getUnDoneToDoList();
    _getDoneToDoList();
  }

  void preparationForUpDate(ToDoItem toDoItem, int index) {
    selectedToDoItem = index;
    titleController.text = toDoItem.title;
    descriptionController.text = toDoItem.desc!;
    dateController.text = toDoItem.date!;
    timeController.text = toDoItem.time!;
    selectedPriorityItem.value = toDoItem.priorityType;
  }

  void checkPopUpAction(
      ToDoItem? toDoItem, int index, HomeController controller) {
    if (selectedActionItem.value == actionUpdate) {
      preparationForUpDate(toDoItem!, index);
      showBottomSheet(controller);
    } else if (selectedActionItem.value == actionDelete) {
      deleteToDoItme(index);
      clearCashAndRefresh();
    } else if (selectedActionItem.value == actionDeleteAllHistoryData) {
      deleteAllHistoryData();
    } else if (selectedActionItem.value == actionDeleteAllData) {
      deleteAllData();
    }
  }

  void showNoti() {
    LocalNotificationMessage(
      "nnnnn",
      "title",
      "message",
      image: null,
      channel: Channel.test,
    ).showNotification();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }
}
