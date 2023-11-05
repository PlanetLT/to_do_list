import 'dart:async';
import 'package:get/get.dart';
import 'package:to_do_list/data/models/to_do_item.dart';
import 'package:to_do_list/data/repositories/to_do_repository.dart';

class ToDoViewModel {
  static final ToDoViewModel _singleton = ToDoViewModel._internal();
  factory ToDoViewModel() => _singleton;
  ToDoViewModel._internal() {
    getUnDoneToDoList();
    getDoneToDoList();
  }

  final ToDoRepository _toDoRepo = Get.find();


  Future<List<ToDoItem>> getUnDoneToDoList() {
    return _toDoRepo.subscribeUnDoneToDoList();
  }

  Future<List<ToDoItem>> getDoneToDoList() {
    return _toDoRepo.subscribeDoneToDoList();
  }

  Future<bool> addToDoItme(ToDoItem toDoItem) {
    return _toDoRepo.addToDoItme(toDoItem);
  }

  Future<bool> updateToDoItme(ToDoItem toDoItem, int index) {
    return _toDoRepo.updateToDoItme(toDoItem, index);
  }

  Future<bool> deleteToDoItme(int index) {
    return _toDoRepo.deleteToDoItme(index);
  }

  Future<bool> deleteAllToDoItme() {
    return _toDoRepo.deleteAllToDoItme();
  }

 
}
