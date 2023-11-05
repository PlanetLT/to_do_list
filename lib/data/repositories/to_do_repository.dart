import 'package:get/get.dart';
import 'package:to_do_list/data/models/to_do_item.dart';
import 'package:to_do_list/data/services/local/local_item_save_service.dart';

abstract class ToDoRepository {
  Future<bool> deleteToDoItme(int index);
  Future<bool> addToDoItme(ToDoItem toDoItem);
  Future<bool> updateToDoItme(ToDoItem toDoItem, int index);
  Future<bool> deleteAllToDoItme();
  Future<bool> deleteAllHistoryToDoItme();

  Future<List<ToDoItem>> subscribeAllToDoList();
  Future<List<ToDoItem>> subscribeUnDoneToDoList();
  Future<List<ToDoItem>> subscribeDoneToDoList();
}

class ToDoRepositoryImpl implements ToDoRepository {
  static final ToDoRepositoryImpl _singleton = ToDoRepositoryImpl._internal();
  ToDoRepositoryImpl._internal();
  factory ToDoRepositoryImpl() => _singleton;

  final LocalToDoService local = Get.find<LocalToDoService>();

  @override
  Future<bool> addToDoItme(ToDoItem toDoItem) {
    return local.addToDoItem(toDoItem);
  }

  @override
  Future<bool> deleteToDoItme(int index) {
    return local.deleteToDoItme(index);
  }

  @override
  Future<List<ToDoItem>> subscribeAllToDoList() {
    return local.getAllToDoList();
  }

  @override
  Future<List<ToDoItem>> subscribeDoneToDoList() {
    return local.getAllDoneToDoList();
  }

  @override
  Future<List<ToDoItem>> subscribeUnDoneToDoList() {
    return local.getAllUnDoneToDoList();
  }

  @override
  Future<bool> updateToDoItme(ToDoItem toDoItem, int index) {
    return local.updateToDoItme(toDoItem, index);
  }

  @override
  Future<bool> deleteAllHistoryToDoItme() {
    return local.deleteAllHistoryItem();
  }

  @override
  Future<bool> deleteAllToDoItme() async {
    await local.deleteAllToDoList();
    return true;
  }
}
