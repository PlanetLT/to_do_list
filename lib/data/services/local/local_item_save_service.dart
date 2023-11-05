import 'package:hive/hive.dart';
import 'package:to_do_list/data/models/to_do_item.dart';

abstract class LocalToDoService {
  Future saveAllToDoList(List<ToDoItem> noti);
  Future<List<ToDoItem>> getAllToDoList();
  Future<List<ToDoItem>> getAllUnDoneToDoList();
  Future<List<ToDoItem>> getAllDoneToDoList();

  Future deleteAllToDoList();

  Future<bool> deleteAllHistoryItem();

  // Stream<List<ToDoItem>> subscribeToDoList();
  // Stream<List<ToDoItem>> subscribeUnDoneToDoList();
  // Stream<List<ToDoItem>> subscribeDoneToDoList();

  Future<bool> addToDoItem(ToDoItem toDoItem);
  Future<bool> deleteToDoItme(index);
  Future<bool> updateToDoItme(ToDoItem toDoItem, int index);
}

class LocalToDoServiceImpl implements LocalToDoService {
  static final LocalToDoServiceImpl _singleton =
      LocalToDoServiceImpl._internal();
  LocalToDoServiceImpl._internal();
  factory LocalToDoServiceImpl() => _singleton;
  Future<Box<ToDoItem>> box = Hive.openBox<ToDoItem>("to_do_item_list");

  List<ToDoItem> _filterAndSort() {
    var b = Hive.box<ToDoItem>("to_do_item_list");
    var list = b.values.toList();
    return list;
  }

  @override
  Future deleteAllToDoList() async {
    var tBox = await box;
    await tBox.clear();
  }

  @override
  Future<List<ToDoItem>> getAllToDoList() async {
    return _filterAndSort();
  }

  @override
  Future saveAllToDoList(List<ToDoItem> toDoItems) async {
    await (await box).putAll({for (var b in toDoItems) b.id: b});
  }

  @override
  Future<List<ToDoItem>> getAllDoneToDoList() async {
    var doneToDoList =
        _filterAndSort().where((item) => item.isDone == true).toList();
    return doneToDoList;
  }

  @override
  Future<List<ToDoItem>> getAllUnDoneToDoList() async {
    var tBox = await box;
    var unDoneToDoList =
        tBox.values.where((item) => item.isDone == false).toList();
    return unDoneToDoList;
  }

  @override
  Future<bool> addToDoItem(ToDoItem toDoItem) async {
    var tBox = await box;
    tBox.add(toDoItem);
    return true;
  }

  @override
  Future<bool> deleteToDoItme(index) async {
    var tBox = await box;
    tBox.deleteAt(index);
    return true;
  }

  @override
  Future<bool> updateToDoItme(ToDoItem toDoItem, int index) async {
    var tBox = await box;
    tBox.putAt(index, toDoItem);
    return true;
  }

  @override
  Future<bool> deleteAllHistoryItem() async {
    var tBox = await box;
    var doneToDoList =
        _filterAndSort().where((item) => item.isDone == true).toList();
    for (var i = 0; i < doneToDoList.length; i++) {
      tBox.deleteAt(i);
    }
    return true;
  }
}
